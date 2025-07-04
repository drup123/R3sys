package training_day3;

import java.util.Scanner;

public class Prime_Number {
	
	static boolean isPrime(int a){
	    if (a <= 1) return false;

	    for (int i = 2; i < a; i++) {
	        if (a % i == 0) {
	            return false; 
	        }
	    }

	    return true; 
	}

	public static void main(String[] args) {
		
	  Scanner s = new Scanner(System.in);
	  System.out.print("Enter any number : ");
	  int num = s.nextInt();
	  
	  if(isPrime(num)) {
		  System.out.println("Number is Prime");
	  } else {
		  System.out.println("Not Prime");
	  }
     
	}

}
