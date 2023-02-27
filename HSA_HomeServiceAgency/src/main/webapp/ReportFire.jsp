<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
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
	<% 
		String name = request.getParameter("name"); 
		String bid = request.getParameter("bid"); 
		String type = request.getParameter("type"); 
		String id = request.getParameter("id"); 
	%>
	<section class="top" style="z-index:10;">
		<a class="navbar-brand" href="./Home"><img src="images/Logo.svg" class="logo"></a>
		<p>Welcome to Home Service Agency</p>
	</section>
	
	<section>
			<div class="modal" tabindex="-1" style="display:block; z-index:1;">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content text-center">
					      <div class="modal-body">
					       	<h3>Fire a Report !!</h3>
					       	<p class="text-danger m-0">AGAINST : <%= name %>, BOOKING ID : <%= bid %></p>
					      </div>
			      <div class="modal-body text-bg-light">
			      		<form action="ReportFire" method="post" class="mt-3">
							<input type="hidden" name="bid" value="<%= bid %>">
							<input type="hidden" name="id" value="<%= id %>">
							<input type="hidden" name="type" value="<%= type %>">
						    <input type="hidden" name="status" value="report">
						    <div class="form-floating mb-3">
						   		<input type="text" class="form-control" id="ReportMessage" name="Message" placeholder="Enter Report" value="">
  								<label for="ReportMessage">Enter your report</label>
  							</div>
							<button type="submit" class="btn btn-danger w-100 mb-3">Report &#160</button>
						</form>
			        <a href="./Dashboard">Go back</a>
			      </div>
			    </div>
			  </div>
			</div>
		</section>
</body>
</html>