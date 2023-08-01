trigger ClosedOpportunityTrigger1 on Opportunity (after insert,after update) 
{    List<Task> task1=new List<Task>();
 system.debug('inside trigger');
    for(opportunity opp:Trigger.new)
    {
        system.debug('inside forloop');
       If (opp.StageName=='Closed Won')
       {
           system.debug('inside if');
        task1.add(new Task(subject='Follow Up Test Task',WhatId=opp.id,Priority = 'Normal',
                 Status = 'Not Started'));
           
       }
    }
insert task1;

}