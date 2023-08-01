public class RegularUFPLShandler {

@AuraEnabled

    public static Service_Illustration__c createIllustration(Service_Illustration__c ser){
        
     insert ser;
        return ser;
        
    }


}