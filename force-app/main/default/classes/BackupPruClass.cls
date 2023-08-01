public class BackupPruClass {
/*
 save:function(component,event,helper){
        
        var action=component.get("c.createIllustration");
        
        action.setParams({
            
            ser : component.get('v.Service')
        });
        
        action.setCallback(this,function(response){
           	var state =response.getState();
            alert(state);
            
            if(state==='SUCCESS' || state==='DRAFT'){
              var responseValue=response.getReturnValue
                }
            else if(state==='INCOMPLETE'){                    
                }
                else if(state==='ERROR') {               
            }           
        },'ALL');
        
        $A.enqueueAction(action);
    
}


label.slds-form-element__label {
    display: none;




-----------------------------------------------------------------------------------


without sharing class MoneyOutController {
    
    @AuraEnabled
    public static Map<String,Object> SetServIllID(PRU_Servicing_Illustration__c SerObj, Id caseId){
        Map<String,Object> response=new Map<String,Object>();
        try{
            system.debug('Value of SerObj is'+SerObj);
            SerObj.Case__c=caseId;
            insert SerObj;
            response.put('status','pass');
        	response.put('response',SerObj);
        }
        Catch(Exception e){
            system.debug('^^^^^'+e.getLineNumber());
             system.debug('^^^^^'+e.getMessage());
            response.put('status','fail');
            response.put('response',e);
        }
        system.debug('response');
        system.debug(response.keyset());
        system.debug(response.Values());
        return response;
    }
    
    @AuraEnabled
    public static list<PRU_BankAccount__c> GetBankAccountDetails(Id CaseId){
        
        case CaseRec=[select AccountId from case where Id =:CaseId limit 1 ];
        Id getAccId = CaseRec.AccountId;
        
        list<PRU_BankAccount__c> BankDetails = [select PRU_Account__c,PRU_Bank__c,PRU_AccountName__c,PRU_SortCode__c,PRU_SortCodeMasked__c from PRU_BankAccount__c	 where PRU_Account__c=:getAccId];
        //Account getAccdetails = [select PRU_Account__r.Id,Id,Name from Account where  Id=:getAccId];
        system.debug('Bank details ->'+BankDetails);
        return BankDetails;
    }
    
    public static list<PRU_BankAccount__c> GetBankAccountDetailsFromSI(Id ServId){
        
        PRU_Servicing_Illustration__c CaseRecId=[select Case__c from PRU_Servicing_Illustration__c where Id =:ServId limit 1 ];
        Id getCaseId = CaseRecId.Case__c;
        
        case AccRecId=[select AccountId from case where Id =:getCaseId limit 1 ];
        Id getAccId = AccRecId.AccountId;
        
        list<PRU_BankAccount__c> BankDetails = [select PRU_Account__c,PRU_Bank__c,PRU_AccountName__c,PRU_SortCode__c,PRU_SortCodeMasked__c from PRU_BankAccount__c	 where PRU_Account__c=:getAccId];
       
        system.debug('Bank details ->'+BankDetails);
        return BankDetails;
    }
   
    @AuraEnabled
    public static PRU_AccountWithdrawalWrapper moneyOutWithdrawalCallout () {
        // List<Case> relCase = [select id, PRU_ProductType__c, Asset.Name, casenumber, Account.Name, Account.Pru_ConsumerId__c, Account.PRU_AgencyNumber__pc from Case where id = '5001j000002f0hNAAQ'];
        
        // withdrawalCallout = new PRU_ApigeeIntegration();
        PRU_AccountWithdrawalWrapper clientInfo = PRU_ApigeeIntegration.createNewWithdrawalFromCase('1111AJM','0011j00000S0R3gAA', 'RET224794');
        system.debug('***clientInfo*** ->'+clientInfo);
        return clientInfo;

        
    }
    
    @AuraEnabled
     public static id GetAccountDetails(Id CaseId){
        
        case CaseRec=[select AccountId from case where Id =:CaseId limit 1 ];
        Id getAccId = CaseRec.AccountId;
        
    
        return getAccId;
    }
    
    @AuraEnabled
    public static Boolean verifyCustomerBankAccountCall (String accountNumber,String sortcode) {
     
        Boolean returnValue = PRU_ApigeeIntegration.verifyCustomerBankAccount(accountNumber,sortcode);
        system.debug('Bank details ->'+returnValue);
        return returnValue;
        
    }
    
    @AuraEnabled
    public static PRU_BankAccount__c SaveBankAcc(PRU_BankAccount__c bankAccObj,Id AccId)
    {
        try{
            bankAccObj.PRU_Account__c=AccId;
            insert bankAccObj;
                        
        }
        
        catch(exception e){
            system.debug('^^^^^'+e.getLineNumber());
            system.debug('^^^^^'+e.getMessage());
            
        }
        return bankAccObj;
    }
    

}


_______________________________________________________________________________________________________________________________________________________________________

public static Map<String,Object> UpdateServIllustration(PRU_Servicing_Illustration__c SerObj, Id RecID,Map<String,Boolean> ConfirmedSecs){
        Map<String,Object> response=new Map<String,Object>();
        try{
            system.debug('Value of SerObj is'+SerObj);
            SerObj.Id=RecID;
            system.debug(ConfirmedSecs.get('isSingleUFPLS'));
            if(ConfirmedSecs.get('isSingleUFPLS'))
            {	
                
                system.debug('inside singleUFPLS');
            }
            insert SerObj;
            response.put('status','pass');
        	response.put('response',SerObj);
        }
        Catch(Exception e){
            system.debug('^^^^^'+e.getLineNumber());
             system.debug('^^^^^'+e.getMessage());
            response.put('status','fail');
            response.put('response',e);
        }
        system.debug('response');
        system.debug(response.keyset());
        system.debug(response.Values());
        return response;
    }
Map<string,PRU_TaxableIncome__c> TaxObj,


  PRU_AccountWithdrawalWrapper wrap = PRU_ApigeeIntegration.saveWithdrawalRecord(SerObj,withdrawalRec,DrawdownAllocation,PhDrawdownAllocation,SIngleUFPLSAllocation,RegularUFPLSALlocation);



 public static Map<String,Object> SetServIllID(PRU_Servicing_Illustration__c SerObj, Id caseId, PRU_AccountWithdrawalWrapper withdrawalRec,Map<string,PRU_TaxableIncome__c> TaxObj,list<String> SIngleUFPLSAllocation,list<String> RegularUFPLSALlocation,list<String> 
  
 
 */
}