package training_day5;

import java.util.Scanner;

interface Shap {
	Scanner s = new Scanner(System.in);
	 void input();
	 void calculateArea();
	 void displayArea();
}


class Cir implements Shap {
	double radius;
	double Area;
	
	public void input() {
		System.out.println("Enter Radius : ");
		radius = s.nextDouble();
	}
	
	public void calculateArea() {
		Area = 3.14*radius*radius;
	}
	
	public void displayArea() {
		input();
		calculateArea();
		System.out.println("Area is : "+Area);
	}
}


class Rec implements Shap {
	double len,bre;
	double Area;
	
	public void input(){
		System.out.println("Enter length : ");
		len = s.nextDouble();
		System.out.println("Enter Width : ");
		bre = s.nextDouble();
	}
	
	public void calculateArea() {
		Area = len * bre;
	}
	
	public void displayArea() {
		input();
		calculateArea();
		System.out.println("Area is : "+Area);
	}
}

class Tra implements Shap {
	double base,height;
	double Area;
	
	public void input(){
		System.out.println("Enter Base : ");
		base = s.nextDouble();
		System.out.println("Enter Height : ");
		height = s.nextDouble();
	}
	
	public void calculateArea() {
		Area = 0.5*base*height;
	}
	
	public void displayArea() {
		input();
		calculateArea();
		System.out.println("Area is : "+Area);
	}
} 


public class Problem03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int ch;
		
		do {
			System.out.println("\nEnter your choice\n1.Area of Circle\n2.Area of Rectangle\n3.Area of Traingle\n4.Exit");
			ch = sc.nextInt();
			
			switch(ch) {
			case 1:
				Shap obj = new Cir();
				obj.displayArea();
				break;
			case 2:
				obj = new Rec();
				obj.displayArea();
				break;
			case 3:
				obj = new Tra();
				obj.displayArea();
				break;
			case 4:
				System.out.println("Exiting....");
				break;
			}
		}while(ch<4);
	}

}
