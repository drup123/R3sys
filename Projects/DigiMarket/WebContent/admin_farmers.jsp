<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="project_01.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Farmers | Marketp Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    :root {
      --primary: #2e7d32;
      --primary-dark: #1b5e20;
      --danger: #e74c3c;
      --danger-dark: #c0392b;
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
      color: var(--text-dark);
      padding: 20px;
      min-height: 100vh;
      background-image: 
        linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)),
        url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      background-color: rgba(255, 255, 255, 0.95);
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
    }

    .header p {
      color: #7f8c8d;
    }

    .card {
      background: white;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      padding: 2rem;
      margin-bottom: 2rem;
      transition: transform 0.3s ease;
      border: 1px solid #eee;
    }

    .card:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }

    .card-title {
      font-size: 1.3rem;
      margin-bottom: 1.5rem;
      color: var(--primary);
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .card-title i {
      font-size: 1.2rem;
    }

    .form-group {
      margin-bottom: 1.2rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 500;
    }

    .form-control {
      width: 100%;
      padding: 0.8rem 1rem;
      border: 1px solid #ddd;
      border-radius: var(--border-radius);
      font-size: 0.95rem;
      transition: all 0.3s ease;
    }

    .form-control:focus {
      border-color: var(--primary);
      outline: none;
      box-shadow: 0 0 0 3px rgba(46, 125, 50, 0.2);
    }

    .btn {
      padding: 0.8rem 1.5rem;
      border: none;
      border-radius: var(--border-radius);
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }

    .btn-primary {
      background-color: var(--primary);
      color: white;
    }

    .btn-primary:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
    }

    .btn-danger {
      background-color: var(--danger);
      color: white;
    }

    .btn-danger:hover {
      background-color: var(--danger-dark);
      transform: translateY(-2px);
    }

    .table-responsive {
      overflow-x: auto;
      margin-top: 1.5rem;
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
    }

    .table td {
      padding: 1rem;
      border-bottom: 1px solid #eee;
    }

    .table tr:hover {
      background-color: #f9f9f9;
    }

    .actions {
      display: flex;
      gap: 8px;
    }

    .no-data {
      text-align: center;
      padding: 2rem;
      color: #7f8c8d;
    }

    .password-field {
      font-family: monospace;
      background-color: #f8f9fa;
      padding: 0.3rem 0.5rem;
      border-radius: 4px;
    }

    @media (max-width: 768px) {
      .table th, .table td {
        padding: 0.8rem 0.5rem;
      }
      
      .actions {
        flex-direction: column;
      }
      
      .container {
        padding: 1rem;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <% Connection con = DBconnection.connect();
       PreparedStatement st = con.prepareStatement("SELECT * FROM FARMER");
       ResultSet rs = st.executeQuery();
    %> 

    <div class="header">
      <h1><i class="fas fa-user-shield"></i> Farmer Management</h1>
      <p>Add, view and manage registered farmers in the system</p>
    </div>

    <!-- Add Farmer Form -->
    <div class="card">
      <h2 class="card-title"><i class="fas fa-user-plus"></i> Add New Farmer</h2>
      <form action="_02_Farmer_Register" method="post">
        <div class="form-group">
          <label for="name">Full Name</label>
          <input type="text" id="name" name="name" class="form-control" placeholder="Enter farmer's full name" required>
        </div>
        
        <div class="form-group">
          <label for="location">Location</label>
          <input type="text" id="location" name="location" class="form-control" placeholder="Enter farmer's location" required>
        </div>
        
        <div class="form-group">
          <label for="contact">Contact Number</label>
          <input type="text" id="contact" name="contact" class="form-control" placeholder="Enter contact number" required>
        </div>
        
        <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email" class="form-control" placeholder="Enter email address" required>
        </div>
        
        <div class="form-group">
          <label for="password">Password</label>
          <input type="text" id="password" name="password" class="form-control" placeholder="Create a password" required>
        </div>
        
        <button type="submit" class="btn btn-primary">
          <i class="fas fa-save"></i> Add Farmer
        </button>
      </form>
    </div>

    <!-- Farmers List -->
    <div class="card">
      <h2 class="card-title"><i class="fas fa-users"></i> Registered Farmers</h2>
      
      <div class="table-responsive">
        <% if (!rs.isBeforeFirst()) { %>
          <div class="no-data">
            <i class="fas fa-info-circle" style="font-size: 2rem; margin-bottom: 1rem;"></i>
            <p>No farmers registered yet.</p>
          </div>
        <% } else { %>
          <table class="table">
            <thead>
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Location</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Password</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <% while(rs.next()) { %>
                <tr>
                  <td><%= rs.getInt(1) %></td>
                  <td><%= rs.getString(2) %></td>
                  <td><%= rs.getString(3) %></td>
                  <td><%= rs.getString(4) %></td>
                  <td><%= rs.getString(5) %></td>
                  <td class="password-field"><%= rs.getString(6) %></td>
                  <td class="actions">
                    <form action="DeleteFarmer" method="post" style="display: inline;">
                      <input type="hidden" name="farmerId" value="<%= rs.getInt(1) %>">
                      <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash-alt"></i> Delete
                      </button>
                    </form>
                  </td>
                </tr>
              <% } %>
            </tbody>
          </table>
        <% } %>
      </div>
    </div>
  </div>

  <% 
    if (rs != null) rs.close();
    if (st != null) st.close();
    if (con != null) con.close();
  %>
</body>
</html>