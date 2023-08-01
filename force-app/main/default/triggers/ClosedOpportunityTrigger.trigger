trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    /*List<task> tsk=new List<task>();
    for(Opportunity oppor:Trigger.New)
    {
        if(oppor.StageName=='Prospecting')
        tsk.add(new task(subject='Opportunity Created1',priority='Normal',WhatId=oppor.id,status='Not Started'));
        
        
    }
    insert tsk;
*/
    List<Task> taskLst=new List<Task>();
    switch on trigger.operationType{
        
        WHEN AFTER_INSERT{
            for(Opportunity opp:trigger.new){
                if(opp.StageName=='Closed Won'){
                    taskLst.add(new task(Subject='Follow Up Test Task',WhatId=opp.Id));
                }
            }
                insert taskLst;
        }
        WHEN AFTER_UPDATE{
                        for(Opportunity opp:trigger.new){
                if(opp.StageName=='Closed Won'){
                    taskLst.add(new task(Subject='Follow Up Test Task',WhatId=opp.Id));
                }
            }
                insert taskLst;
            
        }
    }
}