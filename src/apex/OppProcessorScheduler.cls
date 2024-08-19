public class OppProcessorScheduler implements Schedulable {
    
    public void execute(SchedulableContext sc){
        //Creating instance of class in ehich we want to executr the schedule class
        OppProcessor oppProcess = new OppProcessor();
        
        //Pass the instance variable of the class as parameter to thr execute method.
        Database.executeBatch(oppProcess);
        
    }
    

}