<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Appointment</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('https://images.unsplash.com/photo-1450101499163-c8848c66ca85?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
            padding: 20px;
        }
        
        .appointment-container {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            padding: 40px;
            animation: fadeIn 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .appointment-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .appointment-header h2 {
            color: var(--dark-color);
            margin-bottom: 10px;
            font-size: 28px;
        }
        
        .appointment-header p {
            color: #666;
            font-size: 16px;
        }
        
        .appointment-header i {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 15px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: 500;
            color: var(--dark-color);
            font-size: 15px;
        }
        
        .form-control {
            width: 100%;
            padding: 14px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            transition: all 0.3s;
            background-color: #f9f9f9;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(155, 89, 182, 0.2);
        }
        
        .btn-container {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
            padding: 14px 20px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            font-size: 16px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            flex: 1;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            box-shadow: 0 4px 15px rgba(155, 89, 182, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(155, 89, 182, 0.4);
        }
        
        .btn-secondary {
            background-color: white;
            color: var(--dark-color);
            border: 2px solid #e0e0e0;
        }
        
        .btn-secondary:hover {
            background-color: #f5f5f5;
            border-color: #d0d0d0;
        }
        
        .btn i {
            margin-right: 10px;
            font-size: 18px;
        }
        
        input[type="date"]::-webkit-calendar-picker-indicator,
        input[type="time"]::-webkit-calendar-picker-indicator {
            background: none;
            color: var(--primary-color);
            font-size: 18px;
            opacity: 0.7;
            cursor: pointer;
        }
        
        input[type="date"]:focus::-webkit-calendar-picker-indicator,
        input[type="time"]:focus::-webkit-calendar-picker-indicator {
            opacity: 1;
        }
        
        @media (max-width: 480px) {
            .appointment-container {
                padding: 30px 20px;
            }
            
            .btn-container {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="appointment-container">
        <div class="appointment-header">
            <i class="fas fa-calendar-plus"></i>
            <h2>Schedule Consultation</h2>
            <p>Select date and time for your client meeting</p>
        </div>
        
        <form action="AddAppointment" method="post">
            <input type="hidden" id="caseId" name="caseId">
            <input type="hidden" id="citizenId" name="citizenId">
            
            <div class="form-group">
                <label for="appointmentDate"><i class="far fa-calendar-alt"></i> Appointment Date</label>
                <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" required>
            </div>
            
            <div class="form-group">
                <label for="appointmentTime"><i class="far fa-clock"></i> Appointment Time</label>
                <input type="time" class="form-control" id="appointmentTime" name="appointmentTime" required>
            </div>
            
            <div class="btn-container">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-calendar-check"></i> Confirm Appointment
                </button>
                <a href="case_requests.html" class="btn btn-secondary">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>
        </form>
    </div>

    <script>
        // Get caseId and citizenId from URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        document.getElementById('caseId').value = urlParams.get('caseId') || '';
        document.getElementById('citizenId').value = urlParams.get('citizenId') || '';
        
        // Set minimum date to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('appointmentDate').min = today;
        
        // Set default time to next full hour
        const now = new Date();
        const nextHour = new Date(now.getTime() + (60 - now.getMinutes()) * 60000);
        document.getElementById('appointmentTime').value = 
            nextHour.getHours().toString().padStart(2, '0') + ':00';
        
        // Form submission handler
        document.getElementById('appointmentForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form values
            const date = document.getElementById('appointmentDate').value;
            const time = document.getElementById('appointmentTime').value;
            
            // Show confirmation (would be AJAX call in real implementation)
            alert(`Appointment scheduled for ${date} at ${time}`);
            window.location.href = 'case_requests.html';
        });
    </script>
</body>
</html>