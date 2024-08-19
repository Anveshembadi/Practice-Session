@isTest
public class DailyOppProcessorTest {
    
    @isTest
    private static void testScheduledApex(){
        List<Opportunity> oppList = new List<Opportunity>();
        
        String sch = '0 0 0 ? * * *';
        for(integer i=0;i<250;i++){
            if(i<100){
                oppList.add(new Opportunity(Name = 'TEST'+i, StageName='Prospecting',CloseDate = System.today()));
                
            }
            else{
                oppList.add(new Opportunity(Name = 'TEST'+i, StageName='Prospecting',CloseDate = System.today(),LeadSource='Other'));
            }
        }
        insert oppList;
        
        TEst.startTest();
        String jobId = System.schedule('Process Opportunities',sch, new DailyOppProcessor());
        Test.stopTest();
        
        List<Opportunity> updateOppList = [SELECT Id, LeadSource FROM Opportunity WHERE LeadSource = ''];
        System.assertEquals(250, oppList.size());
    }

}