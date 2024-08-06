public class EnumProgram {
    public enum Weekday{MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY}
    public enum Weekend{SATURDAY,SUNDAY}
    public static void show(){
        Weekday day1 = Weekday.FRIDAY;
        Weekend day2 = Weekend.SATURDAY;
        showWeekday(day1);
        showWeekend(day2);
    }
    public static void showWeekday(Weekday day){
        System.debug('WEEKDAY :' + day);
    }
     public static void showWeekend(Weekend day){
        System.debug('WEEKEND :' + day);
    }

}