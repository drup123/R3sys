package training_day5;

import java.util.Scanner;

interface BankAccount {
	Scanner s = new Scanner(System.in);
	void createAccount();
	void deposit(double amount);
	void withdraw(double amount);
	void displayAccountDetails();
	double calculateInterest();
}

// Savings Account Class
class SavingsAccount implements BankAccount {
	String accountHolder;
	String accountNumber;
	double balance;
	double interestRate = 4.0;

	public void createAccount() {
		System.out.println("Enter Name: ");
		accountHolder = s.nextLine();
		System.out.println("Enter ID: ");
		accountNumber = s.nextLine();
		System.out.println("Enter Initial Balance: ");
		balance = s.nextDouble();
		s.nextLine(); // Consume newline
	}

	public void deposit(double amount) {
		balance += amount;
		System.out.println("Deposited: " + amount);
		System.out.println("Current Balance: " + balance);
	}

	public void withdraw(double amount) {
		if (amount <= balance) {
			balance -= amount;
			System.out.println("Withdrawn: " + amount);
			System.out.println("Current Balance: " + balance);
		} else {
			System.out.println("Insufficient balance.");
		}
	}

	public double calculateInterest() {
		return (balance * interestRate) / 100;
	}

	public void displayAccountDetails() {
		System.out.println("Account Holder: " + accountHolder);
		System.out.println("Account Number: " + accountNumber);
		System.out.println("Balance: " + balance);
		System.out.println("Interest Earned: " + calculateInterest());
	}
}

// Current Account Class
class CurrentAccount implements BankAccount {
	String accountHolder;
	String accountNumber;
	double balance;

	public void createAccount() {
		System.out.println("Enter Name: ");
		accountHolder = s.nextLine();
		System.out.println("Enter ID: ");
		accountNumber = s.nextLine();
		System.out.println("Enter Initial Balance: ");
		balance = s.nextDouble();
		s.nextLine(); // Consume newline
	}

	public void deposit(double amount) {
		balance += amount;
		System.out.println("Deposited: " + amount);
		System.out.println("Current Balance: " + balance);
	}

	public void withdraw(double amount) {
		if (amount >= 20000 && amount <= balance) {
			balance -= amount;
			System.out.println("Withdrawn: " + amount);
			System.out.println("Current Balance: " + balance);
		} else {
			System.out.println("Amount must be more than 20000 and less than or equal to balance.");
		}
	}

	public double calculateInterest() {
		return 0;
	}

	public void displayAccountDetails() {
		System.out.println("Account Holder: " + accountHolder);
		System.out.println("Account Number: " + accountNumber);
		System.out.println("Balance: " + balance);
		System.out.println("Interest Earned: " + calculateInterest());
	}
}


class LoanAccount implements BankAccount {
	String borrowerName;
	String loanAccountNumber;
	double loanAmount;

	public void createAccount() {
		System.out.println("Enter Name: ");
		borrowerName = s.nextLine();
		System.out.println("Enter Loan Account Number: ");
		loanAccountNumber = s.nextLine();
		System.out.println("Enter Loan Amount: ");
		loanAmount = s.nextDouble();
		s.nextLine(); 
	}

	public void deposit(double amount) {
		System.out.println("Deposit not allowed in Loan Account.");
	}

	public void withdraw(double amount) {
		System.out.println("Withdrawals not allowed from Loan Account.");
	}

	public double calculateInterest() {
		double interestRate = 8.5;
		return (loanAmount * interestRate) / 100;
	}

	public void displayAccountDetails() {
		System.out.println("Borrower Name: " + borrowerName);
		System.out.println("Loan Account Number: " + loanAccountNumber);
		System.out.println("Loan Amount: " + loanAmount);
		System.out.println("Interest Payable: " + calculateInterest());
	}
}

public class Problem04 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		BankAccount account = null;

		System.out.println("Choose Account Type:");
		System.out.println("1. Savings Account");
		System.out.println("2. Current Account");
		System.out.println("3. Loan Account");
		int choice = sc.nextInt();
		sc.nextLine(); // Consume newline

		switch (choice) {
			case 1:
				account = new SavingsAccount();
				break;
			case 2:
				account = new CurrentAccount();
				break;
			case 3:
				account = new LoanAccount();
				break;
			default:
				System.out.println("Invalid Choice!");
				System.exit(0);
		}

		account.createAccount();

		while (true) {
			System.out.println("\nChoose Operation:");
			System.out.println("1. Deposit");
			System.out.println("2. Withdraw");
			System.out.println("3. Display Account Details");
			System.out.println("4. Exit");
			int op = sc.nextInt();

			switch (op) {
				case 1:
					System.out.print("Enter amount to deposit: ");
					double dep = sc.nextDouble();
					account.deposit(dep);
					break;
				case 2:
					System.out.print("Enter amount to withdraw: ");
					double wit = sc.nextDouble();
					account.withdraw(wit);
					break;
				case 3:
					account.displayAccountDetails();
					break;
				case 4:
					System.out.println("Exiting...");
					System.exit(0);
				default:
					System.out.println("Invalid Option!");
			}
		}
	}
}
