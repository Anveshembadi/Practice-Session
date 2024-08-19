public class DailyOppProcessor implements Schedulable{
    
    public void execute(SchedulableContext ctx){
        List<Opportunity> oppList =[SELECT Id,LeadSource FROM Opportunity
                                   Where LeadSource = null LIMIT 200];
        
        for(Opportunity opp : oppList){
            opp.LeadSource = 'Web';
        }
        if(!oppList.isEmpty()){
            update oppList;
        }
    }

}

// we can assign this schedule with UI or using code.