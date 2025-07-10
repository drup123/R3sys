package training_day9;

import java.util.Scanner;

public class Task01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner s = new Scanner(System.in);
		System.out.println("Enter your id : ");
		int id = s.nextInt();
		
		System.out.println("Enter your name : ");
		String name = s.next();
		
		System.out.println("Enter your email : ");
		String mail = s.next();
		
		System.out.println("Enter your password : ");
		String pass = s.next();
		
		System.out.println("Enter your balance : ");
		int bal = s.nextInt();
		
		Insertuser obj1 = new Insertuser();
		obj1.addUser(id, name, mail, pass, bal);
		
		Userview obj = new Userview();
		obj.display();
	}

}
