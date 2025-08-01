<%@ page import="java.util.*" %>
<%@ page import="com.legalAid.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Requested Cases</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #9b59b6;
            --dark-color: #2c3e50;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            padding: 20px;
            background-color: #f5f7fa;
        }
        
        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 8px 16px;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
        }
        
        .back-btn i {
            margin-right: 5px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            border-radius: 8px;
            overflow: hidden;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background-color: var(--dark-color);
            color: white;
            font-weight: 500;
        }
        
        tr:hover {
            background-color: #f9f9f9;
        }
        
        .status-pending {
            color: #e67e22;
            font-weight: 500;
        }
        
        .status-approved {
            color: #27ae60;
            font-weight: 500;
        }
        
        .status-rejected {
            color: #e74c3c;
            font-weight: 500;
        }
        
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <a href="admin_dashboard" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>

    <table>
        <thead>
            <tr>
                <th>Case ID</th>
                <th>Case Type</th>
                <th>citizenContactID</th>
                <th>Request Date</th>
                <th>Description</th>
                <th>Status</th>
            </tr>
        </thead>
         <% List<Cases> allCases = (List<Cases>) request.getAttribute("allCases");
               for(Cases l : allCases) {%>
        
        <tbody>
            <!-- Sample data - replace with dynamic content from backend -->
            <tr>
                <td><%= l.getId() %></td>
                <td><%= l.getCaseType() %></td>
                <td><%= l.getCitizenContactId() %></td>
                <td><%= l.getDate() %></td>
                <td><%= l.getDescription() %></td>
                <td class="status-pending"><%= l.getStatus() %></td>
            </tr>
            
        </tbody>
        <%} %>
    </table>
</body>
</html>