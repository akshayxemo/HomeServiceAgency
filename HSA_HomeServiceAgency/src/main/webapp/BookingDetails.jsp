<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Successfull</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
<link rel="stylesheet" href="docs.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="Navbar.jsp"></jsp:include>
	<%-- <p>${profDetails}</p>
	<p>${services}</p>
	<p>${bookingDate}</p>
	<p>${BookingTime}</p>
	<p>${serviceDate}</p>
	<p>${serviceTime}</p>
	<p>${TotalPrice}</p> --%>
	<section>
	    <div class="container ml py-4" style="margin-top: 7%;">
	        <div class="row justify-content-center align-items-center">
	            <div class="col-12 mb-0">
	                <div class="card" style="border-radius: 15px; border: none; color:#226411; margin-top:4rem; background-color:#BBF0AE; padding:8px 12px">
	                    <div class="row">
	                        <div class="p-md-4">
	                            Booking Successful please wait for the Professionals response.
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
	<section>
		<div class="container py-5">
				<div class="row border rounded-2 p-4">
					<div class="col-md-10">
						<div class="row">
							<div
								class="col-md-3 d-flex align-items-center justify-content-center">
								<img src="./ImageViewer?id=${profDetails.id}&type=professionals"
									class="border border-4 border-success border-opacity-50 rounded-circle img-fluid"
									style="width: 6.25rem; height: 6.25rem;">
							</div>
							<div class="col-md-9">
								<h4 class="fw-semiblod">${profDetails.name}
									&#160<span class="fw-light fs-6 text-primary">(${profDetails.gender})</span>
								</h4>
								<p class="text-secondary mb-1">
									Email: &#160 <em class="fw-light">${profDetails.email}</em>
								</p>
								<p class="text-secondary mb-0">
									Rating: &#160 <span class="fw-light">${profDetails.rating}.0
										&#9733;</span>
								</p>
							</div>
						</div>
						<div class="row my-4">
							<div class="col-md-3"></div>
							<div class="col-md-4">
								<p>Selected service Date : ${serviceDate}</p>
							</div>
							<div class="col-md-4">
								<p>Selected service Time : ${serviceDate}</p>
							</div>
						</div>
						<div class="row border-top py-3">
							<h5>
								Selected services
							</h5>
							<div class = "d-flex justify-content-start mt-3">
								<c:forEach var="tempService" items="${services}">
									<span class="me-4 text-secondary fw-light">
									<i class="bi bi-check text-success"></i> &#160 ${tempService.sname} (${tempService.price}/-)</span>
								</c:forEach>
							</div>
						</div>
						<div class="row border-top py-3">
							<h4> Total Ammount is : <span class="text-success">${TotalPrice} &#x20b9;</span></h4>
						</div>
					</div>
					<div class="col-md-2">
						<a href="./Dashboard" class="btn btn-warning" style = "width:100%;">Done</a>
						<p class="mt-5">Booking Date</p>
						<p class="text-secondary fw-light">${bookingDate}</p>
						<p class="mt-5">Booking Time</p>
						<p class="text-secondary fw-light">${BookingTime}</p>
					</div>
				</div>
		</div>
	</section>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>