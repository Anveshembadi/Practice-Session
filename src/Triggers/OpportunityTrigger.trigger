trigger OpportunityTrigger on Opportunity (after update,before update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OppTriggerHandler.handleActivitiesAfterUpdate(Trigger.NEW);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
       
  
         OppTriggerHandler.handleActivitiesBeforeUpdate(Trigger.NEW,Trigger.oldMap);
        
    }
}