<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HSA Login</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="docs.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="style.css" type="text/css">
<link rel="stylesheet" href="loginSignup.css" type="text/css">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
<style type="text/css">
	.top{
		text-align:center;
		margin:0 auto;
		padding: 20px 0;
	}
	.top p{
		margin:10px 0 0 0;
	}
	.logo{
		height:50px;
	}
</style>
</head>
<body>
    <section class="top">
		<a class="navbar-brand" href="./Home"><img src="images/Logo.svg" class="logo"></a>
		<p>Welcome to Home Service Agency</p>
	</section>
	<c:if test="${userVarify == false}">
			<div class="container">
			<div class="alert alert-danger d-flex align-items-center" role="alert">
			  <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
			    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
			  </svg>
			  <div>
			    ${errorMsg}
			  </div>
			</div>
			</div>
	</c:if>
	<section class="middle-sec mt-5 mb-5">
		<form method="post" name="login" id="Loginform">
			<div class="border border-dark pb-5 pt-4 outer-border">
				<h4 class="mb-4">Login</h4>
				
				<div class="form-floating mb-3">
				  <input type="email" class="form-control" id="floatingEmail" name="Email" placeholder="name@example.com">
				  <label for="floatingEmail">Email address <span style="color:red">* </span></label>
				</div>
				
				<div class="form-floating">
				  <input type="password" class="form-control" id="floatingPassword" name="Password" placeholder="Password">
				  <label for="floatingPassword">Password <span style="color:red">* </span></label>
				</div>
				
				<label class="form-label mt-3 mx-2" id="AcTypeHeadline"><span style="font-weight:500;">Account Type</span> <span style="color:red">* </span></label>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="AccountType" id="UserAccount" value="users">
				  <label class="form-check-label" for="UserAccount">User</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="AccountType" id="ProfAccount" value="professionals">
				  <label class="form-check-label" for="ProfAccount">Professional</label>
				</div>
				
				<br><br>
				<button type="submit" class="btn btn-warning mb-4 px-5" onClick="checkFields(event)">Login</button>
				<p>Don't have an Account ?<a href="userType.html"> Sign Up</a></p>
				<a id="forget-password" href="forgetPassword.jsp"><em>Forgot Password ?</em></a>
			</div>
		</form>
	</section>
	
	<!-- Modal -->
		<div class="modal" tabindex="-1" id="alertModal" data-mdb-backdrop="true" style="display:none;">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">ALERT</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
		      </div>
		      <div class="modal-body">
		        <p id="modalBody">Modal body text goes here.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  onclick="closeModal()">Close</button>
		      </div>
		    </div>
		  </div>
		  <div class="modal-backdrop" style="z-index:-1; background-color:black; width:100%; height:100%; opacity: 0.5;"></div>
		</div>
		
	<jsp:include page="Footer.jsp"></jsp:include>
	
	<script src="bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="LoginFormValidation.js"></script>
</body>
</html>