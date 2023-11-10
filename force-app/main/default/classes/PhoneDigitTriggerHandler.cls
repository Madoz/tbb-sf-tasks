public with sharing class PhoneDigitTriggerHandler {
    public static void handleBeforeInsert(Contact ctc){
        if(ctc.Phone == null || ctc.Phone.length() != 8){
            ctc.addError('Contact phone number must be 8 digits');
            System.debug('Contact tlfnr må være 8 siffer');
        }
    }
}