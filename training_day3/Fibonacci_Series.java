package training_day3;

import java.util.Scanner;

public class Fibonacci_Series {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.print("Enter number : ");
		int num = s.nextInt();
        int first = 0, second = 1;
        System.out.print(first+" "+second);
        
        for(int i = 1; i <= num; i++) {
        	int next = first + second;
        	System.out.print(" "+next);
        	first = second;
        	second = next;
        }
	}

}
