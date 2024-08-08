/* If an Account is with Industry Agriculture and Type 'Prospect' is updated and 
ownership is set to private donot allow user to set this ownership */

trigger AccountTrigger on Account (before update) {
    if(Trigger.isUpdate && Trigger.isBefore){
        AccountTriggerHandler.handleActivitiesBeforeUpdate(Trigger.NEW, Trigger.oldMap);
    }

}