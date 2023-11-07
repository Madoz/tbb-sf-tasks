public with sharing class ContactUpdateController {
    @AuraEnabled
    public static List<Contact> getContactList(){
        return [SELECT Id, FirstName, LastName FROM Contact LIMIT 5];
    }

    @AuraEnabled
    public static void updateContact(String contactId){
        
        Contact contact = [SELECT Id, Firstname, LastName FROM Contact WHERE Id=:contactId];
        contact.FirstName = contact.FirstName.toUpperCase();
        contact.LastName = contact.LastName.toUpperCase();
        try {
            update contact;
        } catch (Exception e) {
        }
    }
}