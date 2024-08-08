public class ContactTriggerHandler {
    public static void handleBeforeInsert(List<Contact> newRecords){
        for(Contact contRecord : newRecords){
            if(contRecord.AccountId == null){
                contRecord.addError('parent info is necessary');
            }
        }
        List<Contact> existingRec = [SELECT Id,LastName,Phone,Email FROM Contact LIMIT 50000];
        for(contact con : newRecords){
            for(Contact existingCon : existingRec ){
                if(con.LastName == existingCon.Lastname && con.Email == existingCon.Email && con.Phone == existingCon.Phone){
                    con.addError('Dupicate Found');
                }
            }
        }
    }
}