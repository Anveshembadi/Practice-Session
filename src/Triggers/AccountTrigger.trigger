trigger AccountTrigger on Account (before update ,after update) {
    if(Trigger.isUpdate && Trigger.isBefore){
        AccountTriggerHandler.handleActivitiesBeforeUpdate(Trigger.NEW, Trigger.oldMap);
    }
    
    if(Trigger.isUpdate && Trigger.isAfter){
        AccountTriggerHandler.handleActivitiesAfterUpdate(Trigger.NEW, Trigger.oldMap);
    }

}