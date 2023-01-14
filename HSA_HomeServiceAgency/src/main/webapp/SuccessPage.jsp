<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Success</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="SuccessPage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
<style>
	.modal-body{
		border:none;
		text-align:center;
	}
	.modal-body a{
		text-decoration: none;
	}
	.modal-body h3{
		margin-top:10px;
	}
	.logo{
		height:25px;
		margin:auto 0;
	}
	.logoDiv{
		border-bottom:1px solid rgba(0, 0, 0, 0.175);
		
	}
</style>
<% 
	String Name = null;
	Name = (String) request.getAttribute("Name");
%>
</head>
<body>
	<div class="modal" tabindex="-1" style="display:block; z-index:-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    	<div class="modal-body logoDiv">
	      		<a href="index.html"><img src="images/Logo.svg" class="logo"></a>
	      	</div>
	      <div class="modal-body">
	       	<h3>Successfully Registered !</h3>
	      </div>
	      <div class="modal-body">
	      	<div class="swal2-icon swal2-success swal2-animate-success-icon" style="display: flex;">
			  <div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);"></div>
			  <span class="swal2-success-line-tip"></span>
			  <span class="swal2-success-line-long"></span>
			  <div class="swal2-success-ring"></div> 
			  <div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div>
			  <div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div>
			</div>
	        <p>Thank you <b><span><%= Name %></span> !</b>Now you can Login to your Dashboard</p>
	        <a href="loginSignup.jsp">Go back to Login</a>
	      </div>
	    </div>
	  </div>
	</div>
	  
</body>
</html>