package traning_day4;

import java.util.Scanner;

class AccountDetail {
	int balance;
    void viewUser(int accNo, String name, int balance) {
    	System.out.println("Your Account Number is : "+accNo);
    	System.out.println("Your name is : "+name);
    	this.balance = balance;
    	System.out.println("Current Balance : "+balance);
    }
}	
    
class AmountDeposite extends AccountDetail {
	Scanner s = new Scanner(System.in);
	void depo(){
	System.out.println("Enter the Amount : ");
	int amount = s.nextInt();
    
	balance += amount;
	
    System.out.println("Amount of Deposite : "+amount);
    System.out.println("Current Balance : "+balance);
	}
}


class AmountWithdraw extends AmountDeposite {
	
	void with(){
	System.out.println("Enter the Amount : ");
	int amount = s.nextInt();
	System.out.println("Withdraw Amount : "+amount);
	
	balance -= amount;
	
	System.out.println("Current Balance : "+balance);
	}
}
    


public class Banking_application {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		System.out.println("Enter account number : ");
		int accNO = s.nextInt();
		
		System.out.println("Enter Your Name : ");
		String name = s.next();
		
		System.out.println("Enter your total money : ");
		int balance = s.nextInt();
		
		AmountWithdraw obj = new AmountWithdraw();
		
		int ch;
		
		
		
		do {
		System.out.println("\nWhat do you Want check\n1.Check Information\n2.Withdraw\n3.Deposite\n4.Exit");
		ch = s.nextInt();
		switch(ch) {
		case 1:
			obj.viewUser(accNO,name,balance);
			break;
		case 2:
			obj.with();
			break;
		case 3:
			obj.depo();
			
		}
		
		
		}while(ch<4);

	}

}
