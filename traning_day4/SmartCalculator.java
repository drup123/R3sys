package traning_day4;

import java.util.Scanner;

class Overloading_demo {
	int calculate(int a, int b) {
		return a+b;
	}
	
	int calculate(int a, int b, int c){
		return a+b+c;
	}
	
	double calculate(double a, double b){
		return a+b;
	}
    
	String calculate(String s1, String s2){
		return s1+s2;
	}
	
	double calculate(int[] numbers) {
	   double total = 0;
	   for(int i = 0; i < numbers.length; i++) {
		   total += numbers[i];
	   }
       double avg = total/numbers.length;
       return avg;
	   
	}


}

class Area extends Overloading_demo {
	double calculate(double len, double wid) {
		return len*wid;
	}
	
	double calculate(float radius) {
		 return 3.14*radius*radius;
	}
	
	void calculate() {
		System.out.println("Calculator is ready");
	}
}

public class SmartCalculator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		Area obj = new Area();
		obj.calculate();
		int ch;
		
		do{
		System.out.println("\nEnter Your choice\n1.Add 2 numbers\n2.Add 3 numbers\n3.Add big numbers\n4.Add two strings\n5.Average of Array\n.6Area of Rectangle\n7.Area of Circle\n8.Exit");
		ch = s.nextInt();
		
		switch(ch) {
		case 1 :
			System.out.println("Enter two Numbers : ");
			int a = s.nextInt();
			int b = s.nextInt();
			System.out.println(obj.calculate(a, b));
			break;
		case 2 :
			System.out.println("Enter three Numbers : ");
			int a2 = s.nextInt();
			int b2 = s.nextInt();
			int c = s.nextInt();
			System.out.println(obj.calculate(a2, b2, c));
			break;
		case 3 :
			System.out.println("Enter two Numbers : ");
			double a3 = s.nextDouble();
			double b3 = s.nextDouble();
			System.out.println(obj.calculate(a3,b3));
			break;
		case 4 :
			System.out.println("Enter two Strings : ");
            String s1 = s.nextLine();
            String s2 = s.nextLine();
			System.out.println(obj.calculate(s1, s2));
			break;
		case 5:
			System.out.println("Enter the number of elements in the array:");
			int n = s.nextInt();
			int[] arr = new int[n];
			System.out.println("Enter array elements:");
			for (int i = 0; i < n; i++) {
				arr[i] = s.nextInt();
			}
			System.out.println("Average: " + obj.calculate(arr));
			break;
		case 6:
			System.out.println("Enter length and width:");
			double len = s.nextDouble();
			double wid = s.nextDouble();
			System.out.println("Area of rectangle: " + obj.calculate(len, wid));
			break;
		case 7:
			System.out.println("Enter radius:");
			float radius = s.nextFloat();
			System.out.println("Area of circle: " + obj.calculate(radius));
			break;
		case 8:
			System.out.println("Exiting... Thank you!");
			s.close();
		}
		}while(ch<8);
		
	}

}
