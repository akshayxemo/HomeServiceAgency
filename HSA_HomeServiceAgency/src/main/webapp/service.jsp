<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
<link rel="stylesheet" href="service.css" type="text/css">
<style>
	select, option{
		font-family: 'FontAwesome', 'Poppins';
	}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	<section id="bg" class="text-white">
		<div class="container my-5">
			<form action="SearchProfessionals" method="GET">
				<div class="row text-center">
					<h2 class="fw-semibold">Service Page</h2>
					<h5 class="mb-3"><em>Welcome to our professionals according service finder page.</em></h5>
						<div class="col-md-8">
							<select class="form-select form-select-lg rounded-pill searchBox float-end border-secondary" name="Service_id" id="Service_id" aria-label="Default select example">
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
							<select class="form-select form-select-lg rounded-pill searchBox float-end border-secondary" name="filter" aria-label="Default select example">
								<option selected value="">&#xf0b0; &#160 Filter</option>
								<optgroup label="By Rating">
									<option value="Rating-High-Low" class="fw-normal">&#xf161; &#160 High-Low</option>
								</optgroup>
								<optgroup label="By Gender">
									<option value="Female">&#xf221; &#160 Female</option>
									<option value="Male">&#xf222; &#160 Male</option>
									<option value="Others">&#xf224; &#160 others</option>
								</optgroup>
							</select>
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-warning submitBtn border border-dark" onclick="validation(event)"><i class="bi bi-search"></i> &#160 Search</button>
						</div>
				</div>
			</form>
		</div>
	</section>
	<section>
		<c:choose>
			<c:when test="${listProfs.size() != 0}">
				<div class="container-fluid text-center m-0" id="booking" style="padding:12px 0; ">
					<p class="fw-regular">Search Result for : &#160<span class="badge text-bg-warning p-2 fs-6 fw-normal">${ServiceName}</span>
					<c:if test="${Filter != null}">
						&#160<span class="badge text-dark border border-dark p-2 fs-6 fw-normal">${Filter}</span>
					</c:if>
					</p>
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
	<script src="bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="loginSignup.js"></script>
	<script>
		function validation(event){
			let option = document.getElementById("Service_id");
			if(option.selectedIndex == 0){
				event.preventDefault();
				option.classList.add("is-invalid");
				alert("Please select an service option");
			}
			else{
				return true;
			}
		}
	</script>
</body>
</html>