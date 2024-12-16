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

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String URL = "jdbc:mariadb://localhost:3306/Clotheng";
    private static final String USER = "root";
    private static final String PASSWORD = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customerName = (String) session.getAttribute("username");
        
        // Check if user is logged in
        if (customerName == null) {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
        	Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        
            PreparedStatement pstmtSelect = conn.prepareStatement("SELECT * FROM cart WHERE username = ? AND product_id = ?");
            PreparedStatement pstmtUpdate = conn.prepareStatement("UPDATE cart SET quantity = ? WHERE username = ? AND product_id = ?");
            PreparedStatement pstmtInsert = conn.prepareStatement("INSERT INTO cart (username, product_id, quantity) VALUES (?, ?, ?)"); 

            int productId = Integer.parseInt(request.getParameter("id"));

            pstmtSelect.setString(1, customerName);
            pstmtSelect.setInt(2, productId);
            try (ResultSet rs = pstmtSelect.executeQuery()) {
                if (rs.next()) {
                    // If the product already exists, update the quantity
                    int quantity = rs.getInt("quantity");
                    pstmtUpdate.setInt(1, quantity + 1);
                    pstmtUpdate.setString(2, customerName);
                    pstmtUpdate.setInt(3, productId);
                    pstmtUpdate.executeUpdate();
                } else {
                    // If the product doesn't exist in the cart, insert a new record
                    pstmtInsert.setString(1, customerName);
                    pstmtInsert.setInt(2, productId);
                    pstmtInsert.setInt(3, 1); // Default quantity is 1 for a new item
                    pstmtInsert.executeUpdate();
                }
            }

            response.sendRedirect("products.jsp?id=" + productId);

        } catch (Exception e) {
            e.printStackTrace(); 
        }
    }
}
