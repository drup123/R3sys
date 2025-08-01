<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="project_01.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>View Products | Marketp Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    :root {
      --primary: #27ae60;
      --primary-dark: #219653;
      --text-dark: #2c3e50;
      --text-light: #ecf0f1;
      --border-radius: 8px;
      --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
    
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f5f7fa;
      color: var(--text-dark);
      padding: 20px;
      min-height: 100vh;
      background-image: 
        linear-gradient(rgba(245, 247, 250, 0.85), rgba(245, 247, 250, 0.85)),
        url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      background-color: white;
      border-radius: var(--border-radius);
      padding: 2rem;
      box-shadow: var(--box-shadow);
    }

    .header {
      text-align: center;
      margin-bottom: 2rem;
      padding-bottom: 1rem;
      border-bottom: 1px solid #eee;
    }

    .header h1 {
      font-size: 2rem;
      color: var(--primary);
      margin-bottom: 0.5rem;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
    }

    .header p {
      color: #7f8c8d;
    }

    .table-responsive {
      overflow-x: auto;
      margin-top: 1.5rem;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
    }

    .table {
      width: 100%;
      border-collapse: collapse;
    }

    .table th {
      background-color: var(--primary);
      color: white;
      padding: 1rem;
      text-align: left;
      font-weight: 500;
      position: sticky;
      top: 0;
    }

    .table td {
      padding: 1rem;
      border-bottom: 1px solid #eee;
    }

    .table tr:hover {
      background-color: #f9f9f9;
    }

    .price {
      font-weight: 600;
      color: var(--primary);
    }

    .quantity {
      font-weight: 500;
    }

    .date {
      color: #7f8c8d;
      font-size: 0.9rem;
    }

    .no-data {
      text-align: center;
      padding: 2rem;
      color: #7f8c8d;
    }

    .back-btn {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 0.6rem 1.2rem;
      background-color: var(--primary);
      color: white;
      border-radius: var(--border-radius);
      text-decoration: none;
      margin-top: 1.5rem;
      transition: all 0.3s ease;
    }

    .back-btn:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
    }

    .product-name {
      font-weight: 500;
      color: var(--text-dark);
    }

    @media (max-width: 768px) {
      .table th, .table td {
        padding: 0.8rem 0.5rem;
        font-size: 0.9rem;
      }
      
      .container {
        padding: 1rem;
      }
      
      .header h1 {
        font-size: 1.5rem;
      }
      
      .date {
        display: none;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <% Connection con = DBconnection.connect();
       PreparedStatement st = con.prepareStatement("SELECT * FROM PRODUCTS");
       ResultSet rs = st.executeQuery();
    %> 

    <div class="header">
      <h1><i class="fas fa-apple-alt"></i> Product Inventory</h1>
      <p>View and manage all products listed by farmers</p>
    </div>

    <div class="table-responsive">
      <% if (!rs.isBeforeFirst()) { %>
        <div class="no-data">
          <i class="fas fa-info-circle" style="font-size: 2rem; margin-bottom: 1rem;"></i>
          <p>No products available yet.</p>
        </div>
      <% } else { %>
        <table class="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Farmer ID</th>
              <th>Product</th>
              <th>Quantity</th>
              <th>Price</th>
              <th>Date Added</th>
            </tr>
          </thead>
          <tbody>
            <% while(rs.next()) { %>
              <tr>
                <td><%= rs.getInt(1) %></td>
                <td><%= rs.getInt(2) %></td>
                <td><span class="product-name"><%= rs.getString(3) %></span></td>
                <td><span class="quantity"><%= rs.getInt(4) %></span> units</td>
                <td class="price">₹<%= rs.getInt(5) %></td>
                <td class="date"><%= rs.getString(6) %></td>
              </tr>
            <% } %>
          </tbody>
        </table>
      <% } %>
    </div>

    <a href="admin_dashboard.html" class="back-btn">
      <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>
  </div>

  <% 
    if (rs != null) rs.close();
    if (st != null) st.close();
    if (con != null) con.close();
  %>
</body>
</html>