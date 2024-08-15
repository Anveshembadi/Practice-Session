public class DispalyAccounts {
    public static List<Object> disaplayAccountLists(){
        //Account acc = new account();
        List<Object> objList = new List<Object>();
        List<Account> accList = [SELECT Id, Name FROM Account ORDER BY CreatedDate DESC LIMIT 10];
        List<Contact> conList = [SELECT Id , Name FROM Contact ORDER BY CreatedDate DESC LIMIT 10];
        
        if(accList.size()>0){
          objList.addAll(accList);  
        }
        if(conList.size()>0){
           objList.addAll(conList);
        }
        return objList;
    }
}