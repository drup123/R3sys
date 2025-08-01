<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "project_01.*" %>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% Connection con = DBconnection.connect();
   int id = Integer.parseInt(request.getParameter("id"));
   PreparedStatement st = con.prepareStatement("UPDATE ORDERS2 SET STATUS = ? WHERE ID = ?");
   st.setString(1,"Pending");
   st.setInt(2,id);
   int i = st.executeUpdate();
   if(i>0) {
    response.sendRedirect("farmer_dashboard.jsp");}%>
</body>
</html>