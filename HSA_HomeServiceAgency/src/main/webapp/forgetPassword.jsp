<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password Recovery</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
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
	<section>
		<div class="modal" tabindex="-1" style="display:block">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content text-center">
		      <div class="modal-body">
		       	<h3>Forget your password buddy!</h3>
		       	Change password to your account
		      </div>
		      <div class="modal-body text-bg-light">
		      <c:choose>
		      	<c:when test="${id != null}">
			        <form name="passChange" id="passChange" method="post" action="EditProfile">
			        	<input type="hidden" name="action" value="recoverPassword">
			        	<input type="hidden" name="type" value="${type}">
			        	<input type="hidden" name="id" value="${id}">
			        	<div class="form-floating mb-3">
							<input type="password" class="form-control" id="floatingPassword" name="Npassword" placeholder="Password">
							<label for="floatingPassword">Enter New Password <span style="color:red">* </span></label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control" id="floatingCPassword" name="CPassword" placeholder="Password">
							<label for="floatingCPassword">Confirm Password <span style="color:red">* </span></label>
						</div>
			        	<button type="submit" class="btn btn-success mb-3" onclick="passwordFieldCheck(event)">Recover Password</button>
			        </form>
		        </c:when>
		        <c:otherwise>
			        <form method="Post" name="recovery" action="RecoverPassword">
			        	<div class="form-floating mb-3">
							<input type="email" class="form-control" id="floatingEmail" name="Email" placeholder="Email">
							<label for="floatingEmail">Enter your Registered Email <span style="color:red">* </span></label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingPhone" name="Phone" placeholder="Number">
							<label for="floatingPhone">Enter your Registered Phone number <span style="color:red">* </span></label>
						</div>
						<label class="form-label mt-3 mx-2" id="AcTypeHeadline"><span style="font-weight:500;">Account Type</span> <span style="color:red">* </span></label>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="AccountType" id="UserAccount" value="users">
						  <label class="form-check-label" for="UserAccount">User</label>
						</div>
						<div class="form-check form-check-inline mb-3">
						  <input class="form-check-input" type="radio" name="AccountType" id="ProfAccount" value="professionals">
						  <label class="form-check-label" for="ProfAccount">Professional</label>
						</div>
			        	<button type="submit" class="btn btn-danger mb-3" onclick="validation(event)">Recover Password</button>
			        </form>
		        </c:otherwise>
		      </c:choose>
		        
		        <a href="loginSignup.jsp">Go back to Login</a>
		      </div>
		    </div>
		  </div>
		</div>
	</section>
	<jsp:include page="Footer.jsp"></jsp:include>
	<script src="bootstrap.bundle.min.js"></script>
	<script src="forgetPassword.js"></script>
</body>
</html>