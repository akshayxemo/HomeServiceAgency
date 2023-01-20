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
	<section>
		<div class="container" style="margin-top:10%;">
			<form action="SearchProfessionas" method="post">
				<div class="row text-center">
					<h3>Service Page</h3>
					<p><em>Search by Service name</em></p>
					<div class="col-md-10">
						<select class="form-select searchBox float-end border-secondary" name="Service_id" aria-label="Default select example">
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
						<button type="submit" class="btn btn-primary">Search</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<section>
		<div class="container" style="overflow-y: auto; height:700px">
			<c:forEach var="tempProf" items="${listProfs}">
				<c:url var="tempLink" value="">
					<c:param name="Service_id" value="${tempProf.id}"/>
				</c:url>
				<div class="row rounded border my-4 p-0">
					<div class="col-md-9 p-4">
						<h4 class="fw-semiblod">${tempProf.name}</h4>
						<p class="text-secondary mb-1">Email : ${tempProf.email}</p>
						<p class="text-secondary mb-0">Rating : ${tempProf.rating}</p>
					</div>
					<div class="col-md-3 p-4">
						<a href="tempLink" class="btn btn-dark">Contact</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>