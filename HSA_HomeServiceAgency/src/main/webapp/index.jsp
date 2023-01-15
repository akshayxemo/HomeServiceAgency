<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Service Agency</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="style.css" type="text/css">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	<section class="header-sec">
		<div class="container-img">
			<p>Welcome, do you need any</p>
			<h1 class="mb-4">Home Service ?</h1>
			<button type="button" class="btn btn-warning btn-cus">Get Started</button>
		</div>
	</section>
	<section class="service-sec py-5">
		<div class="container d-flex mb-3 align-items-center justify-content-center">
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/carpenter.png"></div>
					<span><a href="servicePage.html" id="carpenter">Carpenter</a></span>
				</div>
			</div>
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/plumber.png"></div>
					<span><a href="servicePage.html" id="plumber">Plumber</a></span>
				</div>
			</div>
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/electrician.png"></div>
					<span><a href="servicePage.html" id="electrician">Electrician</a></span>
				</div>
			</div>
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/repair.png"></div>
					<span><a href="servicePage.html" id="applienceRepair">AC/Applience Repair</a></span>
				</div>
			</div>
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/vacuum.png"></div>
					<span><a href="servicePage.html" id="houseCleaning">House Cleaning</a></span>
				</div>
			</div>
		</div>
		<div class="container d-flex mt-5 mb-3 align-items-center justify-content-center">
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/renovation.png"></div>
					<span><a href="servicePage.html" id="homePainting">Home Painting</a></span>
				</div>
			</div>
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/barber.png"></div>
					<span><a href="servicePage.html" id="saloonForMen">Saloon for Men</a></span>
				</div>
			</div>
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/makeup.png"></div>
					<span><a href="servicePage.html" id="saloonForWoman">Saloon for Woman</a></span>
				</div>
			</div>
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/physiotherapy.png"></div>
					<span><a href="servicePage.html" id="therapyForMen">Therapy for Men</a></span>
				</div>
			</div>
			<div class="box">
				<div class="icon-wrap">
					<div class="icon mb-3"><img src="images/cupping.png"></div>
					<span><a href="servicePage.html" id="therapyForWomen">Therapy for Woman</a></span>
				</div>
			</div>
		</div>
	</section>
	<section class="About-us-wrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-5 col-md-5">
					<h1 class="headline mb-3">About us</h1>
					<p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
					Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
					when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					<button type="button" class="btn btn-dark" id="AboutButton">Read more...</button>
				</div>
				<div class="col-sm-2 col-md-1"></div>
				<div class="col-sm-5 col-md-6">
					<img src="images/about-us.svg">
				</div>
			</div>
		</div>
	</section>
	<section class="Features-wrap">
		<div class="container">
			<div class="feature-heading text-center">
				<h1 class="headline mb-3">Features</h1>
				<p class="mb-4 p-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
			</div>
			<div class="row my-5">
				<div class="col-4 text-center">
					<img src="images/booking.png" class="f-icon mb-4 mx-auto">
					<p class="fw-semibold">Easy Booking</p>
				</div>
				<div class="col-4 text-center">
					<img src="images/fast.png" class="f-icon mb-4 mx-auto">
					<p class="fw-semibold">Fast Service</p>
				</div>
				<div class="col-4 text-center">
					<img src="images/24-hours.png" class="f-icon mb-4 mx-auto">
					<p class="fw-semibold">24 hour Assistance</p>
				</div>
			</div>
		</div>
	</section>
	<section class="Testimonial-wrap">
		<div class="container">
			<div class="testimonial-heading text-center">
				<h1 class="headline mb-3">Testimonial</h1>
				<p class="mb-4 p-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
			</div>
			<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
  				<div class="carousel-inner">
    				<div class="carousel-item active" data-bs-interval="10000">
      					<div class="row justify-content-evenly">
      						<div class="col-5 cst-border text-center p-5">
      							<h4 class="mb-3 fw-bold">Akshay Kumar Das</h4>
      							<p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
      							Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
      							<p class="fst-italic">Dated: DD/YY/MM</p>
      						</div>
    
      						<div class="col-5 cst-border text-center p-5">
      							<h4 class="mb-3 fw-bold">Arijit sen</h4>
      							<p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
      							Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
      							<p class="fst-italic">Dated: DD/YY/MM</p>
      						</div>
      					</div>
    				</div>
    				<div class="carousel-item" data-bs-interval="10000">
      					<div class="row justify-content-evenly">
      						<div class="col-5 cst-border text-center p-5">
      							<h4 class="mb-3 fw-bold">Sourima saha</h4>
      							<p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
      							Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
      							<p class="fst-italic">Dated: DD/YY/MM</p>
      						</div>
    
      						<div class="col-5 cst-border text-center p-5">
      							<h4 class="mb-3 fw-bold">Sarita Khatun Mollah</h4>
      							<p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
      							Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
      							<p class="fst-italic">Dated: DD/YY/MM</p>
      						</div>
      					</div>
    				</div>
    				<div class="carousel-item" data-bs-interval="10000">
      					<div class="row justify-content-evenly">
      						<div class="col-5 cst-border text-center p-5">
      							<h4 class="mb-3 fw-bold">Arunava Das</h4>
      							<p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
      							Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
      							<p class="fst-italic">Dated: DD/YY/MM</p>
      						</div>
    
      						<div class="col-5 cst-border text-center p-5">
      							<h4 class="mb-3 fw-bold">Trinanjan Daw</h4>
      							<p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
      							Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
      							<p class="fst-italic">Dated: DD/YY/MM</p>
      						</div>
      					</div>
    				</div>
   				 	
  				</div>
  				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    				<span class="visually-hidden">Previous</span>
  				</button>
  				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    				<span class="carousel-control-next-icon" aria-hidden="true"></span>
    				<span class="visually-hidden">Next</span>
  				</button>
			</div>
		</div>
	
	</section>
	<section class="footer-sec">
		<div class="container pb-3">
			<div class="footer-nav d-flex py-3">
				<ul class="mx-auto mb-2 mb-lg-0 f-navbar">
        		<li class="nav-item">
          			<a class="nav-link" href="index.html">Home</a>
        		</li>
       			<li class="nav-item">
          			<a class="nav-link" href="servicePage.html">Services</a>
       	 		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="about_us.html">About us</a>
        		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="Contact_us.html">Contact us</a>
        		</li>
      		</ul>
			</div>
			<hr class="h-rule-footer">
			<div class="row py-2">
			<div class="col-4">
				<a href="index.html"><img src="images/Logo-white.svg" class="f-image"></a>
			</div>
			<div class="col-2"></div>
			<div class="col-6 my-auto"><p class="m-0"> @ 2022-2023 HomeServiceAgency india Pvt. Ltd.</p></div>
		</div>
		</div>
		
	</section>
	<script>
		document.getElementById("AboutButton").onclick = function () {
		    window.location.href = "about_us.html";
		};
	</script>
	<script src="loginSignup.js"></script>
	<script src="bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>