public class caseTrigHandler {
    // Integer totalEscalatedCases=0, totalWorkingCases=0, totalNewCases=0;
    public void counttotalCases(map<id,Case> casesToBeAggregated,map<id,case> oldCaseMap){
        
        set<id> caseIds=casesToBeAggregated.keySet();
        set<id> accIds=new set<id>();
        List<Account> accsToBeUpdated=new List<Account>();
        system.debug('@@casesToBeAggregated'+casesToBeAggregated);
        for(Case caseRecord:casesToBeAggregated.values()){
            if(oldCaseMap!=null){
                case oldRec=oldCaseMap.get(caseRecord.id);
                if(caseRecord.Status!=oldRec.Status || caseRecord.AccountId!=oldRec.AccountId){
                    system.debug('hi, you changed the status');
                    accIds.add(caseRecord.AccountId);            
                    accIds.add(oldRec.AccountId);
                }
                
            }
            else
                accIds.add(caseRecord.AccountId);            
            
        }
        accsToBeUpdated=[select id,Total_Escalated_Cases__c,Total_New_Cases__c,Total_Working_cases__c, (select id,status from cases) from Account where id IN:(accIds)];
        system.debug('@@accsToBeUpdated'+accsToBeUpdated);
        for(Account acc:accsToBeUpdated){
            Integer totalEscalatedCases=0, totalWorkingCases=0, totalNewCases=0;
            for(Case caseRec:acc.cases){
                if(caseRec.Status=='Escalated'){
                    totalEscalatedCases=totalEscalatedCases+1;
                }
                if(caseRec.Status=='Working'){
                    totalWorkingCases=totalWorkingCases+1;
                }
                if(caseRec.Status=='New'){
                    totalNewCases=totalNewCases+1;
                }
            }
            
            //if(acc.Schema.getObject)
            acc.Total_Escalated_Cases__c=totalEscalatedCases;
            acc.Total_New_Cases__c=totalNewCases;
            acc.Total_Working_cases__c=totalWorkingCases;
        }
        update accsToBeUpdated;
        
        changeAccountRating(casesToBeAggregated,oldCaseMap);
    }
    
    public void updateCaseOnAccount(List<Case> caseList){
        List<Account> accList=new List<Account>();
        for(Case casRec:caseList){                     
                Account acc=new Account();
                acc.id=casRec.AccountId;
                acc.LatestCase__c=casRec.CaseNumber;
                accList.add(acc);               
        }
        if(!accList.isEmpty())
        update accList;
        
    }
    public void changeAccountRating(Map<id,Case> newCaseMap,Map<id,Case> oldCaseMap){
        List<Account> accIdList=new List<Account>();
        Set<Id> accIdSet=new Set<Id>();
        for(Case cas:newCaseMap.values()){
          
            Case c=oldCaseMap?.get(cas.id);
            
            if(cas.status=='Closed' && cas.Status!=c.Status){
                accIdSet.add(cas.AccountId);
            }
            
            
        }
        
        List<AggregateResult> aggResList=[select count(id) totalCount, AccountId accId from Case where Status='Closed' AND AccountId IN :accIdSet group by AccountId];
        for(AggregateResult aggres:aggResList){
            Decimal countClosedCases;
              Account acc=new Account();
            acc.id=(Id)aggres.get('accId');
            countClosedCases=(Decimal)aggres.get('totalCount');
            if(countClosedCases<2){
                acc.Rating='Cold';
            }
            else if(countClosedCases>2 && countClosedCases>5){
                acc.Rating='Warm';
            }
            else if(countClosedCases>5){
                acc.Rating='Hot';
            }            
            update acc;
            
        }
        
        
    }
    
    
    
}