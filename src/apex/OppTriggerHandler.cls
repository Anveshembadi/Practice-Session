public class OppTriggerHandler {
    public static void handleActivitiesAfterInsert(){
        
    }
    public static void handleActivitiesAfterUpdate(List<Opportunity> newRecords){
        List<Task> taskListToInsert = new List<Task>();
        for(Opportunity opp : newRecords){
            if(opp.StageName == 'Closed won'){
                // creating related record - task record
                Task taskRecord = new Task();
                taskRecord.Priority='High';
                taskRecord.OwnerId = opp.OwnerId;
                taskRecord.Description='Split the revenue amongst the team members';
                taskRecord.Status='Not started';
                taskRecord.Subject='Split revenue';
                taskRecord.WhatId =opp.Id;
                taskListToInsert.add(taskRecord);
                
            }
            }
        if(!taskListToInsert.isEmpty()){
                insert taskListToInsert;
        }
    }

}