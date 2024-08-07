public class Expressions {
    public static void show(){
        List<Account> accs = [SELECT Id, Name FROM Account];
        Contact[]cont = [SELECT Id,LastName FROM Contact];
        System.debug('Account :' +accs);
        System.debug('contact :' +cont);
        MyClass.myMethod();
    }

}