package training_day11;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Transfer
 */
public class Transfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int senderBalance;
	int recevierBalance;
	int amount;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transfer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
			Connection con = DBcollection.connect();
			
			try {
				PreparedStatement pmt = con.prepareStatement("SELECT BALANCE FROM BANK WHERE ID = ? AND PASSWORD = ?");
				String id = request.getParameter("Sid");
				String senderPass = request.getParameter("Spass");
				int senderID = Integer.parseInt(id);
				pmt.setInt(1, senderID);
				pmt.setString(2, senderPass);
				ResultSet rs = pmt.executeQuery();
				
				if(rs.next()) {
					senderBalance = rs.getInt(1);
					String amt = request.getParameter("amount");
					amount = Integer.parseInt(amt);
					
					 if(amount <= senderBalance) {
						 senderBalance -= amount;
						 response.sendRedirect("dashboard.html");
					 }else {
						 throw new InsufficientBalanceException();
					 }
				} else {
					throw new IncorrectPasswordException();
				}
					 
					 
					 PreparedStatement pmt2 = con.prepareStatement("SELECT BALANCE FROM BANK WHERE ID = ?");
						String id2 = request.getParameter("Rid");
						int recevierID = Integer.parseInt(id2);
						System.out.println(recevierID);
						pmt2.setInt(1,recevierID);
						
						ResultSet rs2 = pmt2.executeQuery();
						
						if(rs2.next()) {
							recevierBalance = rs2.getInt(1);
							System.out.println("initial balance : "+recevierBalance);
							recevierBalance += amount;
							System.out.println(amount);
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
			} catch (IncorrectPasswordException e) {
				// TODO Auto-generated catch block
				System.err.println("Incorrect password or id\nplease check again");
			} catch (InsufficientBalanceException e) {
				// TODO Auto-generated catch block
				System.err.println("Not suffecient Balance");
			}
		doGet(request, response);
	}

}
