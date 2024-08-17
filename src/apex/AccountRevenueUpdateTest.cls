@isTest
public class AccountRevenueUpdateTest {

    @isTest
    Private static void testBatch(){
        List<Account> accList = new List<Account>();
        //Creating an instance for the account.
        Account accRecord = new Account();
        accRecord.Name = 'Test';
        accRecord.AnnualRevenue = 1000;
        accList.add(accRecord);
        insert accList;
        
        Test.startTest();
        AccountRevenueUpdate acr = new AccountRevenueUpdate();
        Database.executeBatch(acr);
        Test.stopTest();
        // for testing 
        List<Account> updateRec = [Select Id from Account];
        System.assertEquals(1,updateRec.size());
    }
}