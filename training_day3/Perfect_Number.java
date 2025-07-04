package training_day3;

import java.util.Scanner;

public class Perfect_Number {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.print("Enter any number : ");
		int num = s.nextInt();
		int sum = 0;
		
		for(int i = 1; i<num; i++){
			if(num % i == 0) {
				sum += i;
			}
		}
		
		
		
		if(sum == num) {
			System.out.println("Perfect");
		} else {
			System.out.println("Not Perfect");
		}

	}

}
