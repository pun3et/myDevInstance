public class batchFromTrigger implements Database.Batchable<sObject> {
    List<Account> accountObj=new List<Account>();
    Boolean insertRecords;
    
    public batchFromTrigger(Account accObj,Boolean isInsert){
        
        accountObj.add(accObj);
        insertRecords=isInsert;
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query='Select id from Account limit 1';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc,List<Account> accList){
        
        if(!insertRecords){
            accountObj[0].Rating='Hot';
            system.debug('Should not insert this');
            accountObj[0].addError('Error occured');
        }
        
    }
    
    
    public void finish(Database.BatchableContext bc){
        
    }                                                                      
    
}