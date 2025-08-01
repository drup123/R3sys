<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "project_01.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Farmer Dashboard | Marketp</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    :root {
      --primary-color: #4CAF50;
      --primary-dark: #388E3C;
      --secondary-color: #FFC107;
      --text-color: #333;
      --light-gray: #f5f5f5;
      --white: #ffffff;
      --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      --transition: all 0.3s ease;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #f9f9f9;
      display: flex;
      min-height: 100vh;
      color: var(--text-color);
      background-image: url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      background-blend-mode: overlay;
      background-color: rgba(255,255,255,0.9);
    }

    .sidebar {
      width: 300px;
      background: rgba(255, 255, 255, 0.95);
      padding: 0;
      color: var(--text-color);
      display: flex;
      flex-direction: column;
      box-shadow: 5px 0 15px rgba(0,0,0,0.1);
      z-index: 10;
      backdrop-filter: blur(5px);
      border-right: 1px solid rgba(0,0,0,0.05);
    }

    .sidebar-header {
      text-align: center;
      padding: 30px 20px;
      background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
      color: white;
      margin-bottom: 20px;
      position: relative;
      overflow: hidden;
    }

    .sidebar-header::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
      transform: rotate(30deg);
    }

    .sidebar-header h2 {
      font-size: 24px;
      font-weight: 600;
      margin-bottom: 5px;
      position: relative;
    }

    .sidebar-header p {
      font-size: 14px;
      opacity: 0.9;
      position: relative;
    }

    .sidebar-nav {
      flex: 1;
      display: flex;
      flex-direction: column;
      padding: 0 15px;
    }

    .sidebar button {
      width: 100%;
      padding: 15px 25px;
      border: none;
      background: transparent;
      color: var(--text-color);
      text-align: left;
      font-size: 15px;
      cursor: pointer;
      transition: var(--transition);
      display: flex;
      align-items: center;
      gap: 12px;
      border-radius: 8px;
      margin: 5px 0;
      position: relative;
      overflow: hidden;
    }

    .sidebar button::before {
      content: '';
      position: absolute;
      left: 0;
      top: 0;
      width: 3px;
      height: 100%;
      background: var(--primary-color);
      transform: scaleY(0);
      transition: var(--transition);
      transform-origin: bottom;
    }

    .sidebar button i {
      width: 20px;
      text-align: center;
      color: var(--primary-color);
      transition: var(--transition);
    }

    .sidebar button:hover,
    .sidebar button.active {
      background-color: rgba(76, 175, 80, 0.1);
      color: var(--primary-dark);
    }

    .sidebar button:hover::before,
    .sidebar button.active::before {
      transform: scaleY(1);
    }

    .sidebar button:hover i,
    .sidebar button.active i {
      color: var(--primary-dark);
      transform: scale(1.1);
    }

    .logout-btn {
      margin-top: auto;
      margin-bottom: 20px;
      background-color: rgba(231, 76, 60, 0.1) !important;
      color: #e74c3c !important;
    }

    .logout-btn i {
      color: #e74c3c !important;
    }

    .logout-btn:hover {
      background-color: rgba(231, 76, 60, 0.2) !important;
    }

    .main {
      flex: 1;
      padding: 30px;
      overflow-y: auto;
      background-color: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(5px);
      box-shadow: -5px 0 15px rgba(0,0,0,0.05);
    }

    /* Rest of your existing styles remain the same */
    .card {
      background-color: white;
      padding: 30px;
      border-radius: 12px;
      box-shadow: var(--box-shadow);
      display: none;
      animation: fadeIn 0.5s ease;
      border: 1px solid rgba(0,0,0,0.05);
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
      font-size: 22px;
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
      color: #555;
    }

    input, select {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 15px;
      transition: var(--transition);
      background-color: var(--light-gray);
    }

    input:focus, select:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
      background-color: var(--white);
    }

    button.submit-btn {
      background-color: var(--primary-color);
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 8px;
      font-size: 15px;
      font-weight: 500;
      cursor: pointer;
      transition: var(--transition);
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }

    button.submit-btn:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      box-shadow: var(--box-shadow);
    }

    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #eee;
    }

    th {
      background-color: var(--primary-color);
      color: white;
      font-weight: 500;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tr:hover {
      background-color: #f1f1f1;
    }

    .status-pending {
      color: #f39c12;
      font-weight: 500;
    }

    .status-confirmed {
      color: var(--primary-color);
      font-weight: 500;
    }

    .action-btn {
      padding: 6px 12px;
      border-radius: 4px;
      font-size: 13px;
      font-weight: 500;
      text-decoration: none;
      transition: var(--transition);
    }

    .confirm-btn {
      background-color: var(--primary-color);
      color: white;
      margin-right: 5px;
    }

    .confirm-btn:hover {
      background-color: var(--primary-dark);
    }

    .wait-btn {
      background-color: #e74c3c;
      color: white;
    }

    .wait-btn:hover {
      background-color: #c0392b;
    }

    @media (max-width: 768px) {
      body {
        flex-direction: column;
        background-attachment: scroll;
      }
      
      .sidebar {
        width: 100%;
        padding: 0;
      }
      
      .sidebar-nav {
        flex-direction: row;
        flex-wrap: wrap;
        padding: 10px;
      }
      
      .sidebar button {
        padding: 12px 15px;
        justify-content: center;
        flex: 1 0 45%;
        margin: 5px;
      }
      
      .logout-btn {
        flex: 1 0 100%;
      }
      
      .main {
        padding: 20px;
      }
    }
  </style>
</head>
<body>

<% Connection con = DBconnection.connect();
int farmerID = GetSet_farmerID.getFarmerID();
PreparedStatement st2 = con.prepareStatement("SELECT * FROM ORDERS2 WHERE FARMERID = ?");
st2.setInt(1, farmerID);
ResultSet rs2 = st2.executeQuery();%>

  <!-- Sidebar -->
  <div class="sidebar">
    <div class="sidebar-header">
      <h2>Farmer Dashboard</h2>
      <p>Manage your products & orders</p>
    </div>
    
    <div class="sidebar-nav">
      <button onclick="showSection('post')" class="active">
        <i class="fas fa-plus-circle"></i> Post Product
      </button>
      <button onclick="showSection('orders')">
        <i class="fas fa-clipboard-list"></i> View Orders
      </button>
      <button onclick="showSection('password')">
        <i class="fas fa-key"></i> Change Password
      </button>
      
      <form action="logout" method="post">
        <button class="logout-btn">
          <i class="fas fa-sign-out-alt"></i> Logout
        </button>
      </form>
    </div>
  </div>

  <!-- Main Content -->
  <div class="main">
    <!-- Post Product Section -->
    <div id="post" class="card active">
      <div class="card-header">
        <h3>Post Product for Sale</h3>
      </div>
      <form action="Postproducts" method="POST">
        <div class="form-group">
          <label for="productName">Product Name</label>
          <input type="text" id="productName" name="productName" placeholder="Enter product name" required>
        </div>
        <div class="form-group">
          <label for="quantity">Quantity</label>
          <input type="number" id="quantity" name="quantity" placeholder="Enter quantity (e.g. 100)" required>
        </div>
        <div class="form-group">
          <label for="price">Price per unit (Rs)</label>
          <input type="number" id="price" name="price" placeholder="Enter price per unit" required>
        </div>
        <div class="form-group">
          <label for="date">Available Date</label>
          <input type="date" id="date" name="date" required>
        </div>
        <button type="submit" class="submit-btn">
          <i class="fas fa-upload"></i> Post Product
        </button>
      </form>
    </div>

    <!-- Orders Section -->
    <div id="orders" class="card">
      <div class="card-header">
        <h3>Orders Received</h3>
      </div>
      <table>
        <thead>
          <tr>
            <th>Order ID</th>            
            <th>Buyer ID</th>
            <th>Product ID</th>
            <th>Quantity</th>
            <th>Order Date</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%while(rs2.next()) { %>
          <tr>
            <td><%=rs2.getInt(1)%></td>
            <td><%=rs2.getInt(2)%></td>
            <td><%=rs2.getInt(4)%></td>
            <td><%=rs2.getInt(5)%></td>
            <td><%=rs2.getString(6)%></td>
            <td class="status-<%= rs2.getString(7).toLowerCase() %>"><%=rs2.getString(7)%></td>
            <td>
              <a href="confirm_order.jsp?id=<%= rs2.getInt(1)%>" class="action-btn confirm-btn">
                <i class="fas fa-check"></i> Confirm
              </a>
              <a href="wait_order.jsp?id=<%= rs2.getInt(1)%>" class="action-btn wait-btn">
                <i class="fas fa-clock"></i> Wait
              </a>
            </td>
          </tr>
         <%} %>
        </tbody>
      </table>
    </div>

    <!-- Change Password Section -->
    <div id="password" class="card">
      <div class="card-header">
        <h3>Change Password</h3>
      </div>
      <form action="ChangePassword" method="POST">
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