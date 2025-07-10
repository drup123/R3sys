package training_day10;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Withdraw {
	int balance;
	void withdraw() {
		
		Connection con = DBconnection.connect();

		Scanner s = new Scanner(System.in);
		   
		  
		   
		   
		   try {
			   System.out.println("Enter id : ");
			   int Userid = s.nextInt();
			   System.out.println("Enter password : ");
			   String pass = s.next(); 
			PreparedStatement psmt = con.prepareStatement("SELECT BALANCE FROM BANK WHERE ID = ? AND PASSWORD = ?");
			psmt.setInt(1,Userid);
			psmt.setString(2,pass);

			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				balance = rs.getInt(1);
				System.out.println("Initial balance : "+balance);
				System.out.println("Enter amount : ");
				 int amount = s.nextInt();
				
				 if(amount <= balance) {
					 System.out.println("Withdraw amount "+amount);
					 balance -= amount;
				 } else {
					 System.out.println("Not sufficient balance");
				 }
			} else {
				System.out.println("Incorrect id or password");
			}
			
			System.out.println("Current Balance : "+balance);
			 
			
			
			
			PreparedStatement psmt2 = con.prepareStatement("UPDATE BANK SET BALANCE = ? WHERE ID = ? AND PASSWORD = ?");
			psmt2.setInt(1, balance);
			psmt2.setInt(2, Userid);
			psmt2.setString(3, pass);
			
			int i = psmt2.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
