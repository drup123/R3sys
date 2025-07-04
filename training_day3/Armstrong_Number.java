package training_day3;
import java.util.Scanner;

public class Armstrong_Number {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		System.out.print("Enter any number : ");
		int num = s.nextInt();
		int count = 0;
		int tem = num;
		int tem2 = num;
		double sum = 0;
		
		
		while(tem2 > 0) {
			tem2 /= 10;
			count++;
		}
		

		while(tem > 0) {
			int rem = tem % 10;
			sum += Math.pow(rem, count);
			tem /= 10;
		}
		
		if(sum == num) {
			System.out.println("yes this is ArmStrong");
		} else {
			System.out.print("No this is not Armstrong");
		}

	}

}
