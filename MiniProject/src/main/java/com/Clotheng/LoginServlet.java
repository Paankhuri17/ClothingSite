package com.Clotheng;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Database credentials
        String dbUrl = "jdbc:mariadb://localhost:3306/Clotheng";  // Change to your DB URL
        String dbUser = "root";  // Change to your DB username
        String dbPassword = "admin";  // Change to your DB password
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Load the JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            // Establish a connection
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            
            // SQL query to check if user exists
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            if (rs.next()) {
                // If user exists, create a session and redirect to welcome page
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                dispatcher.include(request, response);
            } else {
                // If login fails, redirect back to login page with error message
                request.setAttribute("errorMessage", "Invalid username or password.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
