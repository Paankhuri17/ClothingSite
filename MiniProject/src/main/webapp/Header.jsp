<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Insert title here</title>
    <style>
        .navbar {
            background-color: #fff;
            text-align: center;
            padding: 15px 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            color: #333;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }

        .navbar a:hover {
            color: #555;
        }

        .navbar .right {
            float: right;
        }
    </style>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {       
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    } else {
%>
    <div class="navbar">
        <a href="/MiniProject/home.jsp">CLOTHENG</a>
        <a href="/MiniProject/men.jsp">MEN</a>
        <a href="/MiniProject/women.jsp">WOMEN</a>
        <a href="/MiniProject/new-arrivals.jsp">NEW ARRIVALS</a>
        <a href="/MiniProject/sale.jsp">SALE</a>
        <a href="/MiniProject/accessories.jsp">ACCESSORIES</a>

        <div class="right">
            <a href="/MiniProject/LogoutServlet">LOGOUT</a>
            <a href="/MiniProject/cart.jsp">
                <i class="fa fa-shopping-cart" style="font-size:24px;"></i>
            </a>
        </div>

        <% if (username.equals("pankhi")) { %>
            <a href="admin.jsp">DATA SUBMISSION</a>
        <% } %>
    </div>
<%
    }
%>
</body>
</html>
