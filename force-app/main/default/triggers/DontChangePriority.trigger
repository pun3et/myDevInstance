trigger DontChangePriority on Case (before update,after update,after insert) {
  
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isundelete ){
            
            caseTrigHandler handleCases=new caseTrigHandler();
            handleCases.counttotalCases(Trigger.newMap,null);
            
        }
       else if(trigger.isUpdate ){
            
            caseTrigHandler handleCases=new caseTrigHandler();
            handleCases.counttotalCases(Trigger.newMap,Trigger.oldMap);
        }
        
     	else if(trigger.isDelete ){
            
            caseTrigHandler handleCases=new caseTrigHandler();
            handleCases.counttotalCases(Trigger.oldMap,null);
        }
    }
    
    
    if(trigger.isbefore && trigger.isUpdate){
  for(case c:trigger.old)
  {
    If(c.status=='closed' && c.priority!=c.priority)
    {	
        c.addError('You cannot change the priority of closed case');
        system.debug('test1');
        
    }
  }
    }
}