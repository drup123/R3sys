package training_day3;

import java.util.Scanner;

public class Sum_of_Natural_Numbers {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		System.out.print("Enter any number : ");
		int num = s.nextInt();
		
		int sum = num * ((num+1)/2);
		
		System.out.println(sum);

	}

}
