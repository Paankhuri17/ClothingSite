package com.Clotheng;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PlaceOrderServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // Redirect GET requests to POST
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mariadb://localhost:3306/Clotheng";
        String user = "root";
        String password = "admin";
                
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        String orderId=null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            String query2 = "INSERT INTO orderkey (rough) VALUES (0)";
            pstmt = conn.prepareStatement(query2);
            pstmt.executeUpdate();

            String query3 = "SELECT id FROM orderKey ORDER BY id DESC LIMIT 1";
            pstmt = conn.prepareStatement(query3);
            rs2 = pstmt.executeQuery();
            if (rs2.next()) {
                orderId = rs2.getString("id");
            }
            PrintWriter out=response.getWriter();
            
            request.setAttribute("orderId", orderId);
            // Fetch items from cart for the user
            String query = "SELECT product_id, quantity FROM cart WHERE username = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            rs1 = pstmt.executeQuery();
            
            while (rs1.next()) {
                int productId = rs1.getInt("product_id");
                int quantity = rs1.getInt("quantity");
                // Insert order into the order table
                String query1 = "INSERT INTO `ORDER` (OrderId, username, product_id, quantity) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(query1);
                pstmt.setString(1, orderId);
                pstmt.setString(2, username);
                pstmt.setInt(3, productId);
                pstmt.setInt(4, quantity);
                pstmt.executeUpdate();
            }

            // Clear the cart after placing the order
            String query4 = "DELETE FROM cart WHERE username = ?"; 
            pstmt = conn.prepareStatement(query4);
            pstmt.setString(1, username);
            pstmt.executeUpdate();
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("orderConfirmation.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs2 != null) rs2.close();
                if (rs1 != null) rs1.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}