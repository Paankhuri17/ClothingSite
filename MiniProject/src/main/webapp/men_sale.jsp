<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sale</title>
    <style>
    /* General Styling */
	body, html {
	    margin: 0;
	    padding: 0;
	    font-family: Arial, sans-serif;
	}
			
	.cart-icon {
	    background-color: #ff5722;
	    color: white;
	    padding: 5px 10px;
	    border-radius: 5px;
	}
	
	.hero-section {
	    background-image: url('Images/sale_main.jpg');
	    
	    background-size: cover;
	    background-position: center;
	    color: white;
	    height: 60vh;
	    
	    justify-content: center;
	    align-items: center;
	    text-align: center;
	}
	
	.featured-categories {
	    padding: 50px 20px;
	    text-align: center;
	}
	
	.category-grid {
	    display: grid;
	    grid-template-columns: repeat(4, 1fr);
	    gap: 20px;
	}
	
	.category-grid a {
    	text-decoration: none; /* Remove underline */
    	color: inherit; /* Inherit the text color from the parent elements */
	}
	
	
	.category-card {
	    background-color: #f9f9f9;
	    padding: 20px;
	    border-radius: 10px;
	    text-align: center;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	}
	
	.category-card img {
	    width: 50px;
	    height: 70px;
	    border-radius: 5px;
	}
	
	.category-card h3 {
	    margin-top: 10px;
	    font-size: 1.2em;
	}
	
	.category-grid a h3 {
    	color: inherit; /* Ensures h3 text doesn't change color inside the link */
	}
	
	.flash-deals {
	    background-color: #f4f4f4;
	    padding: 50px 20px;
	    text-align: center;
	}
	
	.deal-grid {
	    display: grid;
	    grid-template-columns: repeat(2, 1fr);
	    gap: 20px;
	}
	
	.deal-item {
	    background-color: white;
	    padding: 20px;
	    border-radius: 10px;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	    text-align: center;
	}
	
	.deal-item img {
	    width: 150px; /* Set a fixed width */
	    height: 150px; /* Set a fixed height */
	    object-fit: cover; /* Ensures the image maintains aspect ratio and is cropped if needed */
	    border-radius: 5px; /* Optional: add some rounding to the image */
	    display: block;
	    margin: 0 auto 10px auto; /* Centers the image inside the deal item */
}
	
	
	.deal-info {
	    margin-bottom: 10px;
	}
	
	.deal-info p {
	    font-size: 1.2em;
	    color: #333;
	}
	
	.price {
	    font-size: 1.5em;
	    color: #ff5722;
	    font-weight: bold;
	}
	
	.btn-deal {
	    background-color: #ff5722;
	    color: white;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 5px;
	    text-decoration: none;
	}
	    
    </style>
</head>
<body>

	<jsp:include page="Header.jsp" />
    <!-- Hero Section (Sale Banner) -->
    <section class="hero-section">
    </section>

    <!-- Featured Categories Section -->
	<section class="featured-categories">
	    <h2>Featured Categories</h2>
	    <div class="category-grid">
	        <!-- Men's Sale -->
	        <a href="/MiniProject/men_sale.jsp">
	            <div class="category-card" style="background-color:#d8f9ff;">
	                <img src="Images/men_symbol.png" alt="Men's Fashion">
	                <h3>Men's Sale</h3>
	            </div>
	        </a>
	
	        <!-- Women's Sale -->
	        <a href="/MiniProject/woman_sale.jsp">
	            <div class="category-card">
	                <img src="Images/dress_symbol.png" alt="Women's Fashion">
	                <h3>Women's Sale</h3>
	            </div>
	        </a>
	
	        <!-- Accessories Sale -->
	        <a href="/MiniProject/accessories_sale.jsp">
	            <div class="category-card">
	                <img src="Images/accessory.png" alt="Accessories">
	                <h3>Accessories Sale</h3>
	            </div>
	        </a>
	
	        <!-- Shoes Sale -->
	        <a href="/MiniProject/shoes_sale.jsp">
	            <div class="category-card">
	                <img src="Images/shoes.png" alt="Shoes">
	                <h3>Shoes Sale</h3>
	            </div>
	        </a>
	    </div>
	</section>

    <!-- Flash Deals Section -->
    <section class="flash-deals">
        <h2>Flash Deals</h2>
        <div class="deal-grid">
                    <%
	            String url = "jdbc:mariadb://localhost:3306/Clotheng"; // Update with your DB URL
	            String user = "root"; // Update with your DB username
	            String password = "admin"; // Update with your DB password
	            
	            Connection conn = null;
	            Statement stmt = null;
	            ResultSet rs = null;
	            
	            try {
	                Class.forName("org.mariadb.jdbc.Driver"); // MySQL JDBC Driver
	                conn = DriverManager.getConnection(url, user, password);
	                stmt = conn.createStatement();
	                rs = stmt.executeQuery("Select * from products where sale='y' and category='men'");
					
	                while (rs.next()) {
	                    String image = rs.getString("image_url");
	                    String name = rs.getString("name");
	                    String sale= rs.getString("sale");
	                    String type= rs.getString("type");
	                    int id=rs.getInt("id");
	                    Double fprice;
	                    Double price;
	                    if (sale.equals("y")){
	                    	price = rs.getDouble("price");
	                    	fprice= price *.5;
	                    }
	                    else{
	                    	price = rs.getDouble("price");
	                    	fprice= price ;
	                    }
	        %>
	        
            <form action="products.jsp" id="form_<%= id %>">
            <input type="hidden" value="<%= id %>" name="id">
	            <div class="deal-item" onclick="document.getElementById('form_<%= id %>').submit();" style="cursor:pointer;">
	                <img src="<%= image %>" alt="<%= name %>">
	                <div class="deal-info">
	                    <p>50% Off on <%= type %></p>
	                    <p class="price">Now at Rs.<%= fprice %></p>
	                </div>
	            </div>            
            </form>
            <%
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            } finally {
	                // Close resources
	                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
	                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	            }
	        %>            
        
        
         </div>
    </section>

    <!-- Footer -->
	<jsp:include page="Footer.jsp" />
</body>
</html>