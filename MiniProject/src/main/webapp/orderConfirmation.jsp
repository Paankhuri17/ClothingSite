<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #4CAF50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .total {
            font-weight: bold;
        }
        .btn {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <jsp:include page="Header.jsp"></jsp:include>

    <div class="container">
        <h1>Order Confirmation</h1>
        <p>Thank you for your order, <strong>${username}</strong>!</p>
        <p>Your order number is: <strong>${orderId}</strong></p>

        <h2>Order Summary</h2>
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
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
            double totalAmount=0;
            double grandTotal=0;
            ResultSet rs1 = null;
            ResultSet rs2 = null;
            try {
                Class.forName("org.mariadb.jdbc.Driver"); // MySQL JDBC Driver
                conn = DriverManager.getConnection(url, user, password);
                String username= (String)session.getAttribute("username");
                String orderId=(String)request.getAttribute("orderId");
        		
                out.print("<h1>"+orderId+"</h1>");
                String query = "SELECT product_id, quantity FROM `ORDER` WHERE orderId = ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, orderId);
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
                    String query1 = "SELECT name, price, sale FROM products WHERE id = ?";
                    pstmt = conn.prepareStatement(query1);
                    pstmt.setInt(1, pid);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        String name = rs.getString("name");
                        double price = rs.getDouble("price");
                        String sale = rs.getString("sale");
                        double finalPrice = sale.equals("y") ? price * 0.5 : price;
                        double totalPrice = finalPrice * quantity;
						
                        totalAmount += totalPrice;
						grandTotal=totalAmount + 13;
            %>
                    <tr>
                        <td><%= name %></td>
                        <td><%=quantity %></td>
                        <td><%=finalPrice %></td>
                        <td><%= totalPrice %></td>
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
            
                <tr>
                    <td colspan="3" class="total">Subtotal</td>
                    <td><%= totalAmount %></td>
                </tr>
                <tr>
                    <td colspan="3" class="total">Shipping</td>
                    <td>$$13</td>
                </tr>
                <tr>
                    <td colspan="3" class="total">Grand Total</td>
                    <td><strong><%= grandTotal %></strong></td>
                </tr>
            </tbody>
        </table>

        <h2>Shipping Information</h2>
        <p>
            <strong>${username}</strong><br>
            Street:  R T Road, Dahisar
			<br>
			City:   Mumbai
			<br>
			State/province/area:    Maharashtra
			<br>
			Phone number:  02228908455
			<br>
			Zip code:  400068
			<br>
			Country calling code:  +91
			<br>
			Country:  India
        </p>

        <h2>What's Next?</h2>
        <p>If you have any questions, feel free to Contact Us at following email address.</p>
    </div>

    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
