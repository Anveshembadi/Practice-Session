@isTest
public class ContactCloneTest {
    @testSetup // this annotation is used to setup testdata to test
    static void setup(){
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<=5;i++){
           Account acc = new Account();
            acc.Name = 'Queue'+i;
            acc.Industry = 'Media';
            accList.add(acc);
        }
        insert accList;
        
    }
    
	@isTest
    public static void testContactClone(){
        //Contact cont = [SELECt Id from Contact Where LastName = 'QueueableApex'];
        Contact cont = new Contact(LastName='QueueableApex');
        insert cont;
        String IndustryValue = 'Media';
        Test.startTest();
        ContactClone conClone = new ContactClone(cont, IndustryValue);
        Id jobId = System.enqueueJob(conClone);
        Test.stopTest();
        
        System.assertEquals(5,[SELECT count() From Contact
                              Where AccountId IN (SELECT Id From Account WHERE Industry ='Media')]);
    }
}