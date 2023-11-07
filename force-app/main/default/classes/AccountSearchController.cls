public with sharing class AccountSearchController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String accountName){
        List<Account> accountList = new List<Account>();
        if(accountName != ''){
            String searchName = '%' + accountName + '%';
            accountList = [SELECT Id, Name FROM Account WHERE Name LIKE :searchName];
        }
        return accountList;
    }
}