public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String a){
        List<List<sObject>> obj= [FIND :a IN All Fields Returning Contact(LastName,FirstName),Lead(LastName,FirstName)];
        Return obj;
        
        }
}