<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="style.css" type="text/css">
<link rel="stylesheet" href="userType.css" type="text/css">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	
	<section class="middle-sec">
		<div class="border border-dark pb-5 pt-4 outer-border">
			<h4 class="mb-5">Are you going to be a</h4>
			<div class="d-grid gap-2 col-8 mx-auto">
				<button type="button" class="btn btn-dark mb-2" id="procurerbutton"> Procurer </button>
				<p>or</p>
				<button type="button" class="btn btn-warning mb-4" id="professionalbutton"> Professional </button>
			</div>
			<a href="./Home"> < Go Back to Home </a>
		</div>
	</section>  
	
	<jsp:include page="Footer.jsp"></jsp:include>
	
	<script src="bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="loginSignup.js"></script>
	<script src="userType.js"></script>
	
</body>
</html>