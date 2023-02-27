<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
</head>
<body class="bg-light">
	<jsp:include page="Navbar.jsp"></jsp:include>
	<section>
		<div class="container py-5" style="margin-top: 5%;">
			<form method="post" name="Booking" id="bookingForm">
				<div class="row border rounded-2 p-4 bg-white">
					<div class="col-md-10">
						<div class="row">
							<div
								class="col-md-3 d-flex align-items-center justify-content-center">
								<img src="./ImageViewer?id=${profInfo.id}&type=professionals"
									class="border border-4 border-success border-opacity-50 rounded-circle img-fluid"
									style="width: 6.25rem; height: 6.25rem;">
							</div>
							<div class="col-md-9">
								<h4 class="fw-semiblod">${profInfo.name}
									&#160<span class="fw-light fs-6 text-primary">(${profInfo.gender})</span>
									&#160 &#160<span class="badge text-bg-success p-2 fs-6 fw-normal">${ServiceName}</span>
								</h4>
								<input type="hidden" name="ServiceName" value="${ServiceName}">
								<p class="text-secondary mb-1">
									Email: &#160 <em class="fw-light">${profInfo.email}</em>
								</p>
								<p class="text-secondary mb-0">
									Rating: &#160 <span class="fw-light">${profInfo.rating}.0
										&#9733;</span>
								</p>
							</div>
						</div>
						<div class="row my-4">
							<div class="col-md-3"></div>
							<div class="col-md-4">
								<label class="form-label mb-1"> Select service Date <span
									class="text-danger"> * </span>
								</label> 
								<input class="form-control" type="date" name="sDate" id="date">
							</div>
							<div class="col-md-4">
								<label class="from-label mb-1"> Select service Time <span
									class="text-danger"> * </span>
								</label> 
								<input class="form-control" type="time" name="sTime" id="time">
							</div>
						</div>
						<div class="row border-top py-3">
							<h5 id="serviceHeading">
								Select atleast one service <span class="text-danger"> * </span>
							</h5>
							<div class = "d-flex justify-content-start mt-3">
								<c:forEach var="tempService" items="${services}">
									<div class="form-check form-check-inline me-4">
										<input class="form-check-input" type="checkbox" 
										value="${tempService.sid}" name="subService"> 
										<label class="form-check-label text-secondary"> 
										${tempService.sname} (${tempService.price}/-)
										</label>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<input type="hidden" name="profId" value="${profInfo.id}">
						<button type="submit" class="btn btn-warning" style = "width:100%;" onclick="validate(event)">Book</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="Footer.jsp"></jsp:include>
	<script src="Booking.js"></script>
</body>
</html>