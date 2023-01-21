<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
<link rel="stylesheet" href="service.css" type="text/css">
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	<section id="bg" class="text-white">
		<div class="container mb-4" style="margin-top:7%;">
			<form action="SearchProfessionals" method="GET">
				<div class="row text-center">
					<h3 class="fw-semibold">Service Page</h3>
					<p><em>Your can Search Professionals by Service name here</em></p>
					<div class="col-md-10">
						<select class="form-select form-select-lg rounded-pill searchBox float-end border-secondary" name="Service_id" aria-label="Default select example">
							<option selected value="0">Select Service</option>
							<option value="1">Saloon for woman</option>
				     		<option value="2">Saloon for Man</option>
							<option value="3">Therapy for Man</option>
							<option value="4">Therapy for woman</option>
							<option value="5">Carpenter</option>
							<option value="6">Plumbers</option>
							<option value="7">Electrician</option>
							<option value="8">Ac/Appliance Repair</option>
							<option value="9">House cleanning</option>
							<option value="10">Home Painting</option>
						</select>
					</div>
					<div class="col-md-2">
						<button type="submit" class="btn btn-warning submitBtn">Search</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<section>
		<c:choose>
			<c:when test="${listProfs.size() != 0}">
				<div class="container-fluid text-center m-0" id="booking" style="padding:12px 0; ">
					<p class="fw-regular">Search Result for : &#160<span class="badge text-bg-warning p-2 fs-6 fw-normal">${ServiceName}</span></p>
		            <p class="m-0 text-success fw-regular"><em>${listProfs.size()} results found</em></p>
		        </div>
	        </c:when>
	        <c:otherwise>
	        	<div class="container-fluid text-center m-0" id="booking" style="padding:12px 0; ">
		            <p class="m-0 text-danger fw-regular"><em>Sorry No result found !!!</em></p>
		        </div>
	        </c:otherwise>
        </c:choose>
		<div class="container" style="overflow-y: auto; max-height:500px">
			<c:forEach var="tempProf" items="${listProfs}">
				<c:url var="tempLink" value="Booking">
					<c:param name="Service_id" value="${tempProf.id}"/>
				</c:url>
				<div class="row rounded-2 border my-4 p-0 text-bg-light">
					<div class="col-md-2 d-flex align-items-center justify-content-center">
						<img src="./ImageViewer?id=${tempProf.id}&type=professionals" class="border border-4 border-success border-opacity-50 rounded-circle img-fluid" style="width: 6.25rem; height:6.25rem;">
					</div>
					<div class="col-md-7 p-4">
						<h4 class="fw-semiblod">${tempProf.name} &#160<span class="fw-light fs-6 text-primary">(${tempProf.gender})</span></h4>
						<p class="text-secondary mb-1">Email: &#160 <em class="fw-light">${tempProf.email}</em></p>
						<p class="text-secondary mb-0">Rating: &#160 <span class="fw-light">${tempProf.rating}.0 &#9733;</span></p>
					</div>
					<div class="col-md-3 p-4 d-flex align-items-center justify-content-center border-start text-bg-light">
						<p class="m-0 text-danger">To book an appointment</p>
						<a href="${tempLink}" class="btn btn-dark">Contact</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<jsp:include page="Footer.jsp"></jsp:include>
	<script type="text/javascript" src="loginSignup.js"></script>
</body>
</html>