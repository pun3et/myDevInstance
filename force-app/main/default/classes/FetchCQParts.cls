/* Queueable class to initiate the callout */
public class FetchCQParts implements Queueable,Database.AllowsCallouts {
    
    public void execute(QueueableContext qc){
        HTTPResponse res = CqDataCallout.getPartsRecords(); 
        ProcessPartsData.processRecords(res);

    }

}