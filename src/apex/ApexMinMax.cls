public class ApexMinMax {
    public static List<Integer> FindMinMax(List<Integer> listOfNumbers){
        List<Integer> minAndMaxList = new List<Integer>();
        Integer min =0;
        Integer max =0;
        for(Integer eachnum : listOfNumbers){
            if(eachnum<=min){
                min = eachnum;
            }
            if(eachnum>=max){
                max = eachnum;
            }
        }
        
        minAndMaxList.add(min);
        minAndMaxList.add(max);
        
        return minAndMaxList;
        
    }
}