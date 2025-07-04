package training_day3;

import java.util.Scanner;

public class Factorial {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.print("Enter any number : ");
		int num = s.nextInt();
		
		int fac = 1;
		
		for(int i = 1; i<=num; i++) {
			fac *= i;
		}
		
		System.out.println("Factorial is "+fac);
	}

}
