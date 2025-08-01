package project_01;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class _02_Farmer_Register
 */
public class _02_Farmer_Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public _02_Farmer_Register() {
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
		
		Connection con = DBconnection.connect();
	    int id = 0;
	    String name = request.getParameter("name");
	    String location = request.getParameter("location");
	    String contact = request.getParameter("contact");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    
	    try {
			PreparedStatement st = con.prepareStatement("INSERT INTO FARMER VALUES(?,?,?,?,?,?)");
			st.setInt(1, id);
			st.setString(2, name);
			st.setString(3, location);
			st.setString(4, contact);
			st.setString(5, email);
			st.setString(6, password);
			
			int i = st.executeUpdate();
			
			if(i>0) {
				response.sendRedirect("farmer_login.html");
			} else {
				response.sendRedirect("error.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
