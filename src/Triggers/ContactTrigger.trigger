trigger ContactTrigger on Contact (before insert, after update) {
    if(Trigger.isInsert && Trigger.isBefore){
        ContactTriggerHandler.handleBeforeInsert(Trigger.NEW);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        ContactTriggerHandler.handleAfterUpdate(Trigger.New, Trigger.oldMap);
    }

}