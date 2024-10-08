public class UpdateParentAccount implements Queueable{

    private List<Account> accList;
    private Id  parentAccId;
    
    public UpdateParentAccount(List<Account> accRecords, Id id){
        this.accList = accRecords;
        this.ParentAccId = id;
    }
    public void execute(QueueableContext comtext){
        for(Account acc : accList){
            acc.ParentId = parentAccId;
        }
        update accList;
    }
}