<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - Clotheng</title>
    <style>    	
    	*{
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		    font-family: Arial, sans-serif;
		}
		
		body {
		    background-color: #f4f4f4;
		    color: #333;
		}
		
		.about-section {
		    background-color: #fff;
		    padding: 50px 20px;
		    text-align: center;
		    margin: 20px auto;
		    max-width: 900px;
		    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
		}
		
		.about-section h1 {
		    font-size: 36px;
		    color: #333;
		    margin-bottom: 20px;
		}
		
		.about-section h2 {
		    font-size: 28px;
		    color: #555;
		    margin-top: 30px;
		}
		
		.about-section p {
		    font-size: 18px;
		    line-height: 1.6;
		    color: #666;
		    margin: 15px 0;
		}
		
		.about-section ul {
		    text-align: left;
		    margin: 20px auto;
		    max-width: 700px;
		}
		
		.about-section ul li {
		    font-size: 18px;
		    line-height: 1.5;
		    color: #555;
		    padding: 5px 0;
		}
		
		.team-photo {
		    margin-top: 30px;
		}
		
		.team-photo img {
		    width: 100%;
		    max-width: 600px;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		}
				
		@media screen and (max-width: 768px) {
		    .about-section {
		        padding: 30px 10px;
		    }
		
		    .about-section h1 {
		        font-size: 28px;
		    }
		
		    .about-section h2 {
		        font-size: 22px;
		    }
		
		    .about-section p,
		    .about-section ul li {
		        font-size: 16px;
		    }
		}
		    	
    </style>
</head>
<body>
	<jsp:include page="Header.jsp" />
    <section class="about-section">
        <div class="container">
            <h1>About Clotheng</h1>
            <p>At Clotheng, we believe that fashion is more than just clothes—it's a lifestyle, a statement, and a way to express who you are.</p>

            <h2>Our Story</h2>
            <p>Founded in 2010, Clotheng has grown from a small boutique into an international brand known for its unique style and quality. We started with a simple mission: to make fashion accessible to everyone without compromising on quality.</p>

            <h2>Our Values</h2>
            <ul>
                <li><strong>Quality:</strong> We only use the finest materials and craftsmanship.</li>
                <li><strong>Innovation:</strong> We strive to stay ahead of the trends and offer unique designs.</li>
                <li><strong>Sustainability:</strong> We're committed to eco-friendly practices and sustainable fashion.</li>
            </ul>

            <h2>Our Team</h2>
            <p>We are a passionate team of designers, creatives, and fashion enthusiasts dedicated to bringing you the latest trends and timeless pieces.</p>

            <div class="team-photo">
                <img src="images/team.jpg" alt="Clotheng Team">
            </div>
        </div>
    </section>
	<jsp:include page="Footer.jsp" />
</body>
</html>
