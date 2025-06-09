<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GameVerse - Login/Register</title>
    <style>

    /* Full-screen background with uploaded image */
    body {
        margin: 0;
        padding: 0;
        background: url('assets/Untitled-2-1-1.jpg') no-repeat center center fixed;
        background-size: cover;
        font-family: 'Segoe UI', sans-serif;
        color: white;
    }

    /* Dark overlay to make text readable over the background */
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        background-color: rgba(0, 0, 0, 0.75);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Main login/register box */
    .form-box {
        background-color: #1b1b1b;
        padding: 40px;
        width: 400px;
        border-radius: 12px;
        box-shadow: 0 0 20px rgba(0,0,0,0.5);
        border:1px solid #00aaff
    }

    /* Site name styling */
    .brand {
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
        color: #00aaff;
    }

    /* Section heading (Login/Register) */
    h2 {
        text-align: center;
        margin-bottom: 30px;
        font-weight: 500;
    }

    /* Input field styling */
    input[type="text"], input[type="password"], input[type="email"] {
        width: 100%;
        padding: 12px;
        margin: 12px 0;
        background-color: #2c2c2c;
        border: 1px solid #3c3c3c;
        border-radius: 6px;
        color: white;
        font-size: 14px;
    }

    /* Submit button styling */
    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: linear-gradient(to right, #00aaff, #0077ff);
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 10px;
        transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
        background: linear-gradient(to right, #0077ff, #005ecc);
    }

    /* Toggle between forms */
    .toggle-link {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
    }

    .toggle-link a {
        color: #00aaff;
        text-decoration: none;
    }

    .toggle-link a:hover {
        text-decoration: underline;
    }

    /* Hide inactive form */
    .form {
        display: none;
    }

    /* Show active form */
    .form.active {
        display: block;
    }
    /* Error message styling */
    .error-message {
            color: #ff4444;
            margin: 10px 0;
            text-align: center;
            font-size: 14px;
        }
     /* Success message styling */   
     .success-message {
            color:#AAFF00;
            margin: 10px 0;
            text-align: center;
            font-size: 14px;
        }   

        /* Responsive design */
        @media (max-width: 480px) {
            .form-box {
                width: 90%;
                padding: 20px;
            }
        }

        /* Accessibility labels */
        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        /* Password validation indicator */
        .password-strength {
            color: #aaa;
            font-size: 12px;
            margin-top: -5px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="overlay">
    <div class="form-box">
        <div class="brand">GameVerse</div>

       
        

        <!-- Login Form -->
        <div id="loginForm" class="form active">
            <h2>Sign in</h2>
            
            <form action="${pageContext.request.contextPath}/User/login" method="post">
                <label class="sr-only" for="loginEmail">Email</label>
                <input type="text" id="loginEmail" name="username" placeholder="Email or Username" required>
                
                <label class="sr-only" for="loginPassword">Password</label>
                <input type="password" id="loginPassword" name="password" placeholder="Password" required>
                
                 <!-- Error Messages -->
                <c:if test="${not empty error}">
	            <div class="error-message">
	                <p>${error}</p>
	            </div>
	        </c:if>
         <!-- Success Messages -->
        		<c:if test="${not empty success}">
			    <div class="success-message">
			        <p>${success}</p>
			    </div>
			</c:if>
        		
                
                <input type="submit" value="Sign In">
            </form>
            <div class="toggle-link">
                Don't have an account? <a href="#" onclick="toggleForms()">Create one</a>
            </div>
        </div>

        <!-- Register Form -->
        <div id="registerForm" class="form">
            <h2>Create Account</h2>
            <form action="${pageContext.request.contextPath}/User/register" method="post" onsubmit="return validatePassword()">
                <label class="sr-only" for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstname" placeholder="First Name" required>
                
                <label class="sr-only" for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastname" placeholder="Last Name" required>
                
                <label class="sr-only" for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Username" required>
                
                <label class="sr-only" for="regEmail">Email</label>
                <input type="email" id="regEmail" name="email" placeholder="Email" required>
                
                <label class="sr-only" for="regPassword">Password</label>
                <input type="password" id="regPassword" name="password" placeholder="Password" 
                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                       title="Must contain at least 8 characters, including UPPER/lowercase and numbers" required>
                <div class="password-strength">(Minimum 8 characters with mix of letters and numbers)</div>
                
                <label class="sr-only" for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" 
                       placeholder="Confirm Password" required>
                       
                <input type="hidden" name="role" value="user">
                
                <input type="submit" value="Register">
            </form>
            <div class="toggle-link">
                Already have an account? <a href="#" onclick="toggleForms()">Sign in</a>
            </div>
        </div>
    </div>
</div>

<script>
    function toggleForms() {
        document.getElementById("loginForm").classList.toggle("active");
        document.getElementById("registerForm").classList.toggle("active");
    }

    function validatePassword() {
        const password = document.getElementById('regPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        if (password !== confirmPassword) {
            alert('Passwords do not match!');
            return false;
        }
        return true;
    }

    // Password strength indicator
    document.getElementById('regPassword').addEventListener('input', function(e) {
        const strengthText = document.querySelector('.password-strength');
        const password = e.target.value;
        
        // Add your strength logic here
        if (password.length >= 8) {
            strengthText.style.color = '#00ff00';
        } else {
            strengthText.style.color = '#ff4444';
        }
    });
</script>
</body>
</html>
