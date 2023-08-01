public class ContactSearch {
    public static List<contact> searchForContacts(String a,String b){
       
        List<contact> x=[Select Name from contact where Lastname=:a and MailingPostalCode=:b ];
    return x;
            }
}