public class AgeCalculator {
    public static void calculate(Date dateOfBirth){
        Date currentDay= Date.today();
        Integer days = dateOfBirth.daysBetween(currentDay);
        Integer year =days/365;
        days = Math.mod(days,365);
        Integer month = days/30;
        days = Math.mod(days,30);
        System.debug('Age :'+ year+ 'years'+month+'months'+days+'days');
    }

}