<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="SignUpProcurer.css">
    <link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
    <link rel="stylesheet" href="about_us.css">
    <link rel="icon" type="image/x-icon" href="images/favicon.ico">
	<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
	<title>Sign up procurer</title>
</head>
<body>
    <!-- navbar -->
     <jsp:include page="Navbar.jsp"></jsp:include>
    <!-- about-us-wrap -->
    <section class="About-us-wrap">
		<div class="container">
			<div class="row">
				<div class="col-5">
					<h1 class="headline mb-3">About us</h1>
					<p class="mb-4" id="about"></p>
				</div>
				<div class="col-2"></div>
				<div class="col-5">
					<img src="images/about-us.svg">
				</div>
			</div>
		</div>
	</section>        
    <!-- Founders -->
    <section class="founder">
        <div class="container">
            <div class="founder-heading text-center">
                <h1 class="headline mb-3 fw-bold">DEVELOPERS</h1>
            </div>
            <div class="row mt-5 mb-3 founder_dp">
                <div class="col-lg-3 col-md-6 col-sm-12 text-center">
                    <img src="./images/sourima.jpg" class="mb-3 mx-auto rounded-circle" style="width: 10rem; height: 10rem ;" alt="Sourima" srcset="" >
                    <p class="fw-semibold fs-4 mb-0">Sourima Saha</p>
                    <p class="text-secondary fw-light">(MCA 1st year), University of Calcutta</p>
                </div>
                <div class="col-lg-3 col-md-6  col-sm-12  text-center">
                    <img src="./images/sarita.jpg"  class="mb-3 mx-auto rounded-circle" style="width: 10rem; height: 10rem ;"alt="Sarita" srcset="">
                    <p class="fw-semibold fs-4 mb-0">Sarita Khatun Mollah</p>
                    <p class="text-secondary fw-light">(MCA 1st year), University of Calcutta</p>
                 </div>
                <div class="col-lg-3 col-md-6  col-sm-12  text-center">
                    <img src="./images/akshay.jpg"  class="mb-3 mx-auto rounded-circle" style="width: 10rem; height: 10rem ;"alt="Akshay" srcset="">
                    <p class="fw-semibold fs-4 mb-0">Akshay Kumar Das</p>
                    <p class="text-secondary fw-light">(MCA 1st year), University of Calcutta</p>
                 </div>
                <div class="col-lg-3 col-md-6  col-sm-12  text-center">
                    <img src="./images/arijit.jpeg"  class="mb-3 mx-auto rounded-circle" style="width: 10rem; height: 10rem ;"alt="Arijit" srcset="">
                    <p class="fw-semibold fs-4 mb-0">Arijit Bose</p>
                    <p class="text-secondary fw-light">(MCA 1st year), University of Calcutta</p>
                 </div>
            </div>
        </div>
    </section>
    <!-- footer -->
    <jsp:include page="Footer.jsp"></jsp:include>
  	<script src="loginSignup.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>