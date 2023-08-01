public class contactTriggerHandler {
    
    
    public void checkCurrentContacts(List<Contact> contactList,Map<id,Contact> oldContMap){
        
        rectrictMoreThanTwoContacts(contactList);
        
        checkDuplicateContact(contactList);
        
        isPrimaryContact(contactList,oldContMap);
    }
    
    public void checkDuplicateContact(List<Contact> contactList){
        List<String> emailIds=new List<String>();
        List<String> phoneNos=new List<String>();
        for(Contact con: contactList){
            
            if(con.Email!='' || con.Email!=null)
                emailIds.add(con.Email);
            
            if(con.Phone!='' || con.Phone!=null)
                phoneNos.add(con.Phone);
            
        }
        
        List<Contact> existingContact=[select id,Email,Phone from contact where Email IN :emailIds OR Phone IN:phoneNos ];
        List<String> emailPhoneList=new List<String>();
        
        for(Contact conRec:existingContact){
            emailPhoneList.add(conRec.Email + conRec.Phone);
        }
        for(Contact conRec2:contactList){
            String emailPhoneConcat=conRec2.Email + conRec2.Phone;
            if(!emailPhoneList.isEmpty()){
                if(emailPhoneList.contains(emailPhoneConcat)){
                    conRec2.addError('This Email and Contact already Exists');
                }
            }
            
        }
        
    }
    public void rectrictMoreThanTwoContacts(List<Contact> contactList){
        
        set<id> accountIds=new set<id>();
        set<id> selectedAccIds=new set<id>();
        
        if(!contactList.isEmpty()){
            for(Contact con:ContactList){
                accountIds.add(con.AccountId);
            }
        }
        
        //Fetch the AccountId with the count of contacts and add the accounts with more than 2 contacts in selectedAccIds set
        if(!accountIds.isEmpty()){
            List<AggregateResult> aggCon=[select AccountId , count(id) aggConId  from contact where AccountId IN:accountIds group by AccountId];
            
            for(AggregateResult aggRes:aggCon){
                if((Integer)aggRes.get('aggConId')>=2){
                    selectedAccIds.add((Id)aggRes.get('AccountId'));
                }
            }
        }
        
        //Iterate over the Trigger.new and add error to the contacts whose account already had more than 2 contacts
        for(Contact con:contactList){
            if(selectedAccIds.contains(con.AccountId)){
                system.debug('inside If');
                con.addError('You cannot create a contact on account which already has 2 or more accounts');
            }
        }    
    }
    
    //New Method to check if a primary contact already exists on the account
    public void isPrimaryContact(List<Contact> conList,map<id,contact> oldContMap){
        set<id> acctIds=new set<id>();
        List<Contact> primaryConts=new List<Contact>();
        for(Contact cont:conList){
            if(cont.Direct__c==true){
                primaryConts.add(cont);
                acctIds.add(cont.AccountId);
            }
        }
        List<Contact> existingPrimaryCont=[select id,Direct__c,AccountId from Contact where Direct__c=true AND AccountId IN :acctIds];
        set<id> existingAccIds=new set<id>();
        set<id> currPrimaryContact=new set<id>();
      //  if(!existingPrimaryCont.isEmpty()){
            
            for(Contact cont:existingPrimaryCont){
                
                existingAccIds.add(cont.AccountId);
            }
            
            for(Contact cont:primaryConts){
                
                if(existingAccIds.contains(cont.AccountId)){
                    cont.addError('You cannot have 2 primary contacts associated to one Account');
                    
                }
                else if(currPrimaryContact.isEmpty() || !currPrimaryContact.contains(cont.AccountId)){
                    currPrimaryContact.add(cont.AccountId);
                }
                else if(currPrimaryContact.contains(cont.AccountId)){
                    cont.addError('You are inserting 2 direct contacts which is not permitted');
                }
            }
    //    }
        
    }
}