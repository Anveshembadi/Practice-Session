public class CalculateCaseOrigin {
    @future
    public static void countCasesBasedOnOrigin(List<Id>accIds){
        List<Account>accList =[SELECT Id, cases_Through_Email__c, cases_Through_phone__c, cases_Through_web__c,
                              (SELECT Id, Origin FROM Cases)
                              FROM Account WHERE Id IN:accIds];
        for(Account acc : accList){
            Integer Email=0,web=0,phone =0;
            for(Case ca : acc.Cases){
                if(ca.Origin == 'Phone'){
                    phone++;
                }
                else if(ca.Origin == 'Email'){
                    Email++;
                }
                else if(ca.Origin == 'Web'){
                    web++;
                }
            }
            acc.cases_Through_Email__c = Email;
            acc.cases_Through_phone__c = phone;
            acc.cases_Through_web__c  = Web;
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}