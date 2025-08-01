<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LegalAid - Submit Case Request</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #8e44ad;
            --secondary-color: #3498db;
            --dark-color: #2c3e50;
            --light-color: #f9f9f9;
            --text-color: #333;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .header p {
            color: #666;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark-color);
        }

        input[type="text"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            transition: border 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus,
        textarea:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 2px rgba(142, 68, 173, 0.2);
        }

        textarea {
            min-height: 150px;
            resize: vertical;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
        }

        .btn:hover {
            background-color: #7d3c98;
        }

        .btn-block {
            display: block;
            width: 100%;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .back-link i {
            margin-right: 5px;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Submit Case Request</h1>
            <p>Fill out the form below to submit your legal case</p>
        </div>

        <form action="addCase" method="post">
            <div class="form-group">
                <label for="caseType">Case Type</label>
                <select id="caseType" name="caseType" required>
                    <option value="">Select a case type</option>
                    <option value="family">Family Law</option>
                    <option value="criminal">Criminal Law</option>
                    <option value="property">Property Dispute</option>
                    <option value="employment">Employment Law</option>
                    <option value="immigration">Immigration</option>
                    <option value="other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label for="description">Case Description</label>
                <textarea id="description" name="description" placeholder="Please describe your legal issue in detail..." required></textarea>
            </div>

            <div class="form-group">
                <label for="date">Date of Incident (if applicable)</label>
                <input type="date" id="date" name="date">
            </div>

            <button type="submit" class="btn btn-block">Submit Request</button>
        </form>

        <a href="citizen_dashboard" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>

    
</body>
</html>