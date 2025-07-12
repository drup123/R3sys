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
 * Servlet implementation class Deposit
 */
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int balance;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deposit() {
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
		   
		   String amount = request.getParameter("amount");
		   String id = request.getParameter("id");
		   int uid = Integer.parseInt(id);
		   int Amount = Integer.parseInt(amount);
		   
		   
		   
		   try {
			PreparedStatement psmt = con.prepareStatement("SELECT BALANCE FROM BANK WHERE ID = ?");
			psmt.setInt(1,uid);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				balance = rs.getInt(1);
				System.out.println("Initial Money : "+balance);
				System.out.println("Deposite amount : "+Amount);
				balance += Amount;
				System.out.println("Current Balance :"+balance);
				response.sendRedirect("dashboard.html");
			} else {
				response.sendRedirect("deposit.html");
			}
			
			
			PreparedStatement psmt2 = con.prepareStatement("UPDATE BANK SET BALANCE = ? WHERE ID = ?");
			psmt2.setInt(1, balance);
			psmt2.setInt(2, uid);
			
	        psmt2.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
