trigger ContactTrigger on Contact (before insert) {
    if(Trigger.isInsert && Trigger.isBefore){
        ContactTriggerHandler.handleBeforeInsert(Trigger.NEW);
    }

}