<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accessories</title>
    <style>
		body {
		    font-family: 'Arial', sans-serif;
		    margin: 0;
		    padding: 0;
		    background-color: #f5f5f5;
		}
			
		h1, h2 {
		    font-family: 'Georgia', serif;
		    color: #333;
		    text-align: center;
		}
		
		p {
		    font-size: 16px;
		    color: #666;
		}
		
		button {
		    padding: 10px 20px;
		    background-color: #333;
		    color: #fff;
		    border: none;
		    cursor: pointer;
		}
		
		button:hover {
		    background-color: #555;
		}
		
		/* Header */
		header {
		    background-color: #f0f0f0;
		    padding: 20px 0;
		}
		/* Hero Section */
		.hero {
		    background: url('Images/accessory.jpg') no-repeat center center;
			background-repeat:no-repeat;
		    background-size: cover;
		    padding: 50px 0;
		    
	        height: 60vh;
		}
		/* New Arrivals Section */
		.new-arrivals {
		    padding: 50px 0;
		}
		
		.new-arrivals h2 {
		    font-size: 36px;
		    margin-bottom: 40px;
		}
		
		.product-grid {
		    display: grid;
		    grid-template-columns: repeat(4, 1fr);
		    gap: 20px;
		    max-width: 1200px;
		    margin: 0 auto;
		}
		
		.product-item {
		    text-align: center;
		    background-color: #fff;
		    padding: 20px;
		    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
		    border-radius: 10px;
		}
		
		.product-item img {
		    width: 100%;
		    height: 300px;
		    margin-bottom: 10px;
		}
		
		.product-item p {
		    font-size: 18px;
		    color: #333;
		    text-align:bottom;
		    bottom:0px;
		}
	
	</style>	    
</head>
<body>
	<jsp:include page="Header.jsp" />	
    <!-- Hero Section -->
    <section class="hero">
    </section>

    <!-- New Arrivals Section -->
    <section class="new-arrivals">
        <h2>Accessories</h2>
        <div class="product-grid">
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
	                rs = stmt.executeQuery("Select * from products where accessory='y';");
	
	                while (rs.next()) {
	                    String image = rs.getString("image_url");
	                    String name = rs.getString("name");
	                    String sale= rs.getString("sale");
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
			        <form action="products.jsp" id="form_<%=id %>">
			        <input type="hidden" name="id" value="<%=id %>">
			        <div class="product-item" onclick="document.getElementById('form_<%= id %>').submit();" style="cursor:pointer;">
		                <img src="<%= image %>" alt="<%= name %>">
		                <p><%= name %></p>
			            <% if (price != fprice) {%>
			            <p>Rs. <s><%= price %></s> <%= fprice %></p>
			            <%} else{ %>
			            <p>Rs. <%= fprice %></p>
			            <% } %>
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
	<jsp:include page="Footer.jsp" />
</body>
</html>
