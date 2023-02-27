<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
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
		margin-bottom:0;
	}
	.logo{
		height:25px;
		margin:auto 0;
	}
	.logoDiv{
		border-bottom:1px solid rgba(0, 0, 0, 0.175);
		
	}
</style>
</head>
<body>
	<div class="modal" tabindex="-1" style="display:block; z-index:-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    	<div class="modal-body logoDiv">
	      		<a href="./Home"><img src="images/Logo.svg" class="logo"></a>
	      	</div>
	      <div class="modal-body">
	       	<h3>General setting Failure </h3>
	      </div>
	      <div class="modal-body">
			<i class="bi bi-x-circle-fill"
				style="font-size: 4rem; color: #e31025;"></i>
			<p>${msg}</p>
	        <a href="./Dashboard">Go Back</a>
	      </div>
	    </div>
	  </div>
	</div>
	  
</body>
</html>