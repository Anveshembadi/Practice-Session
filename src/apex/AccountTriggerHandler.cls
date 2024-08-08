// Every time in account  as website feild is updated, 
// update  the website feild on all child contacts for that account.


public class AccountTriggerHandler {
    public static void handleActivitiesBeforeUpdate(List<Account> newRecords, Map<Id,Account> oldMapRec){
        for(Account acc : newRecords){
            if(acc.Industry == 'Agriculture' && acc.Type == 'Prospect'){
                if(acc.Ownership != oldMapRec.get(acc.Id).Ownership && acc.Ownership == 'Private' ){
                    acc.addError('OwnerShip cant be updated');
                }
            }
        }
    }
    
    
    public static void handleActivitiesAfterUpdate(List<Account> newRecords, Map<Id,Account> oldMapRec){
        Map<Id,String> accToWebsiteMap = new Map<Id,String>();
        for(Account acc : newRecords){
            if(acc.Website != oldMapRec.get(acc.Id).Website){
                accToWebsiteMap.put(acc.Id,acc.Website);
            }
        }
        if(accToWebsiteMap.keySet().size()>0){
            List<Contact> addConToUpdate = new List<Contact>();
            List<Contact> conRecords= [SELECT Id , AccountId, website__c from Contact WHERE AccountId IN : accToWebsiteMap.keyset()];
            for(Contact con : conRecords){
                con.website__c = accToWebsiteMap.get(con.AccountId);
                addConToUpdate.add(con);
            }
            if(addConToUpdate.size()>0){
            update addConToUpdate;
        }
        }
        
    }
		
}