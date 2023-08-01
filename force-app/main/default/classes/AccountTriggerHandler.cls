public class AccountTriggerHandler {
    
    public static void  addShippingPC(Map<id,Account> newTrigMap){
        system.debug('newTrigMap'+newTrigMap);
        for(Account acc:newTrigMap.values()){
            
            if(acc.Match_Billing_Address__c==true){
                acc.ShippingPostalCode=acc.BillingPostalCode;
                
            }
        }
    } 
    
    public void addOppToAcc(Map<id,Account> accsWithoutOppMap){
        List<Opportunity> lstOpp=new List<Opportunity>();
        for(Account acc:accsWithoutOppMap.values()){
            
            Opportunity opp=new Opportunity(Name='automated Opp'+' '+acc.name,AccountId=acc.Id,StageName='Prospecting',CloseDate=System.TODAY()+30);
            lstOpp.add(opp);
            
        }
        
        insert lstOpp;
        
        
    }
    //Interview scenario method
    public void createRelatedContact(List<Account> lstAcc,Map<id,Account> oldAccValues){
        // set<id> accIds=oldAccValues.keySet();
        List<Contact> conList=new List<Contact>();
        
        if(oldAccValues!=null){
            Boolean isContInsert=false;
            List<Account> existingContacts=[select id,phone,Name,Create_Related_Contact__c,(select id,phone from contacts) from Account where Id IN:oldAccValues.keySet() ];
            
            for(Account acc:existingContacts){
                
                if(acc.Create_Related_Contact__c){
                    for(Contact con:acc.Contacts){
                        if(con.Phone==acc.Phone){
                            isContInsert=false;
                            break;
                        }
                        else{
                            isContInsert=true;
                        }
                    }
                    if(isContInsert){
                        Contact con=new Contact(LastName='Trig contact of'+acc.Name,AccountId=acc.Id,Phone=acc.Phone);
                        conList.add(con);
                    }
                }
            }
        }
        
        else{
            for(Account acc:lstAcc){
                if(acc.Create_Related_Contact__c==true){
                    Contact con=new Contact(LastName='Trig contact of '+acc.Name,AccountId=acc.id,Phone=acc.Phone);
                    conList.add(con);
                } 
            }
        }
        insert conList;
    }
    
    //Check the opportunity upon update of account, and update the stage to Close Lost for the opportunities which were created more than 30 days back
    public void checkOpp(Map<id,Account> updatedAccMap){
        
        List<Opportunity> oppList=[select id,StageName,Createddate from Opportunity where AccountId IN: updatedAccMap.keySet()];
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                
                if(opp.StageName !='Closed Won' && opp.CreatedDate<system.today()-30){
                    opp.StageName='Closed Lost';
                    
                }
            }
            if(!oppList.isEmpty())
            update oppList;
        }
    }
    
    
}