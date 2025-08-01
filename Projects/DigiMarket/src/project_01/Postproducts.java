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
 * Servlet implementation class Postproducts
 */
public class Postproducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Postproducts() {
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
		   int farmerID = GetSet_farmerID.getFarmerID();
		   int id  = 0;
		   String pname = request.getParameter("productName");
		   String qnt = request.getParameter("quantity");
		   String Price = request.getParameter("price");
		   String date = request.getParameter("date");
		   int quantity = Integer.parseInt(qnt);
		   int price = Integer.parseInt(Price);

		   Connection con = DBconnection.connect();
		   PreparedStatement st;
		try {
			st = con.prepareStatement("INSERT INTO PRODUCTS VALUES(?,?,?,?,?,?)");
			st.setInt(1, id);
			   st.setInt(2,farmerID);
			   st.setString(3, pname);
			   st.setInt(4, quantity);
			   st.setInt(5, price);
			   st.setString(6, date);
			   int i = st.executeUpdate();
			   
			   if(i>0) {
				   response.sendRedirect("farmer_dashboard.jsp");
			   }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		   
		doGet(request, response);
	}

}
