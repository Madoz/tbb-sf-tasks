@isTest
private class PhoneDigitTriggerHandlerTest {
    @isTest static void testValidatePhoneDigitsFaultyNumber(){
        Contact c = new Contact();
        c.FirstName = 'test';
        c.LastName = 'testersen';
        c.Phone = '12345';

        PhoneDigitTriggerHandler.handleBeforeInsert(c);

        System.assertEquals(true, c.hasErrors());
        System.assertEquals('Contact phone number must be 8 digits', c.getErrors()[0].getMessage());
    }

    @isTest static void testValidatePhoneDigitsCorrectNumber(){
        Contact c = new Contact();
        c.FirstName = 'test';
        c.LastName = 'testersen';
        c.Phone = '12345678';

        PhoneDigitTriggerHandler.handleBeforeInsert(c);

        System.assertEquals(false, c.hasErrors());
    }
}