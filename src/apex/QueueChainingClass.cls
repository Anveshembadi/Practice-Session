public class QueueChainingClass implements Queueable{

    public Id parentId;
    public QueueChainingClass(Id accountId){
        this.parentId = accountId;
        
    }
    public void execute(QueueableContext content){
       Contact con = new Contact(LastName = 'Contact',FirstName='Queueable',AccountId=this.parentId);
        insert con;
    }

}