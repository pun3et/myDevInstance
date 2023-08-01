public class BankAcct {
    private integer balance=0;
    public string acctName;
    //declare a public attribute named account type
    public string accttype;
    //declare a method named makeDeposit that accepts an integer named deposit
    //Within the method, add the deposit amount to the balance
    public void makeDeposit(integer deposit){
        balance=balance + deposit;
        
    }
    
    //declare a method getbalance, that returns an integer
    public integer getBalance(){
        //Return the balance attribute
        return balance;
        
    }
    

}