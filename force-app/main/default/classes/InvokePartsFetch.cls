public class InvokePartsFetch {
    @AuraEnabled
    public static Id fetchCqPartsData(){
        
		ID jobId=system.enqueueJob(new FetchCQParts());
        return jobId;
    }
    
    @auraEnabled(cacheable=true)
    public static string getJobStatus(string recId){
        
       AsyncApexJob obj=[SELECT Status FROM AsyncApexJob where id=:recId limit 1];
        return obj.Status;
    }

}