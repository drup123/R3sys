package training_day6;

import java.util.InputMismatchException;
import java.util.Scanner;

class ATM {
	
	double balance = 150000;

	double Withdraw(double amount) throws InsufficientBalanceException{
		if(amount <= balance) {
			balance -= amount;
			System.out.println("Money Deducted...\nCurrent Balance : "+balance);
		} else {
			throw new InsufficientBalanceException("Insufficient Balance");
		}
		return balance;
	}
	
	void Display() {
		System.out.println("Current Balance is : "+balance);
	}
}

class InsufficientBalanceException extends Exception {
	InsufficientBalanceException(String msg) {
		super();
	}
}

public class Task04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ATM obj = new ATM();
		Scanner s = new Scanner(System.in);
		
		try {
			System.out.println("Enter Your choice :\n1.Withdraw\n2.Check Balance\n3.Exit");
			int ch = s.nextInt();
			
			switch(ch) {
			case 1:
				System.out.println("Enter Withdrawl : ");
				double amount = s.nextDouble();
				obj.Withdraw(amount);
				break;
			case 2:
				obj.Display();
			case 3:
				System.out.println("Exiting....");
			}
		}catch(InputMismatchException e) {
			System.err.println("Enter Valid Amount");
		}catch(InsufficientBalanceException e) {
			System.err.println(e);
		}catch(Exception e) {
			System.err.println("Something is Wrong"+e);
		}
		finally {
			System.out.println("Thank You !! Visit again");
		}
		
		
	}

}
