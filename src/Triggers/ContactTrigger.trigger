trigger ContactTrigger on Contact (before insert, after update) {
    if(Trigger.isInsert && Trigger.isBefore){
        ContactTriggerHandler.handleBeforeInsert(Trigger.NEW);
    }
    if(Trigger.isUpdate && Trigger.isAfter){
        ContactTriggerHandler.handleAfterUpdate(Trigger.New, Trigger.newMap);
    }

}