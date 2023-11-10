trigger ValidatePhoneDigitsTrigger on Contact (before insert) {
  if(trigger.isBefore && trigger.isInsert){
    if(!trigger.new.isEmpty()){
      for(Contact ctc : trigger.new){
        PhoneDigitTriggerHandler.handleBeforeInsert(ctc);
      }
    }
  }
}
