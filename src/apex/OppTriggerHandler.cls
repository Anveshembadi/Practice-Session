public class OppTriggerHandler {
    //public static void handleActivitiesAfterInsert(){
    //    
    //}
    
    public static void handleActivitiesBeforeUpdate(List<Opportunity> newRecords,Map<Id,Opportunity> oldMap){
        // find the record from new list, compare and find the same record in old list and then check if stage values are different are not.
        // Opportunity newopp = newRecord[0];
        // Opportunity newopp = newRecord[0];
        // The above method will only be executed for first record but we need for whole object records.
     // for(Opportunity newopp : newRecords){
        //for(Opportunity oldopp : oldRecords){
             //if(newopp.Id == oldopp.Id && newopp.StageName != oldopp.StageName){   //it is to stop executing fot othr id records everytime as new opp changed
             // the above type is used when we use list as parameter(List<Opportunity> newRecords,List<Opportunity> oldRecords)   
              
              
        for(Opportunity newOpp : newRecords){
            if(oldMap.get(newOpp.Id).StageName != newOpp.StageName){
                newOpp.Amount = newOpp.Probability * newOpp.ExpectedRevenue;
            }
        }
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
    
    
    public static void handleActivitiesAfterDelete(List<Opportunity> oldRecords){
       
        Set<Id> accountIds = new Set<Id>();
        Map<Id,Id> oppvsAccountMap = new Map<Id,Id>();
        Map<Id,Id> accIdvsOwnerIdMap = new Map<Id,Id>();
        
        for(Opportunity opp : oldRecords){
            accountIds.add(opp.AccountId);
            oppvsAccountMap.put(opp.Id, opp.AccountId);
        }
        List<Account> accountRecords = [SELECT OwnerId FROM Account WHERE Id IN : accountIds];
        for(Account acc : accountRecords){
            accIdvsOwnerIdMap.put(acc.Id, acc.OwnerId);
        }
        
           List<Task> taskRecordList = new List <Task>() ;
            for(Opportunity opp : oldRecords){
            Task taskRecord = new Task();
            taskRecord.Description ='Please investigate why opportunity was deleted';
            taskRecord.Priority ='High';
            taskRecord.OwnerId = accIdvsOwnerIdMap.get(oppvsAccountMap.get(opp.Id));
            taskRecord.Status = 'Not Started';
            taskRecord.Subject = 'Follow up';
            //taskRecord.WhatId = opp.Id;
            taskRecordList.add(taskRecord);
        }
        if(!taskRecordList.isEmpty()){
            insert taskRecordList;
        }
    }
    
    public static void deleteContactRecord(String stageName){
        List<Opportunity> oppDeleteList = [SELECT Id,StageName FROM Opportunity WHERE StageName=:stageName];
        if(oppDeleteList.size()>0){
            delete oppDeleteList;
        }
    }
   
}