<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LegalAid - Online Legal Help Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: #fff;
            line-height: 1.6;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('https://images.unsplash.com/photo-1589829545856-d10d557cf95f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        /* Navigation */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            background-color: rgba(44, 62, 80, 0.9);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .logo {
            font-size: 28px;
            font-weight: 700;
            color: #fff;
            text-decoration: none;
        }
        
        .logo span {
            color: #3498db;
        }
        
        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            font-size: 1rem;
            text-align: center;
            min-width: 180px;
            margin: 8px;
        }
        
        .btn-outline {
            border-color: #3498db;
            color: #3498db;
            background: transparent;
        }
        
        .btn-outline:hover {
            background-color: #3498db;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }
        
        .btn-primary {
            background-color: #3498db;
            color: #fff;
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }
        
        .btn-admin {
            background-color: #9b59b6;
            color: #fff;
        }
        
        .btn-admin:hover {
            background-color: #8e44ad;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(155, 89, 182, 0.3);
        }
        
        /* Hero Section */
        .hero {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 5%;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .hero h1 {
            font-size: 3.2rem;
            margin-bottom: 20px;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 40px;
            max-width: 700px;
            opacity: 0.9;
        }
        
        /* Login Options */
        .login-container {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            margin-top: 30px;
            max-width: 500px;
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .login-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .login-options {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .login-option {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            transition: all 0.3s ease;
            text-decoration: none;
            color: #fff;
        }
        
        .login-option:hover {
            background-color: rgba(52, 152, 219, 0.2);
            transform: translateX(5px);
        }
        
        .login-option i {
            font-size: 1.5rem;
            margin-right: 15px;
            width: 30px;
            text-align: center;
        }
        
        .login-option-text {
            flex: 1;
        }
        
        .login-option-text h3 {
            font-size: 1.1rem;
            margin-bottom: 5px;
        }
        
        .login-option-text p {
            font-size: 0.9rem;
            opacity: 0.8;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 15px;
            }
            
            .logo {
                margin-bottom: 15px;
            }
            
            .hero h1 {
                font-size: 2.2rem;
            }
            
            .btn {
                padding: 10px 20px;
                min-width: 160px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <a href="#" class="logo">Legal<span>Aid</span></a>
        <a href="adminLogin" class="btn btn-admin">
            <i class="fas fa-lock"></i> Admin Login
        </a>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Professional Legal Help Made Simple</h1>
        <p>Connect with verified lawyers and get the legal assistance you need, all in one platform.</p>
        
        <a href="addCitizen" class="btn btn-primary">
            <i class="fas fa-user-plus"></i> Register as Citizen
        </a>
        
        <div class="login-container">
            <h2 class="login-title">Already have an account?</h2>
            <div class="login-options">
                <a href="loginCitizen" class="login-option">
                    <i class="fas fa-user"></i>
                    <div class="login-option-text">
                        <h3>Citizen Login</h3>
                        <p>Access your citizen account</p>
                    </div>
                    <i class="fas fa-chevron-right"></i>
                </a>
                
                <a href="lawyerLogin" class="login-option">
                    <i class="fas fa-gavel"></i>
                    <div class="login-option-text">
                        <h3>Lawyer Login</h3>
                        <p>Access your professional account</p>
                    </div>
                    <i class="fas fa-chevron-right"></i>
                </a>
            </div>
        </div>
    </section>
</body>
</html>