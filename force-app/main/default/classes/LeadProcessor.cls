public class LeadProcessor implements Database.Batchable<sObject>,Database.Stateful {
    
	public integer recCount=0;    
    public Database.QueryLocator start(Database.BatchableContext dbc){
        
        return Database.getQueryLocator([select id from lead]); 
    }
    
    public void execute(Database.BatchableContext dbc, List<Lead> leads){
        
        for(Lead l:leads){
            l.LeadSource='Dreamforce';
        }
        update leads;
        recCount=recCount+leads.size();
    }
    public void finish(Database.BatchableContext dbc){
        system.debug('Processing Finished');
        system.debug('total rec processed'+ ''+recCount);
    }
    
    
    
}