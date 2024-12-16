<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>men's Fashion</title>
    <style>
    	body {
			    margin: 0;
			    font-family: 'Arial', sans-serif;
			    background-color: #f4f4f4;
			}
			
			.men-page {
			    margin: 0 auto;
			}
						
			.hero {
			    height: 60vh;
			    background: url('Images/Man_main.jpg') no-repeat center center;
			    background-size: cover;
			    justify-content: left;
			    align-items: top;
			    padding-top:10%;
			    position: relative;
			}
						
			.title-section {
			    text-align: center;
			    margin-top: 20px;
			
			}
			
			.title-section h1 {
			    font-size: 50px;
			    color: #333;
			}
			.title-section .subtext {
			    font-size: 20px;
			    color: #888;
			}
			
			.new-arrivals, .clothing-grid {
			    margin: 40px 20px;
			}
			
			.new-arrivals h2, .clothing-grid h2 {
			    font-size: 30px;
			    text-align: center;
			    margin-bottom: 20px;
			}
			
			.arrivals-grid, .grid {
			    display: grid;
			    grid-template-columns: repeat(4, 1fr);
			    flex-wrap: wrap;
			    justify-content: center;
			}
			.arrival-item, .clothing-item {
			    display: flex;
			    flex-direction: column;
			    justify-content: space-between; /* Distribute space between image and text */
			    align-items: center; /* Align center horizontally */
			    width: 300px;
			    height: 400px; /* Ensure all items are of the same height */
			    text-align: center;
			    margin: 10px;
			    border: 1px solid #ccc; /* Border around each item */
			    border-radius: 8px;
			    padding: 10px; /* Padding inside the item */
			    background-color: white; /* Background color for item */
			    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
			}
			
			.arrival-item .img, .clothing-item .img {
			    flex-grow: 1;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			    width: 100%;
			    height: 70%; /* Use 70% of the item height for the image */
			}
			
			.arrival-item img, .clothing-item img {
			    max-width: 100%;
			    max-height: 100%;
			    object-fit: contain; /* Ensure the image scales well within the container */
			    border-radius: 8px;
			}
			
			.arrival-item p, .clothing-item p {
			    margin: 5px 0;
			    font-size: 16px;
			    color: #333;
			}
			
			.arrival-item p.price, .clothing-item p.price {
			    font-size: 18px;
			    font-weight: bold;
			    color: #e74c3c; /* Color for price */
			}
    </style>
</head>
<body>
	<jsp:include page="Header.jsp" />
    <div class="men-page">
        <header class="header">
			<div class="hero">
			</div>
            <div class="title-section">
                <h1>Men</h1>
                <p class="subtext">Explore our new arrivals in Men's fashion</p>
            </div>
        </header>

        <section class="new-arrivals">
            <h2>NEW ARRIVALS</h2>
            <div class="arrivals-grid">
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
		                rs = stmt.executeQuery("Select * from products where category='men' and new_arrival='y';");
		
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
	                    <img src=<%= image %> alt="Men's Fashion">
	                </div>
	                <div class="text">
	                    <p><%= name %></p>
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
	                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }

		        %>
                <!-- Add more products as needed -->
            </div>
        </section>

        <section class="clothing-grid">
            <h2>Men's Clothing</h2>
            <div class="grid">
            <%
    		  rs = stmt.executeQuery("Select * from products where category='men' and new_arrival='n' and accessory='n';");
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
                <div class="clothing-item" onclick="document.getElementById('form_<%= id %>').submit();" style="cursor:pointer;">
                    <div class="img"> 
	                   	<img src="<%= image %>" alt="<%= name %>">
					</div>
					<div class="text">
	                    <p><%= name %></p>
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
		            
                %>
                <%
		            } catch (Exception e) {
		                e.printStackTrace();
		            } finally {
		                // Close resources
		                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
		                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
		                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
		            }
                %>
                <!-- More clothing items -->
            </div>
        </section>
    </div>
	<jsp:include page="Footer.jsp" />
</body>
</html>
