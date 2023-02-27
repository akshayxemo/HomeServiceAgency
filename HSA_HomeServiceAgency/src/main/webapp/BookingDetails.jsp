<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
<link rel="stylesheet" href="docs.css" type="text/css" rel="stylesheet">
</head>
<body class="bg-light">
	<jsp:include page="Navbar.jsp"></jsp:include>
	<%-- <p>${profDetails}</p>
	<p>${services}</p>
	<p>${bookingDate}</p>
	<p>${BookingTime}</p>
	<p>${serviceDate}</p>
	<p>${serviceTime}</p>
	<p>${TotalPrice}</p> --%>
	<section>
	    <div class="container p-0" style="margin-top: 3%;">
	        <div class="row justify-content-center align-items-center rounded-2">
	            <div class="col-12 mb-0">
	                <div class="card" style=" color:#226411; background-color:#BBF0AE; padding:8px 12px">
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
		<div class="container pb-5 pt-1">
				<div class="row">
					<div class="col-md-10 border border-success rounded-2 p-4 bg-white">
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
									&#160 &#160<span class="badge text-bg-success p-2 fs-6 fw-normal">${ServiceName}</span>
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
								<p>Selected service Date : &#160; <span class="text-primary fw-light">${bDetails.sDate}</span></p>
							</div>
							<div class="col-md-4">
								<p>Selected service Time : &#160; <span class="text-primary fw-light">${bDetails.sTime}</span></p>
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
						<div class="row border-top pt-3">
							<h4> Total Ammount is : <span class="text-success">${bDetails.ammount} &#x20b9;</span></h4>
						</div>
					</div>
					<div class="col-md-2 border rounded-2 text-bg-dark p-4 text-center">
						<p class="mt-5">Booking Date</p>
						<p class="fw-light text-warning">${bDetails.bDate}</p>
						<p class="mt-3">Booking Time</p>
						<p class="fw-light text-warning">${bDetails.bTime}</p>
						<a href="./Dashboard" class="btn btn-warning mt-4" style = "width:100%;">Done</a>
					</div>
				</div>
		</div>
	</section>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>