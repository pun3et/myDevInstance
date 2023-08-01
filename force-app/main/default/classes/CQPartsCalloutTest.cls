/* Test class to validate the callout response using mock callouts and insertion of CQ Part records */
@isTest
private class CQPartsCalloutTest {
    public static User u=new User();
    @testSetup
    static void createTestData(){
        //Create System Admin User 
        String uniqueUserName = 'adminuser' + DateTime.now().getTime() + '@testorg.com';
        // This code runs as the system user
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        u = new User(Alias = 'stadmin', Email='standarduser@testOrg.com',
                     EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                     LocaleSidKey='en_US', ProfileId = p.Id,
                     TimeZoneSidKey='America/Los_Angeles',
                     UserName=uniqueUserName);
        insert u;
        
        system.runAs(u){
            //Create Account data
            List<Account> accList =new List<Account>();
            for(integer i=0;i<2;i++){
                Account acc=new Account();
                if(i==0){
                    acc.Name='Low Volume';
                }
                else
                    acc.Name='High Volume'; 
                
                accList.add(acc);
                
            }
            insert accList;
        }
        
        
        
    }
    @isTest 
    static void testCallout() {
         u = [SELECT Id FROM User WHERE Email = 'standarduser@testOrg.com' LIMIT 1];
        // Set mock callout class 
        system.runAs(u){
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new CQPartsMockResponseClass());
            Test.stopTest();
            
            HttpResponse res = CqDataCallout.getPartsRecords();    
            String contentType = res.getHeader('Content-Type');
            System.assert(contentType == 'application/json');
            String actualValue = res.getBody();
            String expectedValue='[{"_id": "619683d69402c24f000237e9","Part Name": "Population Sensor","Total Quantity Shipped": 350000},'+
                '{"_id": "619643769402c24f000229ec","Part Name": "Drill Gauge","Total Quantity Shipped": 125000}]';
            
            System.assertEquals(actualValue, expectedValue);
            System.assertEquals(200, res.getStatusCode());
            
            ProcessPartsData.processRecords(res);
            List<SQX_Part__c> cqPartsList=[select id,Part_Name__c,Related_Account__c,Related_Account__r.Name from SQX_Part__c];
            
            system.assertEquals(2, cqPartsList.size());
            system.assertEquals('High Volume', cqPartsList[0].Related_Account__r.Name);
        }
        
    }
    
    @isTest 
    static void testQueueable(){
        u = [SELECT Id FROM User WHERE Email = 'standarduser@testOrg.com' LIMIT 1];
        system.runAs(u){
            Test.startTest();
            Test.setMock(HttpCalloutMock.class, new CQPartsMockResponseClass());
            system.enqueueJob(new FetchCQParts());
            Test.stopTest();
        }
    }
}