package com.Clotheng;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("product_id"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        // Database connection details
        String url = "jdbc:mariadb://localhost:3306/Clotheng";
        String user = "root";
        String password = "admin";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            if ("increase".equals(action)) {
                newQuantity++;
            } else if ("decrease" .equals(action) && newQuantity > 1) {
                newQuantity--;
            }

            // Update quantity in cart
            String query = "UPDATE cart SET quantity = ? WHERE product_id = ? AND username = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, newQuantity);
            pstmt.setInt(2, productId);
            pstmt.setString(3, (String) request.getSession().getAttribute("username"));
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        // Redirect back to the shopping cart page
        response.sendRedirect("cart.jsp");
    }
}
