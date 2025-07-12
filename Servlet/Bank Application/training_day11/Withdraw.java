package training_day11;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Withdraw
 */
public class Withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int balance;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Withdraw() {
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
				  String id = request.getParameter("id");
				  String pass = request.getParameter("pass");
				  String amount = request.getParameter("amount");
				  
				  int Userid = Integer.parseInt(id);
				  int Amount = Integer.parseInt(amount);
				  
				PreparedStatement psmt = con.prepareStatement("SELECT BALANCE FROM BANK WHERE ID = ? AND PASSWORD = ?");
				psmt.setInt(1,Userid);
				psmt.setString(2,pass);

				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					balance = rs.getInt(1);
					System.out.println("Initial balance : "+balance);
					
					
					 if(Amount <= balance) {
						 System.out.println("Withdraw amount "+Amount);
						 balance -= Amount;
						 response.sendRedirect("dashboard.html");
					 } else {
						 System.out.println("Not sufficient balance");
						 response.sendRedirect("withdraw.html");
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
		doGet(request, response);
	}

}
