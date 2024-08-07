public class Replace {
    public static void code(String str){
        str = str.toUpperCase();
        List<Integer> charcodes= new List<Integer>();
        for(Integer i =0;i<str.length();i++){
            Integer code = str.charAt(i);
            if(code>=65 && code<=90){
                if(code==90){
                    charcodes.add(65);
                }
                else{
                    charcodes.add(code+1);
                }
            }
            else{
                charcodes.add(code);
            }
            
        }
        String codeMessage =String.fromCharArray(charcodes);
        System.debug('code msg :'+ codeMessage);
    }

}