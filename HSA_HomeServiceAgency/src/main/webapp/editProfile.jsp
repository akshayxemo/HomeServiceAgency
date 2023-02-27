<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>
	<link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
    <link rel="stylesheet" href="bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="docs.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="rating.css" type="text/css" rel="stylesheet">
    <style>
    	#top{
    		background-image:url("./images/background.svg");
    		background-repeat: no-repeat;
    		background-size:cover;
    	}
    	.changefields{
    		background-image:url("./images/neonBack.jpg");
    		background-repeat: no-repeat;
    		background-size:cover;
    	}
    </style>
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	
	<section id="top" class="pb-4">
		<div class="container text-center"style="margin-top: 7%;">
			<img id="image-preview" src="./ImagePutter"
				style="width: 8.25rem; height: 8.1rem;"
				class="rounded rounded-circle img-fluid border border-4 border-primary border-opacity-25" alt="placeholder">
			<h1 class="my-3 fw-bold">${fn:toUpperCase(profile.name)}</h1>
			<p class="text-secondary mb-1"><i class="bi bi-envelope text-success"></i> &#160 Email : &#160 &#160 <span class="text-secondary fw-light">${profile.email}</span></p>
			<p class="text-secondary mb-1"><i class="bi bi-geo-alt text-success"></i> &#160 Address : &#160 &#160 <span class="text-secondary fw-light">${profile.address}</span></p>
			<p class="text-secondary mb-1">
				<i class="bi bi-phone text-success"></i> &#160 Contact no : &#160
				&#160 <span class="text-secondary fw-light">${profile.phone}
				</span> &#160 &#160 <i class="bi bi-telephone text-success"></i> &#160
				Alternate no: &#160 &#160 <span class="text-secondary fw-light">${profile.altPhone}
				</span>
			</p>
			<a href="./Dashboard" class="btn btn-primary mt-2 mb-0"><i class="bi bi-arrow-left"></i>  &#160 &#160 Go back</a>
		</div>
	</section>
	<section class="bg-warning py-5 changefields">
		<div class="container shadow p-4 mb-5 border bg-light rounded rounded-2">
			<h5 class="text-center mb-4 border-bottom pb-3"><i class="bi bi-gear-fill text-success"></i> &#160 General settings</h5>
			<form name="picForm" id="picForm" method="post" action="EditProfile" enctype="multipart/form-data">
				<input type="hidden" name="action" value="imageChange">
				<input type="hidden" name="type" value="${type}">
				<c:choose>
					<c:when test="${type == 'professionals'}">
						<input type="hidden" name="id" value="${profile.id}">
					</c:when>
					<c:otherwise>
						<input type="hidden" name="id" value="${profile.uid}">
					</c:otherwise>
				</c:choose>
				<div class="row mb-5">
					<div class="col-md-8 align-items-center">
						<label>Select image  &#160<span class="text-secondary fw-light"> Image size should be less than or equal 200kb</span></label>
						<input type="file" name="image" id="formFileLg" class="form-control" onchange="updatePreview(this, 'image-preview'),Filevalidation()"/>
					</div>
					<div class="col-md-4 d-flex justify-content-between align-items-end">
						<p id="sizeP" class="mb-0"> </p>
						<button type="submit" onclick="varifyImage(event)" class="btn btn-warning me-3" style="height:42px;"><i class="bi bi-person-bounding-box"></i> &#160 Change Profile Picture </button>
					</div>
				</div>
			</form>
			<form name="generalForm" id="generalForm" method="post" action="EditProfile">
				<input type="hidden" name="action" value="generalChange">
				<input type="hidden" name="type" value="${type}">
				<c:choose>
					<c:when test="${type == 'professionals'}">
						<input type="hidden" name="id" value="${profile.id}">
					</c:when>
					<c:otherwise>
						<input type="hidden" name="id" value="${profile.uid}">
					</c:otherwise>
				</c:choose>
				<div class="row">
					<div class="col-md-6">
						<div class="form-floating mb-3">
						  <input onkeypress="check()" type="text" class="form-control" id="floatingName" name="Name" placeholder="Name here" value="${profile.name}">
						  <label for="floatingName">Change name</label>
						</div>
					</div>
					<div class="col-md-6 align-items-center">
						<div class="form-floating mb-3">
						  <input onkeypress="check()" type="email" class="form-control" id="floatingEmail" name="Email" placeholder="name@gmail.com" value="${profile.email}">
						  <label for="floatingEmail">Change email</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-floating mb-3">
						  <input onkeypress="check()" type="text" class="form-control" id="floatingPhone" name="Phone" placeholder="Phone no here" value="${profile.phone}">
						  <label for="floatingPhone">Change phone no.</label>
						</div>
					</div>
					<div class="col-md-6 align-items-center">
						<div class="form-floating mb-3">
						  <input onkeypress="check()" type="text" class="form-control" id="floatingAltPhone" name="AltPhone" placeholder="Phone no here" value="${profile.altPhone}">
						  <label for="floatingAltPhone">Change / Add Alternate phone no.</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-floating mb-3">
						  <input onkeypress="check()" type="text" class="form-control" id="floatingAddress" name="Address" placeholder="Enter Address" value="${profile.address}">
						  <label for="floatingAddress">Change address.</label>
						</div>
					</div>
					<div class="col-md-6 d-flex justify-content-between align-items-center">
						<div class="form-floating me-3 mb-3">
						  <input disabled type="password" class="form-control" id="floatingGPassword" name="Password" placeholder="Phone no here">
						  <label for="floatingGPassword">Enter Password<span style="color:red"> * </span></label>
						</div>
						<button disabled onclick="submitGeneralForm(event)" id="change" type="submit" class="btn btn-success me-3" style="height:42px;"><i class="bi bi-gear-fill"></i> &#160 Change Details </button>
						<button onclick="resetbtn()" type="reset" id="reset" class="btn btn-dark" style="height:42px;"><i class="bi bi-arrow-clockwise"></i> &#160 Reset </button>
					</div>
				</div>
			</form>
		</div>
		<div class="container shadow p-4 mb-5 border bg-light rounded rounded-2">
			<h5 class="text-center mb-4 border-bottom pb-3"><i class="bi bi-shield-lock-fill text-danger"></i> &#160 Change Password</h5>
			<form name="passChange" id="passChange" method="post" action="EditProfile">
				<input type="hidden" name="action" value="passwordChange">
				<input type="hidden" name="type" value="${type}">
				<c:choose>
					<c:when test="${type == 'professionals'}">
						<input type="hidden" name="id" value="${profile.id}">
					</c:when>
					<c:otherwise>
						<input type="hidden" name="id" value="${profile.uid}">
					</c:otherwise>
				</c:choose>
				<div class="row">
					<div class="col-md-6">
						<div class="form-floating mb-3">
						  <input type="password" class="form-control" id="floatingPassword" name="Password" placeholder="Enter Password">
						  <label for="floatingPassword">Enter your password<span style="color:red">* </span></label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-floating">
						  <input type="password" class="form-control" id="floatingNewPassword" name="Npassword" placeholder="Enter New password">
						  <label for="floatingNewPassword">Enter New Password<span style="color:red">* </span></label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-floating">
						  <input type="password" class="form-control" id="floatingRePassword" name="Rpassword" placeholder="Re Enter password">
						  <label for="floatingRePassword">Re Enter New Password<span style="color:red">* </span></label>
						</div>
					</div>
					<div class="col-md-6 d-flex justify-content-between align-items-center">
						<p id="emptyPass" class="mb-0"> </p>
						<button type="submit" onclick="passwordFieldCheck(event)" class="btn btn-danger me-3" style="height:42px;"><i class="bi bi-key-fill"></i> &#160 Change Password </button>
					</div>
				</div>
			</form>
		</div>
	</section>
	
	<jsp:include page="Footer.jsp"></jsp:include>
	<script src="bootstrap.bundle.min.js"></script>
	<script src="editProfile.js"></script>
</body>
</html>