<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Privacy Policy - Clotheng</title>
    <style>
    * {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    font-family: Arial, sans-serif;
	}
	
	body {
	    background-color: #f4f4f4;
	    color: #333;
	}
		
	.privacy-policy-section {
	    background-color: #fff;
	    padding: 50px 20px;
	    text-align: center;
	    margin: 20px auto;
	    max-width: 900px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	
	.privacy-policy-section h1 {
	    font-size: 36px;
	    color: #333;
	    margin-bottom: 20px;
	}
	
	.privacy-policy-section p, .privacy-policy-section ul {
	    text-align: left;
	    font-size: 18px;
	    line-height: 1.6;
	    color: #555;
	    margin-bottom: 20px;
	}
	
	.privacy-policy-section h2 {
	    font-size: 24px;
	    color: #666;
	    margin-top: 30px;
	}
	
	.privacy-policy-section ul {
	    padding-left: 20px;
	}
	
	.privacy-policy-section ul li {
	    margin-bottom: 10px;
	}
	
	@media screen and (max-width: 768px) {
	    .privacy-policy-section {
	        padding: 30px 10px;
	    }
	
	    .privacy-policy-section h1 {
	        font-size: 28px;
	    }
	
	    .privacy-policy-section h2 {
	        font-size: 22px;
	    }
	
	    .privacy-policy-section p, .privacy-policy-section ul {
	        font-size: 16px;
	    }
	}
	    
    </style>
</head>
<body>
	<jsp:include page="Header.jsp" />
    <section class="privacy-policy-section">
        <div class="container">
            <h1>Privacy Policy</h1>

            <p>At Clotheng, we are committed to protecting your privacy. This Privacy Policy explains how we collect, use, and share your personal information when you visit our website or make a purchase.</p>

            <h2>Information We Collect</h2>
            <p>We collect the following types of information:</p>
            <ul>
                <li><strong>Personal Information:</strong> When you make a purchase, create an account, or sign up for our newsletter, we collect personal details like your name, email address, billing address, shipping address, and payment information.</li>
                <li><strong>Usage Data:</strong> We automatically collect information about your interactions with our website, such as your IP address, browser type, pages viewed, and time spent on the site.</li>
                <li><strong>Cookies:</strong> We use cookies and similar tracking technologies to improve your experience on our site.</li>
            </ul>

            <h2>How We Use Your Information</h2>
            <p>We use the information we collect in the following ways:</p>
            <ul>
                <li>To process and fulfill your orders, including shipping and handling returns.</li>
                <li>To improve our website's functionality and enhance your user experience.</li>
                <li>To communicate with you regarding your orders, promotions, and updates.</li>
                <li>To comply with legal obligations and protect against fraud.</li>
            </ul>

            <h2>Sharing Your Information</h2>
            <p>We may share your personal information with third-party service providers to facilitate our business operations, such as shipping companies, payment processors, and marketing partners. We ensure that these providers handle your data securely and only for the purposes we specify.</p>

            <h2>Your Rights</h2>
            <p>You have the right to access, update, or delete your personal information at any time. You can also opt out of receiving marketing emails by clicking the "Unsubscribe" link in any email or contacting us directly.</p>

            <h2>Data Security</h2>
            <p>We take appropriate security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction.</p>

            <h2>Changes to This Policy</h2>
            <p>We may update this Privacy Policy from time to time. Any changes will be posted on this page with the updated date at the top. We encourage you to review this policy periodically to stay informed about how we are protecting your information.</p>

            <h2>Contact Us</h2>
            <p>If you have any questions about this Privacy Policy or how we handle your personal information, please contact us at support@Clotheng.com.</p>
        </div>
    </section>
	<jsp:include page="Footer.jsp" />    
</body>
</html>
