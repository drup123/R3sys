package training_day10;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Deposite {
	int balance;
	
	void deposite() {
		
	   Connection con = DBconnection.connect();
	   Scanner s = new Scanner(System.in);
	   System.out.println("Enter id : ");
	   int Userid = s.nextInt();
	   System.out.println("Enter amount : ");
	   int amount = s.nextInt();
	   
	   
	   
	   try {
		PreparedStatement psmt = con.prepareStatement("SELECT BALANCE FROM BANK WHERE ID = ?");
		psmt.setInt(1,Userid);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()) {
			balance = rs.getInt(1);
			System.out.println("Initial Money : "+balance);
			System.out.println("Deposite amount : "+amount);
			balance += amount;
			System.out.println("Current Balance :"+balance);
		}
		
		
		PreparedStatement psmt2 = con.prepareStatement("UPDATE BANK SET BALANCE = ? WHERE ID = ?");
		psmt2.setInt(1, balance);
		psmt2.setInt(2, Userid);
		
        psmt2.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   }
}
