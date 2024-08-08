public class AccountTriggerHandler {
    public static void handleActivitiesBeforeUpdate(List<Account> newRecords,Map<Id,Account> oldMapRec){
        for(Account acc : newRecords){
            if(acc.Industry == 'Agriculture' && acc.Type == 'Prospect'){
                if(acc.Ownership != oldMapRec.get(acc.Id).Ownership && acc.Ownership == 'Private' ){
                    acc.addError('OwnerShip cant be updated');
                }
            }
        }
    }
		
}