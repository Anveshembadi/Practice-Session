public class NumbersRoot {
    public static void roots(Integer n1, Integer n2){
        Integer min = Math.min(n1,n2);
        Integer max = Math.max(n1,n2);
        for(Integer i=min;i<=max;i++){
            Decimal sqrt= Math.sqrt(i);
            Decimal cbrt = Math.cbrt(i);
            System.debug(i+':'+sqrt.setScale(2)+':'+cbrt.setScale(2));
        }
    }

}