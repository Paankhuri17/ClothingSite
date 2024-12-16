package com.Clotheng;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetch form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Step 1: Load the JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            // Step 2: Create a database connection
            String dbURL = "jdbc:mariadb://localhost:3306/Clotheng";
            String dbUser = "root";
            String dbPassword = "admin"; // Update with your DB password
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Step 3: Create a SQL query
            String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";

            // Step 4: Create a prepared statement
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);

            // Step 5: Execute the query
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h3>Registration successful!</h3>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);

            } else {
                out.println("<h3>Registration failed. Please try again.</h3>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            }

            // Step 6: Close the connection
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
