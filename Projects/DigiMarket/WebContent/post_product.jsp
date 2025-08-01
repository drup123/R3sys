<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="card">
  <h3>Post Product for Sale</h3>
  <form action="/postProduct" method="POST">
    <input type="text" name="productName" placeholder="Product Name" required><br>
    <input type="number" name="quantity" placeholder="Quantity (e.g. 100)" required><br>
    <input type="number" name="price" placeholder="Price per unit (Rs)" required><br>
    <button type="submit" class="submit-btn">Post Product</button>
  </form>
</div>

</body>
</html>