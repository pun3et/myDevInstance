trigger CheckAfter on Case (After update) {

    for(Case check:Trigger.old)
    {    system.debug('Old value'+ ''+check.Priority);
    
}
    for(case check2:Trigger.new)
    {
        system.debug('new value'+ check2.Priority);
    }
}