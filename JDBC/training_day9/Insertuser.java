package training_day9;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Insertuser {
	void addUser(int id, String name, String email, String pass, int balance) {
		Connection con = DBconnection.connect();
		
			try {
				PreparedStatement pstmt = con.prepareStatement("INSERT INTO BANK VALUES(?,?,?,?,?)");
				pstmt.setInt(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, email);
				pstmt.setString(4, pass);
				pstmt.setInt(5, balance);
				
				int i = pstmt.executeUpdate();

				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	
	}
}
