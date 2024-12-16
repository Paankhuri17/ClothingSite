<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <style>
    	/* Reset default browser styles */
		* {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		}
		
		/* Body */
		body {
		    font-family: 'Arial', sans-serif;
		    background-color: #f4f4f4;
		    color: #333;
		    line-height: 1.6;
		}
		
		/* Container */
		form {
		    max-width: 600px;
		    margin: 50px auto;
		    padding: 20px;
		    background-color: #fff;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
		
		/* Form Title */
		h1 {
		    text-align: center;
		    margin-bottom: 20px;
		    font-size: 24px;
		    color: #333;
		}
		
		/* Form Labels */
		form label {
		    font-size: 16px;
		    font-weight: bold;
		    margin-bottom: 5px;
		    display: block;
		    color: #333;
		}
		
		/* Form Input Fields */
		form input[type="text"],
		form input[type="number"],
		form input[type="email"],
		form input[type="file"],
		form select {
		    width: 100%;
		    padding: 10px;
		    margin-bottom: 15px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 16px;
		    background-color: #fafafa;
		}
		
		/* Button Styles */
		button {
		    width: 100%;
		    padding: 12px;
		    background-color: #333;
		    color: #fff;
		    font-size: 16px;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}
		
		/* Button Hover */
		button:hover {
		    background-color: #ff5722;
		}
		
		/* Media Queries for Mobile */
		@media (max-width: 768px) {
		    form {
		        padding: 15px;
		    }
		    
		    h1 {
		        font-size: 20px;
		    }
		    
		    button {
		        font-size: 14px;
		    }
		}
		    	
    </style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
    <h1>Add New Product</h1>
	
    <form action="AddProductServlet" method="POST" enctype="multipart/form-data">
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="image">Product Image:</label>
        <input type="file" id="image" name="image" required><br><br>

        <label for="price">Price:</label>
        <input type="number" step="0.01" id="price" name="price" required><br><br>

        <label for="category">Category:</label>
        <select id="category" name="category" required>
            <option value="men">Men</option>
            <option value="women">Women</option>
        </select><br><br>

        <label for="newArrival">New Arrival:</label>
        <select id="newArrival" name="newArrival" required>
            <option value="n">No</option>
            <option value="y">Yes</option>
        </select><br><br>

        <label for="sale">On Sale:</label>
        <select id="sale" name="sale" required>
        	<option value="n">No</option>
            <option value="y">Yes</option>
        </select><br><br>

        <label for="accessory">Is Accessory:</label>
        <select id="accessory" name="accessory" required>
            <option value="n">No</option>
            <option value="y">Yes</option>
        </select><br><br>

        <label for="type">Type:</label>
        <select id="type" name="type" required>
            <option value="Accessory">Accessory</option>
            <option value="Footwear">Footwear</option>
            <option value="Clothing">Clothing</option>
            <option value="Other">Other</option>
        </select><br><br>

        <label for="quantity">Quantity:</label>
		<input type="number">
        <button type="submit">Add Product</button>
    </form>
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
