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
    
    public static void handleAfterUpdate(List<Contact> newRec , Map<Id,Contact> oldRec){
        List<Id> accountIdsToInform = new List<Id>();
        for(Contact con : newRec){
            if(con.AccountId != null){
                System.debug('con.Email='+con.Email+', old email='+oldRec.get(con.Id).Email);
                System.debug('con.Phone='+con.Phone+', old Phone='+oldRec.get(con.Id).Phone);
                if(con.Email != oldRec.get(con.Id).Email || con.Phone != oldRec.get(con.Id).Phone){
                    accountIdsToInform.add(con.AccountId);
                }
            }
        }
        System.debug('accountIdsToInform='+accountIdsToInform);
        List<String> emailAddressList = new List<String>();
        List<Account> accountRecords = [SELECT OwnerID, Owner.Email FROM Account WHERE Id IN : accountIdsToInform];
        for(Account acc : accountRecords){
            emailAddressList.add(acc.Owner.Email);
        }
        System.debug('emailAddressList='+emailAddressList);
        if(!emailAddressList.isEmpty()){
            
            Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>();
            for(Id accId : accountIdsToInform){
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.toAddresses = emailAddressList;
            message.optOutPolicy = 'Filter';
            message.subject = 'Email Or Phone Number Changed';
            message.plainTextBody = 'Your Email Or Phone Number of your childs contact has been changed. Please Verify it.';
            messages.add(message);
            
            }
             Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            
        }
    }
    
    public static void updateContactFeild(Id contactId){
        if(contactId != null){
            List<Contact> contactListToUpdate = [SELECT Id, Title, Department FROM Contact WHERE Id = :ContactId];
            if(contactListToUpdate[0].Title == 'CFO'){
                contactListToUpdate[0].Department='Industrialist';
            }
            update contactListToUpdate;
        }
    }
    
    public static void createContact(String firstname, String lastname,String email){
        List<Contact> conList = new List<Contact>();
        Contact con = new Contact();
        if(!String.isBlank(lastname)){
             con.FirstName = firstname;
        	 con.LastName = lastname;
        	 con.Email = email;
        	 conList.add(con);
        
        }
       if(conList.size()>0){
        insert conList;
    }
     
    }
    
    
}