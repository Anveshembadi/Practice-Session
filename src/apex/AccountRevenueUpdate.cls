public class AccountRevenueUpdate implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        //need to write the soql to get the records to update.
        return Database.getQueryLocator('Select Id, AnnualRevenue From Account');
    }
    
    public void execute(Database.BatchableContext bc, List<sObject> scope){
        List<Account> accList = (List<Account>)scope;
        
        for(Account acc : accList){
            if(acc.AnnualRevenue == null){
                acc.AnnualRevenue = 15000;
            }
            else{
                acc.AnnualRevenue = acc.AnnualRevenue+15000;
            }
        }
        update accList;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Updated');
    }
}