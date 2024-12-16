<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Arrivals</title>
	<style>
	/* General Styling */
		body, html {
		    margin: 0;
		    padding: 0;
		    font-family: Arial, sans-serif;
		    background-color: #f9f9f9;
		}
		
		.hero-section {
		    background-image: url('Images/new-arrival.jpg');
		    background-size: cover;
		    background-position: top center;
		    color: white;
		    height: 60vh;
		    
		    justify-content: center;
		    align-items: center;
		    text-align: center;
		}
		
		.hero-section h1 {
		    font-size: 3em;
		    margin-bottom: 10px;
		}
		
		.hero-section p {
		    font-size: 1.2em;
		    margin-bottom: 20px;
		}
		
		.new-arrivals {
		    padding: 50px 20px;
		    text-align: center;
		}
		
		.new-arrivals h2 {
		    font-size: 2em;
		    margin-bottom: 20px;
		}
		
		.arrivals-grid {
		    display: grid;
		    grid-template-columns: repeat(4, 1fr);
		    gap: 20px;
		}
		
		.arrival-item {
		    background-color: #ffffff;
		    padding: 20px;
		    border-radius: 10px;
		    text-align: center;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    width: 300px;
		    height: 400px;
		}
		.arrival-item .img {
		    flex-grow: 1;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 100%;
		    height: 70%; /* Use 70% of the item height for the image */		
		}
		.arrival-item img {
		    max-width: 100%;
		    max-height: 100%;
		    object-fit: contain; /* Ensure the image scales well within the container */
		    border-radius: 8px;		
		}
	
		.arrival-info h3 {
		    margin-top: 10px;
		    font-size: 1.2em;
		    height:30%;
		}
		
		.arrival-info p {
		    font-size: 1.1em;
		    color: #333;
		}		
			
	</style>
</head>
<body>
	<jsp:include page="Header.jsp" />
    <!-- Hero Section -->
    <section class="hero-section">
    </section>

    <!-- New Arrivals Section -->
    <section class="new-arrivals">
        <h2>New Arrivals</h2>
        <div class="arrivals-grid">
            <!-- Product Item 1 -->
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
	                rs = stmt.executeQuery("Select * from products where new_arrival='y';");
	
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
            <form action="products.jsp" id="form_<%= id %>">
            <input type="hidden" value="<%= id %>" name="id">
            <div class="arrival-item" onclick="document.getElementById('form_<%= id %>').submit();" style="cursor:pointer;">
            	<div class="img">
                	<img src="<%= image %>" alt="<%= name %>">
                </div>
                <div class="arrival-info">
                    <h3><%= name %></h3>
                    <% if (price != fprice) {%>
			            <p>Rs. <s><%= price %></s> <%= fprice %></p>
			        <%} else{ %>
			            <p>Rs. <%= fprice %></p>
			        <% } %>
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
	<jsp:include page="Footer.jsp" />

</body>
</html>
