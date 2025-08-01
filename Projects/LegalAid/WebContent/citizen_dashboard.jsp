<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LegalAid - Citizen Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #8e44ad;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
            --text-color: #34495e;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            min-height: 100vh;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
            position: relative;
            overflow-x: hidden;
        }
        
        body::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url('https://images.unsplash.com/photo-1450101499163-c8848c66ca85?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
    background-size: cover;
    background-position: center;
    opacity: 0.3; /* Increased from 0.08 */
    z-index: -1;
}

body::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255,255,255,0.7);
    z-index: -1;
}
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 60px;
            animation: fadeInDown 0.8s ease-out;
        }
        
        .header h1 {
            color: var(--primary-color);
            margin-bottom: 15px;
            font-size: 2.5rem;
            font-weight: 700;
            letter-spacing: -0.5px;
        }
        
        .header p {
            color: var(--text-color);
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto;
            opacity: 0.9;
        }
        
        .panel-container {
            display: flex;
            justify-content: center;
            gap: 40px;
            flex-wrap: wrap;
        }
        
        .panel {
            flex: 1;
            min-width: 300px;
            max-width: 450px;
            background-color: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.1);
            cursor: pointer;
            min-height: 400px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.3);
        }
        
        .panel::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
            transform: rotate(45deg);
            transition: all 0.6s ease;
            opacity: 0;
        }
        
        .panel:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.12);
        }
        
        .panel:hover::before {
            animation: shine 1.5s ease;
        }
        
        .panel-icon {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color) 0%, #9b59b6 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
            color: white;
            font-size: 2.5rem;
            box-shadow: 0 10px 20px rgba(142, 68, 173, 0.3);
            transition: all 0.4s ease;
        }
        
        .panel:hover .panel-icon {
            transform: scale(1.1);
        }
        
        .panel-icon.appointment {
            background: linear-gradient(135deg, var(--secondary-color) 0%, #2980b9 100%);
            box-shadow: 0 10px 20px rgba(52, 152, 219, 0.3);
        }
        
        .panel h2 {
            margin-bottom: 20px;
            color: var(--dark-color);
            font-size: 1.8rem;
            font-weight: 600;
        }
        
        .panel p {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
            font-size: 1rem;
        }
        
        .btn {
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 500;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: all 0.6s ease;
        }
        
        .btn:hover::before {
            left: 100%;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #7d3c98;
            box-shadow: 0 8px 20px rgba(142, 68, 173, 0.3);
        }
        
        .btn-secondary {
            background-color: var(--secondary-color);
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #2980b9;
            box-shadow: 0 8px 20px rgba(52, 152, 219, 0.3);
        }
        
        .footer {
            text-align: center;
            margin-top: 60px;
            color: var(--text-color);
            opacity: 0.7;
            font-size: 0.9rem;
            animation: fadeIn 1s ease-out;
        }
        
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        @keyframes shine {
            0% {
                opacity: 0;
                left: -100%;
            }
            20% {
                opacity: 0.5;
            }
            100% {
                opacity: 0;
                left: 100%;
            }
        }
        
        @media (max-width: 768px) {
            .header h1 {
                font-size: 2rem;
            }
            
            .header p {
                font-size: 1rem;
            }
            
            .panel {
                min-height: 350px;
                padding: 30px;
            }
            
            .panel-icon {
                width: 80px;
                height: 80px;
                font-size: 2rem;
            }
            
            .panel h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>LegalAid Citizen Portal</h1>
            <p>Access legal services with ease. Choose an option below to get started.</p>
        </div>
        
        <div class="panel-container">
            <!-- Case Request Panel -->
            <a href="addCaseRequest" class="panel">
                <div class="panel-icon">
                    <i class="fas fa-file-contract"></i>
                </div>
                <h2>Submit Case Request</h2>
                <p>Begin your legal journey by submitting a detailed request. Our qualified lawyers will review your case and get in touch with you.</p>
                <div class="btn btn-primary">Start Your Case</div>
            </a>
            
            <!-- View Appointments Panel -->
            <a href="viewAppointment" class="panel">
                <div class="panel-icon appointment">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <h2>View Appointments</h2>
                <p>Manage your scheduled consultations, reschedule meetings, or book new appointments with your legal representatives.</p>
                <div class="btn btn-secondary">Check Schedule</div>
            </a>
        </div>
        
        <div class="footer">
            <p>Need help? Contact our support team at support@legalaid.example.com</p>
        </div>
    </div>
</body>
</html>