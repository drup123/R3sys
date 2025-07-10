package training_day10;

import java.util.Scanner;

public class Bankapplication {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		int ch;
		
		do {
			System.out.println("\nEnter Your choice\n1.Add User\n2.Deposite\n3.Withdraw\n4.Transfer\n5.Exit");
			ch = s.nextInt();
			switch(ch) {
			case 1 :
				Addcustomer obj1 = new Addcustomer();
				obj1.addAccountHolder();
				break;
			case 2 :
				Deposite obj2 = new Deposite();
				obj2.deposite();
				break;
			case 3 :
				Withdraw obj3 = new Withdraw();
				obj3.withdraw();
				break;
			case 4 :
				Transfer obj4 = new Transfer();
				obj4.transferMoney();
				break;
			case 5 :
				break;
			}
		}while(ch < 5);
	}

}
