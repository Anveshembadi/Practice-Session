trigger OpportunityTrigger on Opportunity (after update,before update,after delete) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OppTriggerHandler.handleActivitiesAfterUpdate(Trigger.NEW);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
       
  
         OppTriggerHandler.handleActivitiesBeforeUpdate(Trigger.NEW, Trigger.oldMap);
        
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
        OppTriggerHandler.handleActivitiesAfterDelete(Trigger.OLD);
    }
}