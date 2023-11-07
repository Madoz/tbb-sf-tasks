public with sharing class ContactController {
    @AuraEnabled
    public static List<Contact> getContactList(){
        return [SELECT Id, Name FROM Contact LIMIT 3];
    }
}