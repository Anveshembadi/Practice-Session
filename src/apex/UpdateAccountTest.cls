@isTest
public class UpdateAccountTest {
    @isTest
    private static void testupdateAccount(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Active__c = 'No';
        acc.Rating = 'Cold';
        insert acc;      // the created record in org is only availale for test classes not for other.
        
        Contact con = new Contact();
     	con.FirstName = 'Test';
        con.LastName = 'Test';
        con.AccountId = acc.Id;
        insert con;		// the created record in org is only availale for test classes not for other.
        
        UpdateAccounts.updateAccount();
        
        Account updatedAcc = [SELECT Id,Active__c,Rating FROM Account
                            WHERE Id =: acc.Id];
        System.assertEquals('Cold', updatedAcc.Rating);
        
    }

}