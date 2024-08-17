public class ContactClone implements Queueable {
	private Contact con;
    private String IndustryValue;
    
    public ContactClone(Contact con, String IndustryValue){
        this.con = con;
        this.IndustryValue = IndustryValue;
    }
    public void execute(QueueableContext context){
        List<Account> accList = [SELECT Id,Name FROM Account
                                WHERE Industry=: IndustryValue Limit 200];
        
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : accList){
            //clone is a function used to clone 
            Contact c = con.clone(false,false,false,false);
            c.AccountId = acc.Id;
            conList.add(c);
            
        }
        if(!conList.isEmpty()){
            insert conList;  
        }
    }
    
}