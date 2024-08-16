@isTest
public class UpdateParentAccountTest {

    @testSetup
    static void setup(){
       List<Account> accList = new List<Account>();
        accList.add(new Account(Name='Parent'));
        
        for(Integer i=0;i<100;i++){
            accList.add(new Account(name = 'Test account'+i));
        }
        
        insert accList;  
    }
     
    @isTest
    private static void testQueueable(){
        Id parentId = [SELECT Id FROM Account WHERE Name ='Parent'][0].id;
        
        List<Account> accList = [SELECT Id, Name FROM Account
                                 WHERE Name Like 'Test Account%'];
        
        UpdateParentAccount updateJob = new UpdateParentAccount(accList, parentId);
        Test.startTest();
        System.enqueueJob(updateJob);
        Test.stopTest();       
    }
    
}