package training_day6;

import java.util.Scanner;

public class Task01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        try {
        	Scanner s = new Scanner(System.in);
            System.out.println("Enter numerator : ");
            int numerator = s.nextInt();
            System.out.println("Enter denominator : "); 
            int denominator = s.nextInt();            
            int result = numerator/denominator;
            System.out.println("Division is : "+result);

        }catch(ArithmeticException e) {
        	System.err.println("Error: Division by zero is not allowed.");
        }
	}

}
