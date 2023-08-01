public class AddPrimaryContact implements Queueable {
    private Contact Cont=new Contact();
   	private String State;
    
    public AddPrimaryContact(Contact con, String state){
        this.Cont=con;
        this.State=state;
        
    }
    
    public void execute(QueueableContext qc){
        List<Account> listAcc=[select id from account where BillingState =:State limit 200];
        List<Contact> conList=new List<Contact>();
        for(Account acc:listAcc){
            Contact con=Cont.clone();
            con.AccountId=acc.id;
            conList.add(con);
        }
        insert conList;
        system.debug('Puneet Ins'+conList);
        
    }

}