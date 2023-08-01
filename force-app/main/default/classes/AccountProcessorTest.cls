@isTest
private class AccountProcessorTest {
    
    static List<Id> accIdsToCheck=new List<Id>();
    
    @testSetup
    private static void createAcc(){
        List<Account> newAccList=new List<Account>();
        for(integer i=0;i<200;i++){
            Account acc=new Account(Name='TestAcc'+i); 
            newAccList.add(acc);
        }
        insert newAccList;
        system.debug('newAccList'+newAccList);
        List<Contact> conList=new List<Contact>();
        integer count=0;
        for(Account act:newAccList){
            count=count +1;
            Contact con=new Contact(FirstName=act.name,LastName='contTest'+count,AccountId=act.id);
            accIdsToCheck.add(act.id);
            conList.add(con);
        }
        insert conList;
        system.debug('conList'+conList);
        system.debug('accIdsToCheck'+accIdsToCheck);
        

    }
    
    @isTest
    private static void countConTest(){
        List <Account> accTobeUpdated=new List<Account>();
         accTobeUpdated=[select id, Number_Of_Contacts__c from Account ];
        List<Id> newIdlist=new List<id>();
        for(Account acc:accTobeUpdated){
            
            newIdlist.add(acc.id);
        }
        Test.startTest();
        AccountProcessor.countContacts(newIdlist);
        Test.stopTest();
        
         List <Account> accTobeUpdatedNew=new List<Account>();
         accTobeUpdatedNew=[select id, Number_Of_Contacts__c from Account ];
        system.debug('accs returned are'+accTobeUpdatedNew);
        system.assertEquals(1, accTobeUpdatedNew[0].Number_Of_Contacts__c);
        
        
    }

}