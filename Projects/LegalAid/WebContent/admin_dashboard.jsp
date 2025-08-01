<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.legalAid.model.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LegalAid - Admin Dashboard</title>
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
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: #333;
        }
        
        /* Main Content Styles */
        .main-content {
            padding: 20px;
        }
        
        /* Top Navigation */
        .top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 20px;
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
        
        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .dashboard-card {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }
        
        .card-icon.lawyer {
            background-color: var(--primary-color);
        }
        
        .card-icon.citizen {
            background-color: var(--secondary-color);
        }
        
        .card-icon.case {
            background-color: var(--success-color);
        }
        
        .card-icon.appointment {
            background-color: #f39c12;
        }
        
        .card-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 10px;
        }
        
        .card-actions {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }
        
        .card-btn {
            padding: 8px 15px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            font-size: 0.9rem;
            text-decoration: none;
            display: inline-block;
        }
        
        .card-btn.primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .card-btn.secondary {
            background-color: var(--secondary-color);
            color: white;
        }
        
        .card-btn:hover {
            opacity: 0.9;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .dashboard-cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="main-content">
        <!-- Top Navigation -->
        <div class="top-nav">
            <h2>Dashboard</h2>
            <div class="user-info">
                <img src="https://ui-avatars.com/api/?name=Admin+User&background=9b59b6&color=fff" alt="Admin User">
                <span>Admin User</span>
            </div>
        </div>
        
        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <!-- Lawyers Card -->
            <div class="dashboard-card">
                <div class="card-header">
                    <div class="card-icon lawyer">
                        <i class="fas fa-user-tie"></i>
                    </div>
                    <h3>lawyerCount</h3>
                </div>
                <div class="card-title">Lawyers</div>
                <p>Manage legal professionals in the system</p>
                <div class="card-actions">
                    <a href="addLawyer" class="card-btn primary">Register Lawyer</a>
                    <a href="viewLawyer" class="card-btn secondary">View All</a>
                </div>
            </div>
            
            <!-- Citizens Card -->
            <div class="dashboard-card">
                <div class="card-header">
                    <div class="card-icon citizen">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3>${citizenCount}</h3>
                </div>
                <div class="card-title">Citizens</div>
                <p>View and manage registered citizens</p>
                <div class="card-actions">
                    <a href="viewCitizen" class="card-btn secondary">View All</a>
                </div>
            </div>
            
            <!-- Cases Card -->
            <div class="dashboard-card">
                <div class="card-header">
                    <div class="card-icon case">
                        <i class="fas fa-gavel"></i>
                    </div>
                    <h3>${caseCount}</h3>
                </div>
                <div class="card-title">Cases</div>
                <p>Manage all legal cases in the system</p>
                <div class="card-actions">
                    <a href="viewCases" class="card-btn secondary">View All</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>