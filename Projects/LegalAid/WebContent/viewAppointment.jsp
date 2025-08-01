<%@ page import="java.util.*" %>
<%@ page import="com.legalAid.model.Appointment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Appointments</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #9b59b6;
            --secondary-color: #3498db;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            padding: 20px;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('https://images.unsplash.com/photo-1450101499163-c8848c66ca85?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: white;
            font-size: 28px;
        }
        
        .back-btn {
            padding: 10px 20px;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .back-btn:hover {
            background-color: #8e44ad;
        }
        
        .appointments-card {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            padding: 25px;
        }
        
        .filter-controls {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .filter-select {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
            min-width: 200px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
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
        
        tr:hover {
            background-color: #f9f9f9;
        }
        
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .status-upcoming {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-completed {
            background-color: #e2e3e5;
            color: #383d41;
        }
        
        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .action-btn {
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 0.9rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .action-btn.view {
            background-color: var(--secondary-color);
            color: white;
        }
        
        .action-btn.cancel {
            background-color: #e74c3c;
            color: white;
        }
        
        .action-btn:hover {
            opacity: 0.9;
        }
        
        .empty-state {
            text-align: center;
            padding: 40px;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #ccc;
            margin-bottom: 15px;
        }
        
        @media (max-width: 768px) {
            .filter-controls {
                flex-direction: column;
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
        <div class="header">
            <h1><i class="fas fa-calendar-alt"></i> My Appointments</h1>
            <a href="citizen_dashboard" class="back-btn">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
        
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Case ID</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Lawyer ContactId</th>
                       
                    </tr>
                </thead>
               <% List<Appointment> allAppointment = (List<Appointment>) request.getAttribute("allAppointment");
               for(Appointment a : allAppointment) {%>
                <tbody>
                    <!-- Sample Appointment 1 -->
                    <tr>
                        <td><%= a.getId() %></td>
                        <td><%= a.getCaseId() %></td>
                        <td><%= a.getDate() %></td>
                        <td><%= a.getTime() %></td>
                        <td><%= a.getLawyerContactId() %></td>
                       
                </tbody>
                <%} %>
            </table>
        </div>
    </div>

    <script>
        // Simple filter functionality (frontend only)
        document.getElementById('statusFilter').addEventListener('change', function() {
            console.log('Filter by status:', this.value);
            // In a real implementation, this would filter the table
        });
        
        document.getElementById('dateFilter').addEventListener('change', function() {
            console.log('Filter by date:', this.value);
            // In a real implementation, this would filter the table
        });
        
        // Cancel button confirmation
        document.querySelectorAll('.action-btn.cancel').forEach(btn => {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                if(confirm('Are you sure you want to cancel this appointment?')) {
                    // In a real implementation, this would make an API call
                    alert('Appointment cancelled (this would call your backend in real implementation)');
                }
            });
        });
    </script>
</body>
</html>