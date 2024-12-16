<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .login-container {
            width: 300px;
            margin: 100px auto;
            background: white;
            padding: 54px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-container input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            cursor: pointer;
        }
        .login-container button:hover {
            background-color: #218838;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="POST">
            <input type="text" name="username" placeholder="Enter Username" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <button type="submit">Login</button>
        </form>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="error"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    	<a href="register.jsp" style="text-align:right; text-decoration:none;margin-top:50px;">Register yourself</a>
    </div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
