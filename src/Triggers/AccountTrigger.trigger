trigger AccountTrigger on Account (before update) {
    if(Trigger.isUpdate && Trigger.isBefore){
        AccountTriggerHandler.handleActivitiesBeforeUpdate(Trigger.NEW, Trigger.oldMap);
    }

}