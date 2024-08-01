package practice.stacks;

import java.util.Scanner;
import java.util.Stack;
public class ReverseWords {

    static void reverse(String st) {
        Stack<Character> s = new Stack<>();
    
        for (int i = 0; i < st.length(); i++) {
            if(st.charAt(i)!=' '){
                s.push(st.charAt(i));
            }
            else{
                while(s.empty()==false){
                    System.out.print(s.pop());
                }
                System.out.print(" ");
            }
        }
        while (!s.empty()) {
            System.out.print(s.pop());
        }
    }

    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.println("Enter the string :");
            String s = sc.nextLine();
            reverse(s);
        }
    }
}