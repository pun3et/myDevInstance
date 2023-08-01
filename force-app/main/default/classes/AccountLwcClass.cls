public with sharing class AccountLwcClass {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccList(){

        return [select id,Type,Name from Account limit 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> highRevenueAccount(Double annRev){

        return [select id,Type,Name,AnnualRevenue from Account where AnnualRevenue>:annRev LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> searchedAccounts(String accountName){

        String searchKey='%'+accountName+'%';
        return [select id,Type,Name,AnnualRevenue from Account where Name like :searchKey LIMIT 10];
    }

}