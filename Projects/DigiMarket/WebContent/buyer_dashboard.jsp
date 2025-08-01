<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "project_01.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Buyer Dashboard | Marketp</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    :root {
      --primary-color: #4CAF50;
      --primary-dark: #388E3C;
      --primary-light: #C8E6C9;
      --accent-color: #FFC107;
      --danger-color: #F44336;
      --text-dark: #333;
      --text-light: #666;
      --bg-color: #f9f9f9;
      --card-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      --sidebar-width: 280px;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: var(--bg-color);
      color: var(--text-dark);
      display: flex;
      min-height: 100vh;
      line-height: 1.6;
    }

    .sidebar {
      width: var(--sidebar-width);
      background: linear-gradient(rgba(46, 125, 50, 0.85), rgba(46, 125, 50, 0.95)),
                  url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80') center/cover no-repeat;
      padding: 25px 0;
      color: white;
      display: flex;
      flex-direction: column;
      position: relative;
      overflow: hidden;
      z-index: 10;
    }

    .sidebar::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(135deg, rgba(46, 125, 50, 0.9) 0%, rgba(39, 107, 43, 0.95) 100%);
      z-index: -1;
    }

    .sidebar-header {
      padding: 0 25px 25px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.15);
      margin-bottom: 25px;
      text-align: center;
    }

    .sidebar-header h2 {
      font-weight: 600;
      font-size: 1.5rem;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 10px;
    }

    .sidebar-header p {
      font-size: 0.9rem;
      opacity: 0.8;
    }

    .sidebar-header i {
      margin-right: 12px;
      font-size: 1.8rem;
      color: var(--accent-color);
    }

    .sidebar-nav {
      flex: 1;
      overflow-y: auto;
      padding: 0 15px;
    }

    .sidebar button {
      width: 100%;
      padding: 14px 20px;
      border: none;
      background: none;
      color: white;
      text-align: left;
      font-size: 15px;
      cursor: pointer;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      margin: 8px 0;
      border-radius: 6px;
      position: relative;
      overflow: hidden;
    }

    .sidebar button::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: rgba(255, 255, 255, 0.1);
      transition: all 0.4s ease;
    }

    .sidebar button:hover::before,
    .sidebar button.active::before {
      left: 0;
    }

    .sidebar button i {
      margin-right: 15px;
      font-size: 1.1rem;
      width: 24px;
      text-align: center;
      transition: all 0.3s;
    }

    .sidebar button:hover,
    .sidebar button.active {
      transform: translateX(5px);
    }

    .sidebar button:hover i,
    .sidebar button.active i {
      color: var(--accent-color);
    }

    .logout-btn {
      background: rgba(244, 67, 54, 0.9) !important;
      margin-top: auto;
      margin-bottom: 20px;
      margin-left: 15px;
      margin-right: 15px;
      border-radius: 6px !important;
      justify-content: center;
      font-weight: 500;
      box-shadow: 0 2px 10px rgba(244, 67, 54, 0.3);
    }

    .logout-btn:hover {
      background: var(--danger-color) !important;
      transform: translateY(-2px) !important;
    }

    .logout-btn i {
      margin-right: 10px !important;
    }

    /* Rest of your existing CSS remains the same */
    .main {
      flex: 1;
      padding: 30px;
      overflow-y: auto;
      background-color: #fff;
    }

    .card {
      background-color: white;
      padding: 30px;
      border-radius: 12px;
      box-shadow: var(--card-shadow);
      display: none;
      animation: fadeIn 0.4s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .card.active {
      display: block;
    }

    .card-header {
      margin-bottom: 25px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .card-header h3 {
      font-size: 1.5rem;
      color: var(--primary-dark);
      font-weight: 600;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      color: var(--text-dark);
    }

    input, select {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: 'Poppins', sans-serif;
      font-size: 15px;
      transition: border 0.3s;
    }

    input:focus, select:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 2px var(--primary-light);
    }

    button.submit-btn {
      background-color: var(--primary-color);
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-weight: 500;
      font-size: 15px;
      transition: all 0.3s;
      display: inline-flex;
      align-items: center;
    }

    button.submit-btn i {
      margin-right: 8px;
    }

    button.submit-btn:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      margin-top: 20px;
      overflow: hidden;
      border-radius: 10px;
      box-shadow: var(--card-shadow);
    }

    th, td {
      padding: 15px;
      text-align: center;
      border-bottom: 1px solid #eee;
    }

    th {
      background-color: var(--primary-color);
      color: white;
      font-weight: 500;
      position: sticky;
      top: 0;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tr:hover {
      background-color: var(--primary-light);
    }

    .status-pending {
      color: #FF9800;
      font-weight: 500;
    }

    .status-completed {
      color: var(--primary-color);
      font-weight: 500;
    }

    .status-cancelled {
      color: var(--danger-color);
      font-weight: 500;
    }

    @media (max-width: 768px) {
      body {
        flex-direction: column;
      }
      
      .sidebar {
        width: 100%;
        height: auto;
        padding: 15px;
        background-position: center;
      }
      
      .sidebar-header {
        padding: 0 15px 15px;
      }
      
      .sidebar-nav {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 0;
      }
      
      .sidebar button {
        width: 45%;
        margin: 5px;
        padding: 12px 10px;
        justify-content: center;
        text-align: center;
        flex-direction: column;
      }
      
      .sidebar button i {
        margin-right: 0;
        margin-bottom: 8px;
        font-size: 1.3rem;
      }
      
      .logout-btn {
        width: 93%;
        margin: 10px auto;
      }
    }
  </style>
</head>
<body>
<% Connection con = DBconnection.connect();
int buyerID = GetSet_buyerID.getBuyerId();
int farmerID = GetSet_farmerID.getFarmerID();
PreparedStatement st = con.prepareStatement("SELECT * FROM PRODUCTS");
ResultSet rs = st.executeQuery();
PreparedStatement st2 = con.prepareStatement("SELECT * FROM ORDERS2 WHERE BUYERID = ?");
st2.setInt(1, buyerID);
ResultSet rs2 = st2.executeQuery();
%> 
  <!-- Sidebar -->
  <div class="sidebar">
    <div class="sidebar-header">
      <h2><i class="fas fa-user-tie"></i> Buyer Panel</h2>
      <p>Welcome to your dashboard</p>
    </div>
    <div class="sidebar-nav">
      <button onclick="showSection('browse')" class="active">
        <i class="fas fa-search"></i> <span>Browse Products</span>
      </button>
      <button onclick="showSection('place')">
        <i class="fas fa-cart-plus"></i> <span>Place Order</span>
      </button>
      <button onclick="showSection('track')">
        <i class="fas fa-truck"></i> <span>Track Order</span>
      </button>
      <button onclick="showSection('password')">
        <i class="fas fa-key"></i> <span>Change Password</span>
      </button>
      <form action="logout" method="post">
        <button class="logout-btn">
          <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
        </button>
      </form>
    </div>
  </div>

  <!-- Rest of your HTML remains exactly the same -->
  <!-- Main Content -->
  <div class="main">

    <!-- Browse Products -->
    <div id="browse" class="card active">
      <div class="card-header">
        <h3>Browse Products</h3>
        <button class="submit-btn" onclick="location.reload()">
          <i class="fas fa-sync-alt"></i> Refresh
        </button>
      </div>
      <table>
        <thead>
          <tr>
            <th>Product ID</th>
            <th>Farmer ID</th>
            <th>Product</th>
            <th>Quantity</th>
            <th>Price (Rs)</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          <%while(rs.next()) { %>
          <tr>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getInt(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getInt(4)%></td>
            <td>₹<%=rs.getInt(5)%></td>
            <td><%=rs.getString(6)%></td>
          </tr>
         <%} %>
        </tbody>
      </table>
    </div>

    <!-- Place Order -->
    <div id="place" class="card">
      <div class="card-header">
        <h3>Place Order</h3>
      </div>
      <form action="PlaceOrder" method="POST">
        <div class="form-group">
          <label for="productId">Product ID</label>
          <input type="number" id="productId" name="productId" placeholder="Enter Product ID" required>
        </div>
        <div class="form-group">
          <label for="farmerId">Farmer ID</label>
          <input type="number" id="farmerId" name="farmerId" placeholder="Enter Farmer ID" required>
        </div>
        <div class="form-group">
          <label for="quantity">Quantity</label>
          <input type="number" id="quantity" name="quantity" placeholder="Enter Quantity" required>
        </div>
        <div class="form-group">
          <label for="date">Order Date</label>
          <input type="date" id="date" name="date" required>
        </div>
        <button type="submit" class="submit-btn">
          <i class="fas fa-paper-plane"></i> Place Order
        </button>
      </form>
    </div>

    <!-- Track Orders -->
    <div id="track" class="card">
      <div class="card-header">
        <h3>Track Order Status</h3>
      </div>
      <table>
        <thead>
          <tr>
            <th>Order ID</th>
            <th>Buyer ID</th>
            <th>Farmer ID</th>           
            <th>Product ID</th>
            <th>Quantity</th>
            <th>Order Date</th>
            <th>Status</th> 
          </tr>
        </thead>
        <tbody>
          <%while(rs2.next()) { 
            String statusClass = "";
            String status = rs2.getString(7);
            if (status != null) {
              if (status.equalsIgnoreCase("pending")) {
                statusClass = "status-pending";
              } else if (status.equalsIgnoreCase("completed")) {
                statusClass = "status-completed";
              } else if (status.equalsIgnoreCase("cancelled")) {
                statusClass = "status-cancelled";
              }
            }
          %>
          <tr>
            <td><%=rs2.getInt(1)%></td>
            <td><%=rs2.getInt(2)%></td>
            <td><%=rs2.getInt(3)%></td>
            <td><%=rs2.getInt(4)%></td>
            <td><%=rs2.getInt(5)%></td>
            <td><%=rs2.getString(6)%></td>
            <td class="<%=statusClass%>"><%=status%></td>
          </tr>
         <%} %>
        </tbody>
      </table>
    </div>

    <!-- Change Password -->
    <div id="password" class="card">
      <div class="card-header">
        <h3>Change Password</h3>
      </div>
      <form action="ChangePassword_Of_Buyer" method="POST">
        <div class="form-group">
          <label for="oldPassword">Current Password</label>
          <input type="password" id="oldPassword" name="oldPassword" placeholder="Enter current password" required>
        </div>
        <div class="form-group">
          <label for="newPassword">New Password</label>
          <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password" required>
        </div>
        <button type="submit" class="submit-btn">
          <i class="fas fa-save"></i> Update Password
        </button>
      </form>
    </div>

  </div>

  <!-- Section Toggle Script -->
  <script>
    function showSection(sectionId) {
      const cards = document.querySelectorAll('.card');
      cards.forEach(card => card.classList.remove('active'));
      document.getElementById(sectionId).classList.add('active');

      const buttons = document.querySelectorAll('.sidebar button');
      buttons.forEach(btn => btn.classList.remove('active'));
      event.currentTarget.classList.add('active');
    }
  </script>

</body>
</html>