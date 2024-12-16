<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

		input[type=number] {
		    -moz-appearance: textfield; /* Change appearance to textfield */
		}

        .container {
            width: 80%;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
			overflow-y: auto;
        }

        table th, table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f4f4f4;
            color: #333;
        }

        table td {
            height:200px;
        }


        table td img {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

        .btn {
            padding: 10px 15px;
            border: none;
            background-color: #28a745;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #218838;
        }

        .btn-remove {
            background-color: #dc3545;
        }

        .btn-remove:hover {
            background-color: #c82333;
        }

        .total-section {
            text-align: right;
            margin-top: 20px;
        }

        .total-section h2 {
            display: inline-block;
            margin-right: 20px;
            font-size: 1.5em;
        }

        .total-section .total-amount {
            font-size: 1.8em;
            color: #333;
        }

        .checkout-btn {
            background-color: #007bff;
            padding: 12px 25px;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .checkout-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Shopping Cart</title>
    <style>
        /* Your CSS styling remains unchanged */
    </style>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="container">
    <h1>Your Shopping Cart</h1>

    <table>
        <thead>
            <tr>
                <th>Product</th>
                <th>Image</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
			<%
	            String url = "jdbc:mariadb://localhost:3306/Clotheng"; // Update with your DB URL
	            String user = "root"; // Update with your DB username
	            String password = "admin"; // Update with your DB password
	            
	            Connection conn = null;
	            PreparedStatement pstmt = null;
	            ResultSet rs = null;
	            double orderId=0;
	            double totalAmount=0;
	            ResultSet rs1 = null;
	            ResultSet rs2 = null;
	            String username= (String)session.getAttribute("username");
                
	            try {
	                Class.forName("org.mariadb.jdbc.Driver"); // MySQL JDBC Driver
	                conn = DriverManager.getConnection(url, user, password);
	                
	                String query = "SELECT product_id, quantity FROM cart WHERE username = ?";
	                pstmt = conn.prepareStatement(query);
	                pstmt.setString(1, username);
	                rs1 = pstmt.executeQuery();
	                
	                ArrayList<Integer> product_id = new ArrayList<>();
	                ArrayList<Integer> Quantity = new ArrayList<>();

	                while (rs1.next()) {
	                    int productId = rs1.getInt("product_id");
	                    int quantity = rs1.getInt("quantity");
	                    product_id.add(productId);
	                    Quantity.add(quantity);
	                }
	                
	                if (rs1 != null) rs1.close();
	                
	                int i = 0;
	                for (Integer pid : product_id) {
	                    int quantity = Quantity.get(i);
	                    i += 1;
	                    String query1 = "SELECT name, price, sale, image_url FROM products WHERE id = ?";
	                    pstmt = conn.prepareStatement(query1);
	                    pstmt.setInt(1, pid);
	                    rs = pstmt.executeQuery();

	                    if (rs.next()) {
	                        String name = rs.getString("name");
	                        double price = rs.getDouble("price");
	                        String sale = rs.getString("sale");
	                        String imagePath = rs.getString("image_url");
	                        double finalPrice = sale.equals("y") ? price * 0.5 : price;
	                        double totalPrice = finalPrice * quantity;

	                        totalAmount += totalPrice;
	            %>
	               <tr id="r_<%=i%>">
	                   <td><%= name %></td>
	                   <td><img src="<%= imagePath %>" alt="<%= name %>" style="width: 100px; height: 100px;"></td>
	                   <td>
	                       <form action="UpdateCartServlet" method="post" style="display: inline;">
	                           <input type="hidden" name="product_id" value="<%= pid %>">
	                           <button type="submit" name="action" value="decrease" class="btn" style="padding: 5px 10px;">-</button>
	                           <input type="number" name="quantity" value="<%= quantity %>" min="1" style="width: 40px; text-align: center; border: none;" />
	                           <button type="submit" name="action" value="increase" class="btn" style="padding: 5px 10px;">+</button>
	                       </form>
	                   </td>
	                   <td>Rs. <%= finalPrice %></td>
	                   <td>Rs. <%= totalPrice %></td>
	                   <td>
	                       <form action="RemoveFromCartServlet" method="post">
	                           <input type="hidden" name="product_id" value="<%= pid %>">
	                           <button type="submit" class="btn btn-remove">Remove</button>
	                       </form>
	                   </td>
	               </tr>
				<%
	                    }
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
        </tbody>
    </table>
     <div class="total-section">
        <h2>Total:</h2>
        <span class="total-amount">Rs.<%= totalAmount %></span>
    </div>			
    <div class="checkout-section" style="text-align: right; margin-top: 20px;">
               
	    <form action="PlaceOrderServlet" method="POST" id="Order">
	        <input type="hidden" name="username" value="<%= username %>">
	        <input type="hidden" name="orderId" value="<%= orderId %>">    
 	       <button class="checkout-btn" type="submit">Proceed to Checkout</button>
       </form>
    </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>