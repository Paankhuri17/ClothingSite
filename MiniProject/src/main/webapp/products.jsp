<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            font-size: 2.5em;
            color: #444;
        }

        .product-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Product Image Section */
        .product-image {
            flex: 1;
            max-width: 45%;
        }

        .product-image img {
            width: 100%;
            height: auto;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        /* Product Details Section */
        .product-details {
            flex: 1;
            max-width: 50%;
            padding: 20px;
        }

        .product-details h2 {
            font-size: 2em;
            margin-bottom: 15px;
            color: #333;
        }

        .product-details .price {
            font-size: 1.8em;
            color: #f00;
            margin-bottom: 15px;
        }

        .product-details p {
            margin-bottom: 10px;
            font-size: 1.1em;
            color: #555;
        }

        .add-to-cart-btn {
            display: inline-block;
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1.2em;
        }

        .add-to-cart-btn:hover {
            background-color: #218838;
        }

        /* Additional Details */
        .additional-info {
            margin-top: 40px;
        }

        .additional-info h3 {
            font-size: 1.8em;
            color: #333;
            margin-bottom: 15px;
        }

        .additional-info ul {
            list-style: none;
            font-size: 1.1em;
            color: #555;
        }

        .additional-info ul li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
	<jsp:include page="Header.jsp" />
    <div class="container">
        <!-- Product Details -->
        <h1>Product Details</h1>
        <%
        		
            String url = "jdbc:mariadb://localhost:3306/Clotheng"; // Update with your DB URL
            String user = "root"; // Update with your DB username
            String password = "admin"; // Update with your DB password
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            ResultSet rs1 = null;
            
            try {
            	int id=Integer.parseInt(request.getParameter("id"));
            	
                Class.forName("org.mariadb.jdbc.Driver"); // MySQL JDBC Driver
                conn = DriverManager.getConnection(url, user, password);
                String query = "Select * from products where id=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1,id);
                rs = pstmt.executeQuery(); 
                if (rs.next()){
                String image = rs.getString("image_url");
                   String name = rs.getString("name");
                   String sale= rs.getString("sale");
                   String type= rs.getString("type");
                   String category= rs.getString("category");
                   int quantity= rs.getInt("quantity");
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
	        <div class="product-wrapper">
	            <!-- Product Image -->
	            <div class="product-image">
	                <img src="<%=image %>" alt="Sample Product">
	            </div>
	            <!-- Product Information -->
	            <div class="product-details">
	                <h2><%= name %></h2>
	                <p class="price">Rs. <%= fprice %></p>
	                <p>Category: <%= category %></p>
	                <p>Type: <%=type %></p>
	                <%
		                String p;
						if (quantity>0){
	                	p="In Stock";
	                	}
	                	else{
	                	p="Out of Stock";
	                	}
	            	%>
                <p>Availability: <%= p %></p>
                <form action="AddToCartServlet" method="POST" id="form1_<%= id %>">
				<input type="hidden" name="id" value="<%=id %>">
				
                <button class="add-to-cart-btn" onclick="document.getElementById('form1_<%= id %>').submit();" style="cursor:pointer;">Add to Cart</button>
                </form>
                
            </div>
        </div>
		
        <!-- Additional Product Information -->
        <div class="additional-info">
            <h3>Product Description</h3>
            <ul>
                <li>High-quality denim jeans with a slim fit design.</li>
                <li>Made from 100% cotton for maximum comfort.</li>
                <li>Available in various sizes: S, M, L, XL.</li>
                <li>Perfect for casual wear or a night out.</li>
            </ul>
        </div>
        <a href="cart.jsp" style="text-align:right; text-decoration:none;"> View cart </a>
    </div>
            <%
                    }
	            } catch (Exception e) {
	                e.printStackTrace();
	            } finally {
	                // Close resources
	                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
	                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	            }
	        %>            
    
   	<jsp:include page="Footer.jsp" />
    
</body>
</html>
