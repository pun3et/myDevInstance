@istest
public class TestRestrictContactByName {

    @istest static void chckDeleteAcc(){
        
        Contact con= new Contact(FirstName='Gaurav',LastName='INVALIDNAME');
        insert con;
        Test.startTest();
        Database.SaveResult InsertResult = Database.insert(con, false);
        Test.stopTest();
        
        system.assert(!InsertResult.isSuccess());
        system.assert(InsertResult.getErrors().size()>0);
       //	 System.assertequals('The Last Name  INVALIDNAME is not allowed for DML',InsertResult.getErrors()[0]);
            
    }
}