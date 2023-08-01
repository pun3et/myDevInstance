trigger AccountAddressTrigger on Account (before insert,before update,after insert, after update) {
    system.debug('trigger.newMap'+trigger.newMap);
	Map<id,Account> accountsToProcess=new Map<id,account>();
    switch on Trigger.operationType{
        When After_Insert{
            AccountTriggerHandler ath=new AccountTriggerhandler();
            ath.addOppToAcc(trigger.newMap);   
        }
        When After_Update{
            List<id> accsWithOppId=new List<id>();
            List<Opportunity> oppList=[select id,accountId from opportunity where accountId IN:(trigger.newMap.keyset())];          
            for(Opportunity opp:oppList){
                
                if(!trigger.newMap.containsKey(opp.accountId)){
                    accountsToProcess.put(opp.accountId,trigger.newMap.get(opp.accountId));
                }
                
                AccountTriggerHandler ath=new AccountTriggerhandler();
                ath.addOppToAcc(accountsToProcess);
            }
            
        }
    }
        
    If(trigger.isBefore){
        if(trigger.isInsert){
            Map<id,account> newMapAcc=new Map<id,account>();
            for(Account acc:trigger.new){
                newMapAcc.put(acc.id,acc);
                AccountTriggerHandler.addShippingPC(newMapAcc);
            }
        }
        else
            AccountTriggerHandler.addShippingPC(trigger.newMap);   
    }
}