public class OppProcessor implements Database.Batchable<sObject>,Database.stateful{
    
    public Integer recordCount = 0;
    
    public Database.Querylocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id , Name FROM Opportunity]);
    }

    public void execute (Database.BatchableContext bc, List<Opportunity> opps){
        for(Opportunity op : opps){
            op.LeadSource = 'web';
        }
        
        update opps;
        recordCount = recordCount + opps.size();
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Total Records Processed :'+ recordCount);
    }
}