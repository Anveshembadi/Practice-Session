public class ContactTriggerHandler {
    public static void handleBeforeInsert(List<Contact> newRecords){
        for(Contact contRecord : newRecords){
            if(contRecord.AccountId == null){
                contRecord.addError('parent info is necessary');
            }
        }
    }
}