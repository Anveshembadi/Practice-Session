/* If Opportunity stage is Modified , Update Opportunity Amount based on Probability * ExpectedRevenue. */

/* Whenever an opportunity is closedWon, create a task for the Opportunity owner to split 
the revenue among the team with high Priority */
trigger OpportunityTrigger on Opportunity (after update,before update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OppTriggerHandler.handleActivitiesAfterUpdate(Trigger.NEW);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
       
  
         OppTriggerHandler.handleActivitiesBeforeUpdate(Trigger.NEW,Trigger.oldMap);
        
    }
}