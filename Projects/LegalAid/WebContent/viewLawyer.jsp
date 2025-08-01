<%@ page import="java.util.*" %>
<%@ page import="com.legalAid.model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LegalAid - Manage Lawyers</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #9b59b6;
            --secondary-color: #3498db;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
            --danger-color: #e74c3c;
            --success-color: #2ecc71;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: #333;
        }
        .main-content { padding: 20px; }
        .top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }
        /* Added for positioning both Back and user-info on the right */
        .top-nav-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .user-info {
            display: flex;
            align-items: center;
        }
        .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .section-header h2 { color: var(--dark-color); }
        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            font-size: 0.9rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        .btn-primary:hover {
            background-color: #8e44ad;
        }
        /* Back to Dashboard Button Style */
        .btn-back {
            background-color: var(--secondary-color);
            color: white;
        }
        .btn-back:hover {
            background-color: #2980b9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        th {
            background-color: var(--dark-color);
            color: white;
            font-weight: 500;
        }
        tr:hover { background-color: #f9f9f9; }
        .badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        .badge-active {
            background-color: #d4edda;
            color: #155724;
        }
        .badge-inactive {
            background-color: #f8d7da;
            color: #721c24;
        }
        .action-btns { display: flex; gap: 10px; }
        .btn-sm { padding: 6px 12px; font-size: 0.8rem; }
        .btn-edit { background-color: var(--secondary-color); color: white; }
        .btn-delete { background-color: var(--danger-color); color: white; }
        .btn-view { background-color: var(--success-color); color: white; }
        .search-filter {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            gap: 15px;
        }
        .search-box {
            flex: 1;
            position: relative;
        }
        .search-box input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
        }
        .search-box i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #777;
        }
        .filter-select {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
            min-width: 200px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 5px;
        }
        .page-item {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
        }
        .page-item.active {
            background-color: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        .empty-state {
            text-align: center;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        .empty-state i {
            font-size: 3rem;
            color: #ccc;
            margin-bottom: 15px;
        }
        @media (max-width: 768px) {
            .search-filter {
                flex-direction: column;
            }
            .action-btns {
                flex-direction: column;
                gap: 5px;
            }
            .top-nav-right {
                flex-direction: column;
                align-items: flex-end;
                gap: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="main-content">
        <!-- Top Navigation -->
        <div class="top-nav">
            <h2>Manage Lawyers</h2>
            <!-- Grouping new Back button and user-info right aligned -->
            <div class="top-nav-right">
                <a href="admin_dashboard" class="btn btn-back">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
                <div class="user-info">
                    <img src="https://ui-avatars.com/api/?name=Admin+User&background=9b59b6&color=fff" alt="Admin User">
                    <span>Admin User</span>
                </div>
            </div>
        </div>

        <div class="section-header">
            <h2>Lawyers List</h2>
            <a href="addLawyer" class="btn btn-primary">
                <i class="fas fa-plus"></i> Add New Lawyer
            </a>
        </div>
        
        <!-- Search and Filter -->
        <div class="search-filter">
            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search lawyers...">
            </div>
            <select class="filter-select">
                <option value="">All Specializations</option>
                <option value="Family Law">Family Law</option>
                <option value="Criminal Law">Criminal Law</option>
                <option value="Corporate Law">Corporate Law</option>
                <option value="Intellectual Property">Intellectual Property</option>
                <option value="Immigration Law">Immigration Law</option>
            </select>
            <select class="filter-select">
                <option value="">All Status</option>
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
            </select>
        </div>
        
        <!-- Sample Lawyers Table (with sample data) -->
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Specialization</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <% List<Lawyer> allLawyer = (List<Lawyer>) request.getAttribute("allLawyer");
               for(Lawyer l : allLawyer) {%>
            <tbody>
                <tr>
                    <td><%= l.getName() %></td>
                    <td><%= l.getEmail() %></td>
                    <td><%= l.getContact() %></td>
                    <td><%= l.getSpecialization() %></td>
                    <td>
                        <div class="action-btns">
                            <a href="delete?Lid=<%= l.getContact() %>" >
                                <i class="fas fa-trash"></i>
                            </a>
                        </div>
                    </td>
                </tr>
            </tbody>
            <%} %>
        </table>
        
        <!-- Pagination -->
        
    </div>
</body>
</html>
