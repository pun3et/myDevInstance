public without sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accId){
       
        List<Account> accList=[select id,Number_Of_Contacts__c,(select id from contacts) from Account where id IN :accId ];
        system.debug('accList'+accList);
        for(Account acc:accList){
 
		acc.Number_Of_Contacts__c=acc.contacts.size();
            
            }
        update accList;
       
    }

}