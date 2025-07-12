package training_day12;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addreminder
 */
public class Addreminder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addreminder() {
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
		String title = request.getParameter("title");
		String decs  = request.getParameter("description");
		String date = request.getParameter("date");
		int id = 0;
		int uid = GetSet.getId();
		Connection con = DBconnection.connect();
		try {
			PreparedStatement psmt = con.prepareStatement("INSERT INTO REMINDER VALUES(?,?,?,?,?)");
			psmt.setInt(1, id);
			psmt.setString(2, title);
			psmt.setString(3, decs);
			psmt.setString(4, date);
			psmt.setInt(5, uid);
			
			int i = psmt.executeUpdate();
			
			if(i>0) {
				response.sendRedirect("dashboard.html");
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
