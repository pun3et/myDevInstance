public class BatchApexLearning implements Database.Batchable<sObject> {
   /* public BatchApexLearning(String Query,String field,String value){
        
    }
*/    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([select id,RegUFPLSPercent__c from Service_Illustration__c]);
    }

    public void execute(Database.BatchableContext bc,List<Service_Illustration__c> servIllustrationList){
        
        for(Service_Illustration__c sil:servIllustrationList){
            sil.RegUFPLSPercent__c=7;
        }
        update servIllustrationList;
    }
    
    public void finish(Database.BatchableContext bc){
        
    }
}