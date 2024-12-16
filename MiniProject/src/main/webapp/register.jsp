<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .register-container {
            width: 300px;
            margin: 100px auto;
            background: white;
            padding: 54px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .register-container input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
        }
        .register-container button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            cursor: pointer;
        }
        .register-container button:hover {
            background-color: #218838;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="POST">
            <input type="text" name="name" placeholder="Enter your name" required>
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="password" placeholder="Enter your password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
            <button type="submit">Register</button>
            <a href="index.jsp">Already Registered?Click here</a>
        </form>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
    
</body>
</html>
