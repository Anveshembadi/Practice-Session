public class PasswordCheck {
    Static String CorrectPassword = 'AcchindraTech';
    Static Integer attemptCount=1;
    
    public static void attemptDifferentpasswords(){
        String finalAnswer ='';
        finalAnswer = handlePasswordAttempts('AchindraTech');
        System.debug(finalAnswer);
        finalAnswer = handlePasswordAttempts('Acchindra_Tech');
        System.debug(finalAnswer);
        finalAnswer = handlePasswordAttempts('AcchindhraTech');
        System.debug(finalAnswer);
        finalAnswer = handlePasswordAttempts('AcchindhraTech');
        System.debug(finalAnswer);
    }
    public static String handlePasswordAttempts(String InputPassword){
        if(InputPassword != CorrectPassword){
            if(attemptCount>3){
                return 'Maximum Limits Exceeded!';
            }
            attemptCount++;
            return 'failure';
            
        }
        else{
            return 'Success';
        }
    }

}