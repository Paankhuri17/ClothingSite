<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ - Clotheng</title>
    <link rel="stylesheet" type="text/css" href="styles/faq.css">
    <script>
        function toggleAnswer(id) {
            var answer = document.getElementById(id);
            if (answer.style.display === "none") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }
    </script>
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
		

		
		.faq-section {
		    background-color: #fff;
		    padding: 50px 20px;
		    text-align: center;
		    margin: 20px auto;
		    max-width: 900px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
		
		.faq-section h1 {
		    font-size: 36px;
		    color: #333;
		    margin-bottom: 20px;
		}
		
		.faq-item {
		    text-align: left;
		    margin: 20px 0;
		    padding: 10px;
		    border-bottom: 1px solid #ccc;
		}
		
		.faq-item h2 {
		    font-size: 22px;
		    color: #555;
		    cursor: pointer;
		}
		
		.faq-item h2:hover {
		    color: #ff6347;
		}
		
		.faq-answer {
		    font-size: 18px;
		    color: #666;
		    margin-top: 10px;
		    line-height: 1.6;
		    display: none;
		}
		
	
		@media screen and (max-width: 768px) {
		    .faq-section {
		        padding: 30px 10px;
		    }
		
		    .faq-section h1 {
		        font-size: 28px;
		    }
		
		    .faq-item h2 {
		        font-size: 20px;
		    }
		
		    .faq-answer {
		        font-size: 16px;
		    }
		}
		    	
    </style>
</head>
<body>
	<jsp:include page="Header.jsp" />
    <section class="faq-section">
        <div class="container">
            <h1>Frequently Asked Questions</h1>

            <div class="faq-item">
                <h2 onclick="toggleAnswer('faq1')">What is your return policy?</h2>
                <p id="faq1" class="faq-answer" style="display:none;">
                    You can return any item within 30 days of purchase as long as it is unworn and in its original condition. Please refer to our return policy page for more information.
                </p>
            </div>

            <div class="faq-item">
                <h2 onclick="toggleAnswer('faq2')">Do you ship internationally?</h2>
                <p id="faq2" class="faq-answer" style="display:none;">
                    Yes, we ship to most countries worldwide. Shipping costs and delivery times vary depending on the destination.
                </p>
            </div>

            <div class="faq-item">
                <h2 onclick="toggleAnswer('faq3')">How can I track my order?</h2>
                <p id="faq3" class="faq-answer" style="display:none;">
                    Once your order is shipped, you will receive a tracking number via email. You can use this number to track your package on our website or the carrier's site.
                </p>
            </div>

            <div class="faq-item">
                <h2 onclick="toggleAnswer('faq4')">What payment methods do you accept?</h2>
                <p id="faq4" class="faq-answer" style="display:none;">
                    We accept all major credit cards, PayPal, and other local payment methods depending on your country. Please check our payment options at checkout.
                </p>
            </div>

            <div class="faq-item">
                <h2 onclick="toggleAnswer('faq5')">How do I contact customer support?</h2>
                <p id="faq5" class="faq-answer" style="display:none;">
                    You can reach our customer support team via the contact form on our website or by emailing support@Clotheng.com. We're here to help!
                </p>
            </div>
        </div>
    </section>
	<jsp:include page="Footer.jsp" />
</body>
</html>
