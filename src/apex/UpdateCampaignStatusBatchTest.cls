@isTest
public class UpdateCampaignStatusBatchTest {
    @isTest
    private static void testBatch(){
        //create test data.
        List<Campaign> campList = new List<Campaign>();
        Campaign campRecord = new Campaign(Name ='test');
        //creating required feilds in the object.
        campRecord.status = 'completed';
        
        // adding the created record to the list.
        campList.add(campRecord);
        
        // inserting this campList.
        insert campList;
        
        // start the test class.
        Test.startTest();
        // creating the instance of the class to be tested.
        // and pass it to the execute batch.
        UpdateCampaignStatusBatch batch = new UpdateCampaignStatusBatch();
        Database.executeBatch( batch);
        //for stoping the test.
        Test.stopTest();
        // for verifying .
        List<Campaign> updateRecords = [Select Id from Campaign];
        
        System.assertEquals(1,updateRecords.size());
    }

}