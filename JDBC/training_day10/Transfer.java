package training_day10;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Transfer {
	int senderBalance;
	int recevierBalance;
	int amount;
	void transferMoney() {
		Connection con = DBconnection.connect();
		Scanner s = new Scanner(System.in);
		
		try {
			PreparedStatement pmt = con.prepareStatement("SELECT BALANCE FROM BANK WHERE ID = ? AND PASSWORD = ?");
			System.out.println("Enter sender id : ");
			int senderID = s.nextInt();
			System.out.println("Enter sender Password : ");
			String senderPass = s.next();
			pmt.setInt(1, senderID);
			pmt.setString(2, senderPass);
			ResultSet rs = pmt.executeQuery();
			
			if(rs.next()) {
				senderBalance = rs.getInt(1);
				System.out.println("Initial balance : "+senderBalance);
				System.out.println("Enter amount : ");
				amount = s.nextInt();
				
				 if(amount <= senderBalance) {
					 senderBalance -= amount;
				 } else {
					 System.out.println("Not sufficient balance");
				 }
			} else {
				System.out.println("Incorrect id or password");
			}
			
			PreparedStatement pmt2 = con.prepareStatement("SELECT BALANCE FROM BANK WHERE ID = ?");
			System.out.println("Enter recevier id : ");
			int recevierID = s.nextInt();
			pmt2.setInt(1,recevierID);
			
			ResultSet rs2 = pmt2.executeQuery();
			
			if(rs2.next()) {
				recevierBalance = rs2.getInt(1);
				System.out.println("initial balance : "+recevierBalance);
				recevierBalance += amount;
				System.out.println("Current balance : "+recevierBalance);
			}
			
			PreparedStatement pmt3 = con.prepareStatement("UPDATE BANK SET BALANCE = ? WHERE ID = ? AND PASSWORD = ?");
			pmt3.setInt(1,senderBalance);
			pmt3.setInt(2,senderID);
			pmt3.setString(3,senderPass);
			
			pmt3.executeUpdate();
			
			PreparedStatement pmt4 = con.prepareStatement("UPDATE BANK SET BALANCE = ? WHERE ID = ?");
			pmt4.setInt(1,recevierBalance);
			pmt4.setInt(2,recevierID);			
			pmt4.executeUpdate();

			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
