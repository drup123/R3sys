package training_day3;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
         Scanner s = new Scanner(System.in);
         int choose;
         do {
         System.out.println("Enter first number : ");
         int x = s.nextInt();
         
         System.out.println("Enter second number : ");
         int y = s.nextInt();
         
         System.out.println("choose\n1.Addition\n2.Substraction\n3.Multiplication\n4.Division");
         int ch = s.nextInt();
         
         Calculator obj = new Calculator();
         
         switch(ch) {
         case 1 :
        	 obj.sum(x, y);
        	 break;
         case 2 :
        	 obj.sub(x, y);
        	 break;
         case 3 :
        	 obj.mul(x, y);
        	 break;
         case 4 :
        	 obj.div(x, y);
        	 break;
         }
         System.out.println("want to continue ? Press 1 else Press 2");
         choose = s.nextInt();
         }while(choose == 1);  
	}

}
