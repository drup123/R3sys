<%@ page import="java.util.*" %>
<%@ page import="com.legalAid.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LegalAid - Citizens Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #8e44ad;
            --secondary-color: #3498db;
            --dark-color: #2c3e50;
            --light-color: #f5f7fa;
            --success-color: #2ecc71;
            --danger-color: #e74c3c;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-color);
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        h1 { color: var(--primary-color); }
        .header-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
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
        .btn-primary:hover { background-color: #7d3c98; }
        /* Back to Dashboard Button Style */
        .btn-back {
            background-color: var(--secondary-color);
            color: white;
        }
        .btn-back:hover {
            background-color: #2980b9;
        }
        .btn-sm {
            padding: 6px 12px;
            font-size: 0.8rem;
            border-radius: 4px;
        }
        .btn-delete {
            background-color: var(--danger-color);
            color: white;
        }
        .btn-delete:hover {
            background-color: #c0392b;
        }
        .search-filter {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
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
            min-width: 150px;
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
        .action-btns {
            display: flex;
            gap: 10px;
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
        @media (max-width: 768px) {
            .search-filter { flex-direction: column; }
            .action-btns {
                flex-direction: column;
                gap: 5px;
            }
            table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1><i class="fas fa-users"></i> Citizens Management</h1>
            <div class="header-actions">
                <a href="admin_dashboard" class="btn btn-back">
                    <i class="fas fa-arrow-left"></i> Back to Dashboard
                </a>
            </div>
        </header>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Contact</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Adress</th>
                    <th>Password</th>
                    
                </tr>
            </thead>
             <% List<Citizen> allCitizen = (List<Citizen>) request.getAttribute("allCitizen");
               for(Citizen l : allCitizen) {%>
            <tbody>
                <tr>
                    <td>
                        <!-- Avatar removed as per your request, just show contact -->
                        <%= l.getContact() %>
                    </td>
                    <td><%= l.getName() %></td>
                    <td><%= l.getEmail() %></td>
                    <td><%= l.getAdress() %></td>
                    <td><%= l.getPassword() %></td>
                   
                </tr>
            </tbody>
            <%} %>
        </table>
    </div>
    <script>

    </script>
</body>
</html>
