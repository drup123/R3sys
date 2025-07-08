package training_day6;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Task03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Scanner s = new Scanner(System.in);
			System.out.println("Enter numerator : ");
	        int numerator = s.nextInt();
	        System.out.println("Enter denominator : "); 
	        int denominator = s.nextInt(); 
	        
	        int r = numerator/denominator;
	        System.out.println("Result : "+r);
		}catch(ArithmeticException e) {
			System.err.println("Error: Cannot divide by zero.");
		}catch(InputMismatchException e){
			System.err.println("Error: Invalid input. Please enter valid integers");
		}catch(Exception e) {
			System.err.println("Error : something is wrong");
		}
	}

}
