package training_day5;

import java.util.Scanner;

abstract class Shape {
	Scanner s = new Scanner(System.in);
	abstract void input();
	abstract void calculateArea();
	abstract void displayArea();
}


class Circle extends Shape {
	double radius;
	double Area;
	
	void input() {
		System.out.println("Enter Radius : ");
		radius = s.nextDouble();
	}
	
	void calculateArea() {
		Area = 3.14*radius*radius;
	}
	
	void displayArea() {
		input();
		calculateArea();
		System.out.println("Area is : "+Area);
	}
}


class Rectangle extends Shape {
	double len,bre;
	double Area;
	
	void input(){
		System.out.println("Enter length : ");
		len = s.nextDouble();
		System.out.println("Enter Width : ");
		bre = s.nextDouble();
	}
	
	void calculateArea() {
		Area = len * bre;
	}
	
	void displayArea() {
		input();
		calculateArea();
		System.out.println("Area is : "+Area);
	}
}

class Traingle extends Shape {
	double base,height;
	double Area;
	
	void input(){
		System.out.println("Enter Base : ");
		base = s.nextDouble();
		System.out.println("Enter Height : ");
		height = s.nextDouble();
	}
	
	void calculateArea() {
		Area = 0.5*base*height;
	}
	
	void displayArea() {
		input();
		calculateArea();
		System.out.println("Area is : "+Area);
	}
} 

public class Problem01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int ch;
		
		do {
			System.out.println("\nEnter your choice\n1.Area of Circle\n2.Area of Rectangle\n3.Area of Traingle\n4.Exit");
			ch = sc.nextInt();
			
			switch(ch) {
			case 1:
				Shape obj = new Circle();
				obj.displayArea();
				break;
			case 2:
				obj = new Rectangle();
				obj.displayArea();
				break;
			case 3:
				obj = new Traingle();
				obj.displayArea();
				break;
			case 4:
				System.out.println("Exiting....");
				break;
			}
		}while(ch<4);

	}

}
