public with sharing class CreateContactFromCan {
    public static void createContact(list<Candidate__c> candsFromTrigger){
        List<Account> candAccts = [SELECT Id, Name FROM Account where Name='Recruiting'];
        List<Contact> conList= new list<Contact>();
        for(Candidate__c currentCandidate:CandsFromTrigger){
            conlist.add(new Contact(
                AccountId=candAccts[0].id,
            FirstName=currentCandidate.First_Name__c,
            LastName=currentCandidate.Last_Name__c,
            Email=currentCandidate.Email__c));
        }
        Database.insert(conList);
    }
}