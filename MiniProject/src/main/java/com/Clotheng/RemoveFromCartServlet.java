package com.Clotheng;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product ID from the request
        int productId = Integer.parseInt(request.getParameter("product_id"));
      
        
        // Retrieve the username from the session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        // Database connection setup
        String url = "jdbc:mariadb://localhost:3306/Clotheng"; // Update with your DB URL
        String user = "root"; // Update with your DB username
        String password = "admin"; // Update with your DB password

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load and register the MariaDB JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            // Establish a database connection
            conn = DriverManager.getConnection(url, user, password);

            // Create a query to delete the product from the cart
            String query = "DELETE FROM cart WHERE product_id = ? AND username = ?";

            // Prepare the statement
            pstmt = conn.prepareStatement(query);
            
            // Set the query parameters
            pstmt.setInt(1, productId);
            pstmt.setString(2, username);

            // Execute the update query
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // If deletion is successful, redirect back to the cart page
            	RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
                dispatcher.forward(request, response);
            } else {
                // Handle the case where no rows were affected (e.g., item not found in cart)
                response.getWriter().write("Error: Unable to remove item from the cart.Pls try again");
                RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp?id=" + productId);
                dispatcher.forward(request, response);

            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        } finally {
            // Close the resources to avoid memory leaks
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
