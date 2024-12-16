<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fashion Store</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
	
	<jsp:include page="Header.jsp" />	
    <!-- Hero Section -->
    <div class="hero">
        <div class="hero-content">
            <h1>MEN NEW ARRIVALS</h1>
            <p>Discover today's hottest collection of men's fashion.</p>
            <div class="search-bar">
                <input type="text" placeholder="Shop Now">
                <button>Shop Now</button>
            </div>
        </div>
    </div>

    <!-- Product Categories -->
    <div class="product-categories">
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
                rs = stmt.executeQuery("SELECT * FROM products");

                while (rs.next()) {
                    String image = rs.getString("image_url");
                    String gender = rs.getString("category");
                    String sale= rs.getString("sale");
                    int id= rs.getInt("id");
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
        <input type="hidden" value="<%=id%>" name="id">
   
        <div class="category-item" onclick="document.getElementById('form_<%= id %>').submit();" style="cursor:pointer;">
            <img src="<%= image %>" alt="<%= gender %>'s Fashion">
            <% if (price != fprice) {%>
            <h2>Rs. <s><%= price %></s> <%= fprice %></h2>
            <%} else{ %>
            <h2>Rs. <%= fprice %></h2>
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

    <!-- Footer Section -->
   	<jsp:include page="Footer.jsp" />

</body>
</html>
