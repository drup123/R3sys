package training_day10;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Addcustomer {
	String name;
	String email;
	int id;
	String pass;
	int balance;
	void addAccountHolder() {
		Scanner s = new Scanner(System.in);
		
		System.out.println("Enter Name : ");
		name = s.next();
		System.out.println("Enter id : ");
		id = s.nextInt();
		System.out.println("Enter Password : ");
		pass = s.next();
		System.out.println("Enter e : ");
	    email = s.next();
		System.out.println("Enter balance : ");
		balance = s.nextInt();
		
	    Connection con = DBconnection.connect(); 
	    try {
			PreparedStatement psmt = con.prepareStatement("INSERT INTO BANK VALUES(?,?,?,?,?)");
			
			psmt.setInt(1,id);
			psmt.setString(2,name);
			psmt.setString(3,email);
			psmt.setString(4,pass);
			psmt.setInt(5,balance);
			
			int i = psmt.executeUpdate();
			
			if(i>0) {
				System.out.println("Data Recorded....");
			}
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	void displayInfo() {
		
		
		System.out.println("Name : "+name);
		System.out.println("id : "+id);
		System.out.println("email : "+email);
		System.out.println("Balance : "+balance);
	}
}
