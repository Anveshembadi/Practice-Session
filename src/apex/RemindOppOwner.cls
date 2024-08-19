public class RemindOppOwner implements Schedulable {
    
    public void execute(SchedulableContext ctx){
        List<Opportunity>oppList = [SELECT Id,Name,OwnerId,CloseDate
                                   FROM Opportunity
                                   WHERE IsClosed = False AND CloseDate < TODAY];
        
        TaskUtils.remindOwners(oppList);
    }

}