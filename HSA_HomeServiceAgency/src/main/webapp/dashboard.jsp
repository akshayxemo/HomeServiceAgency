<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dashboard</title>
	<link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
    <link rel="stylesheet" href="bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="docs.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="rating.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>

	<section id="top">
		<div class="mb-4">
	        <div class="container  text-center " style="margin-top: 6%;">
	        	<c:if test="${usertype != null}">
	        	<% 	String Type = null;
	        		Type = (String) request.getAttribute("usertype");
	        		if(Type.equals("users")){ %>
		            	<p class="mt-1">Welcome to the Dashboard &#160<span class="badge text-bg-primary p-2 fs-6 fw-normal">User</span></p>
		        <%} else{%>
		            	<p class="mt-1">Welcome to the Dashboard &#160<span class="badge text-bg-success p-2 fs-6 fw-normal">Professional</span></p>
		        <%} %>
	            </c:if>
	            <img src="./ImagePutter" class=" user-img-top rounded-circle img-fluid" style="height: 10%; width: 10%;">
	            <h1>${userName} </h1>
	            <button type="button" class="btn btn-warning rounded-3">Edit Profile</button>
	        </div>
	        
	        <div class="text-center">
		         <c:if test="${rate != null}">
		         	<p class="my-2">Rating is : ${rate}</p>
		         	<% 
		         	int Rating = Integer.parseInt((String)request.getAttribute("rate"));
		         	for(int i = 1; i<=5 ; i++){ 
		         		if(Rating != 0){ %>
		         			<img src="images/star.png" width="20px" height="20px">
		         	<%	Rating--;
		         		}
		         		else{ %>
		         			<img src="images/starOutline.png" width="20px" height="20px">
		         	<%	}
		         	}%>
		         </c:if>
	        </div>
        </div>
    </section>
    
    <section>
    
        <div class="container-fluid text-center text-bg-primary" id="booking" style="padding:12px 0; ">
            <p class="m-0">Bookings</p>
        </div>
        
        <div class="container" style="overflow-y: auto; height:700px">
        
        <!-- Main card div -->
        	<div class="border rounded row my-4 p-0">
        	
        		<!-- First Block -->
        		<div class="col-md-9 p-4">
        		
        			<div class="row">
        				<div class="col-md-2 d-flex align-items-center">
        					<img src="images/akshay.jpg" class="img-fluid rounded-circle mx-auto d-block" style="width: 105px;">
        				</div>
        				<div class="col-md-10">
        					<h4 class="fw-semibold">Bookers Name</h4>
        					<p class="text-secondary mb-1">Contact : &#160 &#160 <span class="text-secondary fw-light">contact number</span></p>
        					<p class="text-secondary">Address: &#160 &#160 <span class="text-secondary fw-light">address of the booker</span></p>
        				</div>
        			</div>
        			
        			<div class="row border-bottom border-top mt-4 pt-3 bg-light">
        				<div class="col-md-6"><p>Appointment Date : &#160 &#160 &#160 <span class="text-secondary fw-light">DD/MM/YYYY</span></p></div>
        				<div class="col-md-6"><p>Appointment Time : &#160 &#160 &#160 <span class="text-secondary fw-light">HH:MM:SS</span></p></div>
        			</div>
        			
        			<div class="row mt-3">
        				<p>Selected Jobs</p>
        				<div class="d-flex">
	        				<span class="me-4 text-secondary fw-light"><i class="bi bi-check text-success"></i> &#160 job1</span>
	        				<span class="me-4 text-secondary fw-light"><i class="bi bi-check text-success"></i> &#160 job1</span>
        				</div>
        			</div>
        			
        		</div>
        		<!-- End First Block -->
        		
        		<!-- Second Block -->
        		<div class="col-md-3 bg-secondary bg-opacity-10 p-4">
        		
        			<div class="row px-3">
        				<table>
        					<tr>
        						<td><p class="mb-1">Booking Date :</p></td>
        						<td><span class="text-secondary fw-light">dd/mm/yy</span> </td>
        					</tr>
        					<tr>
        						<td><p class="mb-1">Payable Price :</p></td>
        						<td><span class="text-secondary fw-light">2000/-</span> </td>
        					</tr>
        					<tr>
        						<td><p class="mb-1">Status :</p></td>
        						<td><span class="text-success fw-light">report</span> </td>
        					</tr>
        				</table>
        			</div>
        			<div class="row mt-3 px-3">
        				<button type="button" class="btn btn-danger">Reject Appointment &#160 &#10006;</button>
        				<span class="mt-2">Please wait for the Professional to Confirm. <span class="text-danger">You cannot Reject your Booking after getting confirmed by the professional</span></span>
        			</div>
        		
        		</div>
        		<!-- End Second Block -->
        		
        	</div>
        <!-- End Main card div -->
        
        <!-- Main card div -->
        	<div class="border rounded row my-4 p-0">
        	
        		<!-- First Block -->
        		<div class="col-md-9 p-4">
        		
        			<div class="row">
        				<div class="col-md-2 d-flex align-items-center">
        					<img src="images/akshay.jpg" class="img-fluid rounded-circle mx-auto d-block" style="width: 105px;">
        				</div>
        				<div class="col-md-10">
        					<h4 class="fw-semibold">Bookers Name</h4>
        					<p class="text-secondary mb-1">Contact : &#160 &#160 <span class="text-secondary fw-light">contact number</span></p>
        					<p class="text-secondary">Address: &#160 &#160 <span class="text-secondary fw-light">address of the booker</span></p>
        				</div>
        			</div>
        			
        			<div class="row border-bottom border-top mt-4 pt-3 bg-light">
        				<div class="col-md-6"><p>Appointment Date : &#160 &#160 &#160 <span class="text-secondary fw-light">DD/MM/YYYY</span></p></div>
        				<div class="col-md-6"><p>Appointment Time : &#160 &#160 &#160 <span class="text-secondary fw-light">HH:MM:SS</span></p></div>
        			</div>
        			
        			<div class="row mt-3">
        				<p>Selected Jobs</p>
        				<div class="d-flex">
	        				<span class="me-4 text-secondary fw-light"><i class="bi bi-check text-success"></i> &#160 job1</span>
	        				<span class="me-4 text-secondary fw-light"><i class="bi bi-check text-success"></i> &#160 job1</span>
        				</div>
        			</div>
        			
        		</div>
        		<!-- End First Block -->
        		
        		<!-- Second Block -->
        		<div class="col-md-3 bg-secondary bg-opacity-10 p-4">
        		
        			<div class="row px-3">
        				<table>
        					<tr>
        						<td><p class="mb-1">Booking Date :</p></td>
        						<td><span class="text-secondary fw-light">dd/mm/yy</span> </td>
        					</tr>
        					<tr>
        						<td><p class="mb-1">Payable Price :</p></td>
        						<td><span class="text-secondary fw-light">2000/-</span> </td>
        					</tr>
        					<tr>
        						<td><p class="mb-1">Status :</p></td>
        						<td><span class="text-success fw-light">report</span> </td>
        					</tr>
        				</table>
        			</div>
        			<div class="row mt-3 px-3">
        				<form>
						    <div class="rating">
						      <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Meh">5 stars</label>
						      <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Kinda bad">4 stars</label>
						      <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Kinda bad">3 stars</label>
						      <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Sucks big tim">2 stars</label>
						      <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
						    </div>
        					<input type="password" id="P-pasword" class="form-control my-3" placeholder="Enter password" re>
        				</form>
        					<button type="button" class="btn btn-success">Task Completed &#160 &#10004;</button>
        			</div>
        		
        		</div>
        		<!-- End Second Block -->
        		
        	</div>
        <!-- End Main card div -->
        
        <!-- Main card div -->
        	<div class="border rounded row my-4 p-0">
        	
        		<!-- First Block -->
        		<div class="col-md-9 p-4">
        		
        			<div class="row">
        				<div class="col-md-2 d-flex align-items-center">
        					<img src="images/akshay.jpg" class="img-fluid rounded-circle mx-auto d-block" style="width: 105px;">
        				</div>
        				<div class="col-md-10">
        					<h4 class="fw-semibold">Bookers Name</h4>
        					<p class="text-secondary mb-1">Contact : &#160 &#160 <span class="text-secondary fw-light">contact number</span></p>
        					<p class="text-secondary">Address: &#160 &#160 <span class="text-secondary fw-light">address of the booker</span></p>
        				</div>
        			</div>
        			
        			<div class="row border-bottom border-top mt-4 pt-3 bg-light">
        				<div class="col-md-6"><p>Appointment Date : &#160 &#160 &#160 <span class="text-secondary fw-light">DD/MM/YYYY</span></p></div>
        				<div class="col-md-6"><p>Appointment Time : &#160 &#160 &#160 <span class="text-secondary fw-light">HH:MM:SS</span></p></div>
        			</div>
        			
        			<div class="row mt-3">
        				<p>Selected Jobs</p>
        				<div class="d-flex">
	        				<span class="me-4 text-secondary fw-light"><i class="bi bi-check text-success"></i> &#160 job1</span>
	        				<span class="me-4 text-secondary fw-light"><i class="bi bi-check text-success"></i> &#160 job1</span>
        				</div>
        			</div>
        			
        		</div>
        		<!-- End First Block -->
        		
        		<!-- Second Block -->
        		<div class="col-md-3 bg-secondary bg-opacity-10 p-4">
        		
        			<div class="row px-3">
        				<table>
        					<tr>
        						<td><p class="mb-1">Booking Date :</p></td>
        						<td><span class="text-secondary fw-light">dd/mm/yy</span> </td>
        					</tr>
        					<tr>
        						<td><p class="mb-1">Payable Price :</p></td>
        						<td><span class="text-secondary fw-light">2000/-</span> </td>
        					</tr>
        					<tr>
        						<td><p class="mb-1">Status :</p></td>
        						<td><span class="text-success fw-light">report</span> </td>
        					</tr>
        				</table>
        			</div>
        			<div class="row mt-3 px-3">
        				<span class="my-3">Thank you <span class="text-danger">Your Appointment is over</span></span>
        				<table>
        					<tr>
        						<td><p class="mb-1">Date :</p></td>
        						<td><span class="text-secondary fw-light">dd/mm/yy</span> </td>
        					</tr>
        					<tr>
        						<td><p class="mb-1">Time :</p></td>
        						<td><span class="text-secondary fw-light">HH:MM:SS</span> </td>
        					</tr>
        				</table>
        			</div>
        		
        		</div>
        		<!-- End Second Block -->
        		
        	</div>
        <!-- End Main card div -->
        
        </div>
        
    </section>
    
    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="bootstrap.bundle.min.js"></script>
    <script src="loginSignup.js"></script>
</body>
</html>