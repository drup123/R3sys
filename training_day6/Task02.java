package training_day6;

import java.util.Scanner;

public class Task02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		System.out.println("Enter Number : ");
		String n = s.nextLine();
		
		try {
			int i = Integer.parseInt(n);
			System.out.println(i);
		}catch(NumberFormatException e) {
			System.err.println("Invalid input! Please enter digits only.");
		}
	}

}
