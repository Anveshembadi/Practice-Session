public class QueueClass implements Queueable{
    public void execute (QueueableContext content){
        Account acc = new Account(Name='Queueable Apex Account');
        insert acc;
    }

}