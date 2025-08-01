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
 * Servlet implementation class PlaceOrder
 */
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrder() {
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
		int buyerID = GetSet_buyerID.getBuyerId();
		System.out.println(buyerID);
		   int id  = 0;
		   int pid = Integer.parseInt(request.getParameter("productId"));
		   int fid = Integer.parseInt(request.getParameter("farmerId"));
		   String qnt = request.getParameter("quantity");
		   String date = request.getParameter("date");
		   int quantity = Integer.parseInt(qnt);
		  

		   Connection con = DBconnection.connect();
		   PreparedStatement st;
		try {
			st = con.prepareStatement("INSERT INTO ORDERS2 VALUES(?,?,?,?,?,?,?)");
			st.setInt(1, id);
			   st.setInt(2,buyerID);
			   st.setInt(3, fid);
			   st.setInt(4, pid);
			   st.setInt(5, quantity);
			   st.setString(6, date);
			   st.setString(7, "Pending");
			   int i = st.executeUpdate();
			   
			   if(i>0) {
				   response.sendRedirect("buyer_dashboard.jsp");
			   }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		doGet(request, response);
	}

}
