public class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext sct){
        
        List<Lead> leads=[select id,LeadSource from lead where LeadSource=null limit 200];
        
        for(lead l:leads){
            
            l.LeadSource='Dreamforce';
        }
        update leads;
    }
    

}