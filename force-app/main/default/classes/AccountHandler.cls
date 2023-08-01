public class AccountHandler {   

         
    public static Account insertNewAccount (String a){
        Account acc;
        try{
            
           acc= new Account(Name=a);
        insert acc;
                
        }
        catch(DmlException e)
        {            
            System.Debug('Null');
            acc=null;
        }            
   return acc; 
        }
    
        
    }