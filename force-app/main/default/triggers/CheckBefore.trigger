trigger CheckBefore on Case (before update) {
    for(case check:trigger.old)
    {
     system.debug('old value'+ check.Priority);   
        
    }
for(case check2:trigger.new)
    {
    
     system.debug('new value'+ check2.Priority);
    
    }
}