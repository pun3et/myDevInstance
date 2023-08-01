@RestResource(urlMapping='/AccountRestService/*')
global class AccountRestService {
    
    @HttpPost
    global static String CreateAccountContact(string accName,string firstName,string lastName,string oppName){
        
        Account ac = new Account();
        ac.Name = accName;
        insert ac;
        
        Contact c = new Contact();
        c.LastName = lastName;
        c.FirstName = firstName;
        c.AccountId = ac.id;
        insert c;
        
        Opportunity opp = new Opportunity();
        opp.Name = oppName;
        opp.StageName = 'Prospecting';
        opp.CloseDate = System.Date.today();
        opp.AccountId = ac.id;
        insert opp;
            
        return ac.Id;
        
    }
}