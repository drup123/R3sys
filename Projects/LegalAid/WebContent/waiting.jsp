
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LegalAid - Case Status</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #8e44ad;
            --secondary-color: #3498db;
            --dark-color: #2c3e50;
            --light-color: #f5f7fa;
            --warning-color: #f39c12;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-color);
            color: var(--dark-color);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 600px;
            width: 90%;
            margin: 0 auto;
            padding: 40px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            text-align: center;
        }

        .status-icon {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #fff8e6;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 25px;
            color: var(--warning-color);
            font-size: 3rem;
            border: 5px solid var(--warning-color);
        }

        h1 {
            color: var(--dark-color);
            margin-bottom: 15px;
            font-size: 1.8rem;
        }

        p {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .case-details {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: left;
        }

        .detail-item {
            display: flex;
            margin-bottom: 10px;
        }

        .detail-item:last-child {
            margin-bottom: 0;
        }

        .detail-label {
            font-weight: 500;
            width: 120px;
            color: #555;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #7d3c98;
            transform: translateY(-2px);
        }

        .btn i {
            margin-right: 8px;
        }

        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
            }
            
            .status-icon {
                width: 80px;
                height: 80px;
                font-size: 2.5rem;
            }
            
            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="status-icon">
            <i class="fas fa-clock"></i>
        </div>
        
        <h1>Your Case is in Queue</h1>
        <p>We've received your case request and it's currently waiting for a lawyer to be assigned. You'll be notified as soon as an appointment is scheduled.</p>
        
        <div class="case-details">
          
            <div class="detail-item">
                <span class="detail-label">Status:</span>
                <span style="color: var(--warning-color); font-weight: 500;">Waiting for Appointment</span>
            </div>
        </div>
        
        <a href="citizen_dashboard" class="btn">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</body>
</html>