<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shipping & Returns - Fashionista Clothing</title>
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

		.shipping-returns-section {
		    background-color: #fff;
		    padding: 50px 20px;
		    text-align: center;
		    margin: 20px auto;
		    max-width: 900px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
		
		.shipping-returns-section h1 {
		    font-size: 36px;
		    color: #333;
		    margin-bottom: 20px;
		}
		
		.shipping-info, .returns-info {
		    text-align: left;
		    margin: 20px 0;
		    padding: 20px;
		}
		
		.shipping-info h2, .returns-info h2 {
		    font-size: 28px;
		    color: #555;
		}
		
		.shipping-info ul, .returns-info ol {
		    margin-top: 10px;
		    padding-left: 20px;
		}
		
		.shipping-info ul li, .returns-info ol li {
		    font-size: 18px;
		    line-height: 1.6;
		    color: #666;
		    margin-bottom: 10px;
		}
		
		.shipping-info h3, .returns-info h3 {
		    font-size: 22px;
		    color: #666;
		    margin-top: 20px;
		}
		
		.shipping-info p, .returns-info p {
		    font-size: 18px;
		    line-height: 1.6;
		    color: #555;
		}		
		
		@media screen and (max-width: 768px) {
		    .shipping-returns-section {
		        padding: 30px 10px;
		    }
		
		    .shipping-returns-section h1 {
		        font-size: 28px;
		    }
		
		    .shipping-info h2, .returns-info h2 {
		        font-size: 24px;
		    }
		
		    .shipping-info ul li, .returns-info ol li {
		        font-size: 16px;
		    }
		}

    </style>
</head>
<body>
	<jsp:include page="Header.jsp" />

    <section class="shipping-returns-section">
        <div class="container">
            <h1>Shipping & Returns</h1>

            <div class="shipping-info">
                <h2>Shipping Information</h2>
                <p>At Clotheng, we strive to provide fast and reliable shipping to our customers. Below is an overview of our shipping policies:</p>

                <ul>
                    <li><strong>Standard Shipping:</strong> Delivered within 5-7 business days.</li>
                    <li><strong>Expedited Shipping:</strong> Delivered within 2-3 business days.</li>
                    <li><strong>International Shipping:</strong> Delivery times vary by location. Please allow 7-14 business days.</li>
                    <li><strong>Free Shipping:</strong> Free standard shipping on orders over $100.</li>
                </ul>

                <h3>Shipping Fees</h3>
                <p>Shipping fees are calculated at checkout based on the delivery location and shipping method chosen. Expedited and international shipping costs vary depending on the destination.</p>
            </div>

            <div class="returns-info">
                <h2>Return Policy</h2>
                <p>We want you to be completely satisfied with your purchase. If for any reason you are not, you can return the item within 30 days of receipt, provided it is unworn, unwashed, and in its original condition with all tags attached.</p>

                <h3>How to Return</h3>
                <ol>
                    <li>Pack the item securely in its original packaging (or equivalent).</li>
                    <li>Include the original packing slip or order confirmation inside the package.</li>
                    <li>Ship your return to the address provided on our return form. Customers are responsible for return shipping costs unless the item is defective or incorrect.</li>
                </ol>

                <h3>Refunds</h3>
                <p>Once we receive your return, we will inspect it and process your refund within 5-7 business days. Refunds will be credited back to your original form of payment.</p>
            </div>
        </div>
    </section>
	<jsp:include page="Footer.jsp" />
</body>
</html>
