trigger OpportunityTrigger on Opportunity (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OppTriggerHandler.handleActivitiesAfterUpdate(Trigger.NEW);
    }
}