public class OpportunityTriggerHandler {
    Decimal totalValue=0.00;
    public void calculateTotalOpportunity(List<Opportunity> newOppList,Map<id,Opportunity> oldOppList){
        set<id> accountIds=new set<id>();
        for(Opportunity opp:newOppList){
            if(oldOppList==null && opp.Amount!=null){
                accountIds.add(opp.AccountId);
            }
            else if(!oldOppList.keyset().isEmpty() && opp.Amount!=null){
                system.debug('@@ inside Else IF ');
                Opportunity oldOppRec=oldOppList.get(opp.id);
                if(opp.AccountId!=oldOppRec.AccountId){
                    accountIds.add(opp.AccountId);
                    accountIds.add(oldOppRec.AccountId);
                    
                }
           
                else if(opp.Amount !=oldOppRec.Amount){
                    accountIds.add(opp.AccountId);
                }

            }
            
            
        }
        Map<id,Account> updateAccMap=new Map<id,Account>();
        List<AggregateResult> aggrRes=[select AccountId Ids,sum(Amount) totalOpp from opportunity where AccountId IN :accountIds group by AccountId];
        system.debug('aggrRes'+aggrRes);
        for(AggregateResult aggr:aggrRes){
            	
            Account acc=new Account();
            
            acc.id=(Id)aggr.get('Ids');
            acc.Total_Opportunity_Value_From_Trigger__c=(Decimal)aggr.get('totalOpp');
            updateAccMap.put(acc.id,acc);
            
        }
        
        if(!updateAccMap.keySet().isEmpty()){
            update updateAccMap.values();
        }
        //Alternative approach
      /*  system.debug('@@accountIds'+accountIds);
        list<Account> accList=[select id,Total_Opportunity_Value_From_Trigger__c, (select id,Amount from Opportunities) from Account where Id IN:accountIds];
        for(Account acc:accList){
             totalValue=0.00;
            for(Opportunity opp:acc.Opportunities){
                system.debug('@@opp'+opp);
                if(opp.Amount !=null)
                totalValue=totalValue + opp.Amount;
            }
            acc.Total_Opportunity_Value_From_Trigger__c=totalValue;
        }
        update accList;
*/
        
         updateHighestValueOpportunity(newOppList);
    }
    
    public void updateHighestValueOpportunity(List<Opportunity> newOppList){
        set<id> accIds =new set<id>();
        
        for(Opportunity opp:newOppList){
           accIds.add(opp.AccountId);
        }
        
        List<Account> accList=[select id, (select id from opportunities) from Account where Id IN: accIds AND Id IN (select AccountId from Opportunity)];
        
       /* for(Account acc:accList){
            
            for(Opportunity opp:acc.opportunities){
                integer maxOpp=0;
                string maxOppName;
                if(opp.Amount>maxOpp){
                    maxOpp=opp.Amount;
                    maxOppName=opp.Name;
                }
            }	
            
            acc.Highest_Opportunity_Name__c=maxOppName;
            
        }
*/
        
        
    }
    
}