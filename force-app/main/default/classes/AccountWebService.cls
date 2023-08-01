global class AccountWebService {
    
    global class AccountDetails{
        webservice string AccName;
        webservice Integer AccNumber;
        webservice string Industry;
    }
    
    webservice static Account createAccount(AccountDetails acc){
        Account acc1 = new Account();
        acc1.Name = acc.AccName;
        acc1.AccountNumber = String.valueof(acc.AccNumber);
        acc1.Industry = acc.Industry;
        insert acc1;
        return acc1;
    }
}