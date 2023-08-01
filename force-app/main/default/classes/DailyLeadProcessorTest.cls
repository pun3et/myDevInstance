@isTest
public class DailyLeadProcessorTest {
    
    private static string CRON_EXP='0 0 0 ? * * *'; //Midnight every day

    @isTest
    private static void scheduleableTest(){
        list<Lead> Leads=new list<Lead>();
        //create the data
        for(integer i=0;i<200;i++){
            
            Lead l=new Lead(LastName='Lead'+i,Company='MeraVision',Status='Open - Not Contacted');
            Leads.add(l);
            
        }
        insert Leads;
        
        //do the test
        test.startTest();
        DailyLeadProcessor dlp=new DailyLeadProcessor();
        
        id jobId=system.schedule('scheduleApexTest',CRON_EXP,dlp);
        test.stopTest();
        
        //check the test
        List<Lead> leadList=[select id,LeadSource from lead where LeadSource='Dreamforce'];
        system.assertEquals(200, leadList.size(),'Error:Atleast one Lead wasnt updated correctly');
        List<CronTrigger> ct=[select id, TimesTriggered,NextFireTime from CronTrigger where id=:jobId];
        system.debug('Next firetime'+ct[0].NextFireTime);
        
        
        
        
    }
}