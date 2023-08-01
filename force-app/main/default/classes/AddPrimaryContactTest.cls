@isTest
public class AddPrimaryContactTest {
    
    @isTest
    private static void promaryContTest(){
        
        //Load test data
        List<Account> accList= new List<Account>();
        
        for(integer i=0;i<100;i++){
            
            Account acc=new Account(Name='State'+i);
            if(i<50){
                acc.BillingState='NY';
            }
            else
                acc.BillingState='CA';
            
            accList.add(acc);
        }
        
        insert accList;
        
        Contact con= new Contact(LastName='Atkar',Email='abc@org.com');
        //Do the test
        Test.startTest();
        AddPrimaryContact instance1=new AddPrimaryContact(con,'NY');
        Id jobId=System.enqueueJob(instance1);
        Test.stopTest();
        
        //Check results
        List<Contact> Contacts=[select id,AccountId from contact];
        List<Account> Accounts=[select id,BillingState,(select id from contacts) from account where BillingState='NY'];
        
        
            
            system.assertEquals(50, Contacts.size(),'Atleast one contact was not inserted');
        
        
        
        
        
    }

}