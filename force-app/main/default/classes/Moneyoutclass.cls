public class Moneyoutclass {

    @AuraEnabled
    
    public static Asset__c getassetid(String AssetID){
        return [select Total_Amount__c from Asset__c where id=:AssetID ];
    }
}