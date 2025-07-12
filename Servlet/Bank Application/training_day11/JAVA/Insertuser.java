package training_day11;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Insertuser
 */
public class Insertuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insertuser() {
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
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String balance = request.getParameter("balance");
		
		
		
		int Userid = Integer.parseInt(id);
		int UserBlance = Integer.parseInt(balance);
		
		Connection con = DBcollection.connect();
		try {
			
			PreparedStatement psmt = con.prepareStatement("INSERT INTO BANK VALUES(?,?,?,?,?)");
			psmt.setInt(1, Userid);
			psmt.setString(2, name);
			psmt.setString(3, email);
			psmt.setString(4, pass);
			psmt.setInt(5, UserBlance);
			
			int i = psmt.executeUpdate();
			if(i>0) {
				response.sendRedirect("Added.html");
			}else{
				System.out.println("Something is wrong");
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		doGet(request, response);
	}

}
