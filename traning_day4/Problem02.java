package traning_day4;

import java.util.Scanner;

class Company {
	String Company_name = "R3sys";
	String employeeId;
	String employeeName;
	Scanner s = new Scanner(System.in);
	
	void getCommonDetails() {
		System.out.println("Enter Employee Id : ");
		employeeId = s.nextLine();
		
		System.out.println("Enter Employee name : ");
		employeeName = s.nextLine();
	}
	void displayCommonDetails(){
		System.out.println("Company name : "+Company_name);
		System.out.println("Employee Id : "+employeeId);
		System.out.println("Employee name : "+employeeName);
	}
}

class PermanentEmployee extends Company {
	double basicPay;
	double hra;
	double da;
	double totalSalary;
	
	void getDetails() {
		System.out.println("Enter your basic pay : ");
	    basicPay = s.nextDouble();
		System.out.println("Enter your hra : ");
        hra = s.nextDouble();
		System.out.println("Enter your da : ");
        da = s.nextDouble();
	    
	}
	
	double calculateSalary(){
		 return (totalSalary = basicPay + hra + da);
	}
	
	void displayPayslip(){
		getDetails();
		displayCommonDetails();
		System.out.println("Total Salary : "+calculateSalary());
		
	}
}

class TemporaryEmployee extends PermanentEmployee {
	int workHours;
	double ratePerHour;
	
	void getDetails() {
		System.out.println("Enter your Work Hour : ");
        workHours = s.nextInt();
	    
		System.out.println("Enter rate Per Hour : ");
		ratePerHour = s.nextDouble();
	}
	
	double calculateWage() {
		return (workHours*ratePerHour);
	}
	
	void displayPayslip() {
		getDetails();
		displayCommonDetails();
		System.out.println("Total Wage : "+calculateWage());
	}
}

public class Problem02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		PermanentEmployee obj1 = new PermanentEmployee();
		TemporaryEmployee obj2 = new TemporaryEmployee();
		
		
		System.out.println("Enter Your Choice\n1.Permanent\n2.Temporary");
		int choice = sc.nextInt();
		
		switch(choice) {
		case 1:
			obj1.getCommonDetails();
			obj1.displayPayslip();
			break;
		case 2:
			obj2.getCommonDetails();
			obj2.displayPayslip();
		    break;
		}
		

	}

}
