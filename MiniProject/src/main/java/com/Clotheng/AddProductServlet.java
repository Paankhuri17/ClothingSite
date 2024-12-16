package com.Clotheng;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@MultipartConfig
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String DB_URL = "jdbc:mariadb://localhost:3306/Clotheng";
    private static final String USER = "root";
    private static final String PASS = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
    	String name = request.getParameter("name");
    	String price = request.getParameter("price");
        String category = request.getParameter("category");
        String newArrival = request.getParameter("newArrival");
        String sale = request.getParameter("sale");
        String accessory = request.getParameter("accessory");
        String type=request.getParameter("type");
        String quantity=request.getParameter("quantity");
    	
    	try {

     // Handle the image file upload
        Part imagePart = request.getPart("image");
        String fileName = extractFileName(imagePart);

        // Get the real path for the "Images" directory relative to the web application
        String uploadPath = request.getServletContext().getRealPath("/Images/" + fileName);
        PrintWriter out=response.getWriter();
        imagePart.write(uploadPath);
        
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            String sql = "INSERT INTO products (name, price, category, new_arrival, sale, accessory, image_url, type, quantity) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, name);
            stmt.setDouble(2, Double.parseDouble(price));
            stmt.setString(3, category);
            stmt.setString(4, newArrival);
            stmt.setString(5, sale);
            stmt.setString(6, accessory);
            stmt.setString(7, "Images/" + fileName); 
            stmt.setString(8, type);
            stmt.setString(9, quantity);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
            	
                out.println("<h1>Record Successfully added. Do you want to add more data? </h1>");
                
                // Include another resource
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
                dispatcher.include(request, response);
             } else {
            	 response.setContentType("text/html");
                 
                 out.println("<h1>Error: Please try again.</h1>");
                 
                 // Include another resource
                 RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
                 dispatcher.include(request, response);}
            // Close resources
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    // Helper method to extract the file name from the file part
    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}
