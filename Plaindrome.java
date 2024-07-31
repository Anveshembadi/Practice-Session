 public class Plaindrome{
 
public boolean poli(String s) {
 //String s = "HEllo";
 for (int i=0; i<s.length();i++){
        if (s.charAt(i) != s.charAt(s.length()-1-i)){
            return false;
        }

 }
    return true;
 }
 public static void main(String [] args){
    Plaindrome pl = new Plaindrome();
    boolean  br=pl.poli(null);
    System.out.println(br);

 }
    
 }