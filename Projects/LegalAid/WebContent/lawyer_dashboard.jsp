<%@ page import="java.util.*" %>
<%@ page import="com.legalAid.model.Cases" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lawyer Dashboard - Case Requests</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #9b59b6;
            --secondary-color: #3498db;
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
        
        .action-btn {
            padding: 6px 12px;
            background-color: var(--secondary-color);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9rem;
            text-decoration: none;
            display: inline-block;
        }
        
        .action-btn:hover {
            opacity: 0.9;
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
    

    <table>
        <thead>
            <tr>
                <th>Case ID</th>
                <th>Case Type</th>
                <th>Citizen Contact</th>
                <th>Request Date</th>
                <th>Description</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <% List<Cases> allCases = (List<Cases>) request.getAttribute("allCases");
           for(Cases cs : allCases) {%>
        <tbody>
            <!-- Sample row 1 -->
            <tr>
                <td><%= cs.getId() %></td>
                <td><%= cs.getCaseType() %></td>
                <td><%= cs.getCitizenContactId() %></td>
                <td><%= cs.getDate() %></td>
                <td><%= cs.getDescription() %></td>
                <td class="status-pending"><%= cs.getStatus() %></td>
                <td>
                    <a href="addAppointment?caseId=<%= cs.getId() %>" 
                       class="action-btn">
                        <i class="fas fa-calendar-check"></i> Schedule
                    </a>
                </td>
            </tr>
            
           
        </tbody>
        <%} %>
    </table>
</body>
</html>