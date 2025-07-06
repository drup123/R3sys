package training_day5;

import java.util.Scanner;

abstract class Products {
	Scanner s = new Scanner(System.in);
	String productId;
	String productName;
	double basePrice;
	
	abstract void inputDetails();
	abstract void calculateFinalPrice();
	abstract void displayDetails();
}

class Electronics extends Products {
	int warrantyYear;
	double finalPrice;
	
	void inputDetails() {
		System.out.println("Enter item Id : ");
		productId = s.nextLine();
		System.out.println("Enter product Name : ");
		productName = s.nextLine();
		System.out.println("Enter Base Price : ");
		basePrice = s.nextDouble();
		
		System.out.println("Enter Warrenty : ");
		warrantyYear = s.nextInt();
	}
	
	
	
	void calculateFinalPrice() {
		double tax = basePrice*0.18;
		if(warrantyYear>1){
			finalPrice = basePrice + tax + 500;
			System.out.println("18% GST : "+tax);
			System.out.println("Additional warranty Charge 500rs");
			System.out.println("Total Price : "+finalPrice);}
     	else {
			finalPrice = basePrice + tax; 
			System.out.println("18% GST : "+tax);
			System.out.println("Total Price : "+finalPrice);}
	}
	
	void displayDetails() {
		inputDetails();
		calculateFinalPrice();
		
	}
}

class Clothing extends Products {
	String size;
	double finalPrice;
	
	void inputDetails() {
		System.out.println("Enter item Id : ");
		productId = s.nextLine();
		System.out.println("Enter product Name : ");
		productName = s.nextLine();
		System.out.println("Enter Base Price : ");
		basePrice = s.nextDouble();
		
		System.out.println("Enter Size : ");
		size = s.nextLine();
	}
	
	
	void calculateFinalPrice() {
		double tax = basePrice*0.12;

		if(basePrice>2000){
			finalPrice = basePrice + tax - 300;
			System.out.println("300rs Discount");
			System.out.println("Total Price : "+finalPrice);}
     	else {
			finalPrice = basePrice + tax; 
			System.out.println("12% GST : "+tax);
			System.out.println("Total Price : "+finalPrice);}
	}
	
	void displayDetails() {
		inputDetails();
		calculateFinalPrice();
		
	}
}

class Grocery extends Products {
	double weightInKg;
	double finalPrice;
	
	void inputDetails() {
		System.out.println("Enter item Id : ");
		productId = s.nextLine();
		System.out.println("Enter product Name : ");
		productName = s.nextLine();
		System.out.println("Enter Base Price : ");
		basePrice = s.nextDouble();
		
		System.out.println("Enter weight In Kg : ");
		weightInKg = s.nextDouble();
	}
	
	
	
	void calculateFinalPrice() {
		double tax = basePrice*0.05;
		double dis = basePrice*0.10;
		if(weightInKg>5){
			finalPrice = basePrice + tax - dis;
			System.out.println("10% discount"+dis);
			System.out.println("Total Price : "+finalPrice);}
     	else {
			finalPrice = basePrice + tax; 
			System.out.println("5% GST : "+tax);
			System.out.println("Total Price : "+finalPrice);}
	}
	
	void displayDetails() {
		inputDetails();
		calculateFinalPrice();
		
	}
}

public class Problem02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Products obj = new Electronics();
		Scanner sc = new Scanner(System.in);
		int ch;
		
		do{
			System.out.println("\nEnter your choice\n1.Add Electronics\n2.Add Clothes\n3.Add Grocery\n4.Exit");
			ch = sc.nextInt();
			
			switch(ch) {
			case 1:
				obj.displayDetails();
				break;
			case 2:
				obj = new Clothing();
				obj.displayDetails();
				break;
			case 3:
				obj = new Grocery();
				obj.displayDetails();
				break;
			case 4:
				System.out.println("Exiting....");
				break;
			}
		}while(ch>4);

	}

}
