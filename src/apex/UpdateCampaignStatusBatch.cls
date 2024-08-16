public class UpdateCampaignStatusBatch implements Database.Batchable <sObject>{ 
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select Id,Name,Status From Campaign';
        return Database.getQueryLocator(query);
    }
    public void execute (Database.BatchableContext bc, List<Campaign> campaigns){
        List<Campaign> campList = new List<Campaign>();
        for(Campaign c : Campaigns){
            if(c.status != 'completed'){
                // then change the status to completed.
                c.status = 'completed';
                campList.add(c);
            }
        }
        update campList;
        
    }
    public void finish (Database.BatchableContext bc){
        System.debug('updated');
        
    }

}