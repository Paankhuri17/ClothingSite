<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	footer {
	    background-color: #333;
	    color: white;
	    padding: 30px 20px;
	    left: 0;
	    bottom: 0;
	    width: 100%;
	    box-sizing: border-box;
	}
	
	footer .footer-content {
	    display: grid;
	    grid-template-columns: repeat(3, 1fr);
	    gap: 20px;
	}
	
	footer h4 {
	    margin-bottom: 10px;
	}
	
	footer ul {
	    list-style: none;
	    padding: 0;
	}
	
	footer ul li a {
	    color: white;
	    text-decoration: none;
	}
	
	footer ul li a:hover {
	    text-decoration: underline;
	}
	
	footer form {
	    display: flex;
	}
	
	footer input {
	    padding: 10px;
	    border: none;
	    border-radius: 5px 0 0 5px;
	}
	
	footer button {
	    padding: 10px;
	    background-color: #ff5722;
	    color: white;
	    border: none;
	    border-radius: 0 5px 5px 0;
	}
</style>
</head>
<body>
	<footer>
        <div class="footer-content">
            <div class="quick-links">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="about_us.jsp">About Us</a></li>
                    <li><a href="faq.jsp">FAQ</a></li>
                    <li><a href="Shiping and Returns.jsp">Shipping & Returns</a></li>
                    <li><a href="PrivacyPolicy.jsp">Privacy Policy</a></li>        
                </ul>
            </div>
            <div class="contact">
                <h4>Contact Us</h4>
                <p>Email: support@Clotheng.com</p>
                <p>Phone: +123-456-7890</p>
            </div>
            <div class="newsletter">
                <h4>Newsletter</h4>
                <form>
                    <input type="email" placeholder="Enter your email">
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
    </footer>
</body>
</html>
