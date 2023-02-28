<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Profile Page</title>
	<link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
    <link rel="stylesheet" href="bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="docs.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="rating.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="scrollbar.css" type="text/css" rel="stylesheet">
    <style>
    	#top{
    		background-image:url("./images/background.svg");
    		background-repeat: no-repeat;
    		background-size:cover;
    	}
    	.bookings{
    		background-image:url("./images/neonBack.jpg");
    		background-repeat: no-repeat;
    		background-size:cover;
    	}
    </style>
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
	            <img src="./ImagePutter" class=" border user-img-top rounded-circle img-fluid" style="height: 8.1rem; width: 8.25rem;">
	            <h1 class="my-3 fw-bold">${fn:toUpperCase(userName)}</h1>
	            <a type="button" href="./EditProfile"class="btn btn-warning rounded-3">Edit Profile</a>
	        </div>
	        
	        <div class="text-center">
		         <c:if test="${rate != null}">
		         	<p class="my-2">My Rating &#160; : &#160; ${rate}.0</p>
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
    
    <section class="bg-dark bookings">
        <div class="container-fluid text-center text-bg-primary" id="booking" style="padding:12px 0; ">
            <p class="m-0">Bookings</p>
        </div>
        
        <div class="container" style="overflow-y: auto; height:700px">
        	<c:choose>
	        <c:when test="${bookings != null && bookings.size()>0}">
	        	<p class="text-center text-warning mb-0 mt-2"> You have <em>${bookings.size()}</em> bookings</p>
	        	<c:choose>
		        	<c:when test="${usertype == 'users' }">
			        	<c:forEach var="bk" items="${bookings}">
					        <!-- Main card div -->
					        	<div class="border rounded row my-4 p-0 bg-white shadow-lg">
					        	
					        		<!-- First Block -->
					        		<div class="col-md-9 p-4">
					        		
					        			<div class="row">
					        				<div class="col-md-2 d-flex align-items-center">
					        					<img src="./ImageViewer?id=${bk.prof.id}&type=professionals" class="img-fluid rounded-circle mx-auto d-block" style="width: 105px;">
					        				</div>
					        				<div class="col-md-10">
					        					<h3 class="fw-semibold">${bk.prof.name} 
					        						<span class="fw-light fs-6 text-primary">(${bk.prof.gender})</span>
					        						&#160 &#160<span class="badge text-bg-success p-2 fs-6 fw-normal">${bk.prof.serviceName}</span>
					        						<c:if test="${bk.reported == true}">
					        							<c:choose>
					        								<c:when test="${bk.against == 'professionals'}">
					        									&#160<span class="badge text-danger border border-danger p-2 fs-6 fw-normal">Reported</span>
					        								</c:when>
					        								<c:otherwise>
					        									&#160<span class="badge text-bg-danger border border-danger p-2 fs-6 fw-normal">Got Reported</span>
					        								</c:otherwise>
					        							</c:choose>
					        						</c:if>
					        					</h3>
					        					<p class="text-secondary mb-1"><i class="bi bi-envelope text-success"></i> &#160 Email : &#160 &#160 <span class="text-secondary fw-light">${bk.prof.email}</span></p>
					        					<p class="text-secondary mb-1"><i class="bi bi-phone text-success"></i> &#160 Contact no : &#160 &#160 <span class="text-secondary fw-light">${bk.prof.phone} / ${bk.prof.altPhone} </span></p>
					        					<p class="text-secondary">Rating : &#160 &#160 <span class="text-secondary fw-light">${bk.prof.rating}.0 &#9733;</span></p>
					        				</div>
					        			</div>
					        			
					        			<div class="row border-bottom border-top mt-4 pt-3 bg-light">
					        				<div class="col-md-6"><p>Appointment Date : &#160 &#160 &#160 <span class="text-secondary fw-light">${bk.sDate}</span></p></div>
					        				<div class="col-md-6"><p>Appointment Time : &#160 &#160 &#160 <span class="text-secondary fw-light">${bk.sTime}</span></p></div>
					        			</div>
					        			
					        			<div class="row mt-3">
					        				<p>Selected Jobs</p>
					        				
					        				<div class="d-flex">
						        				<c:forEach var="service" items="${bk.services}">
							        				<span class="me-4 text-secondary fw-light"><i class="bi bi-check text-success"></i> &#160 ${service.sname} (${service.price} /-)</span>
						        				</c:forEach>
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
					        						<td><span class="text-secondary fw-light">${bk.bDate}</span> </td>
					        					</tr>
					        					<tr>
					        						<td><p class="mb-1">Payable Price :</p></td>
					        						<td><span class="text-secondary fw-light">${bk.ammount} &#x20b9;</span></td>
					        					</tr>
					        					<tr>
					        						<td><p class="mb-1">Status :</p></td>
					        						<c:choose>
					        							<c:when test="${bk.status == 'waiting'}">
					        								<td><span class="text-primary fw-light">${bk.status}</span> </td>
					        							</c:when>
					        							<c:when test="${bk.status == 'accepted'}">
					        								<td><span class="text-primary fw-light">${bk.status}</span> </td>
					        							</c:when>
					        							<c:when test="${bk.status == 'completed'}">
					        								<td><span class="text-success fw-light">${bk.status}</span> </td>
					        							</c:when>
					        							<c:otherwise>
					        								<td><span class="text-danger fw-light">${bk.status}</span> </td>
					        							</c:otherwise>
					        						</c:choose>
					        					</tr>
					        				</table>
					        			</div>
					        			<div class="row mt-3 px-3 border-top border-2">
					        				<c:choose>
						        				<c:when test="${bk.status == 'waiting' && bk.pStatus == 'waiting' && bk.uStatus == 'accepted'}">
						        					<form action="ChangeStatus" method="post">
						        						<input type="hidden" name="bid" value="${bk.bid}">
						        						<input type="hidden" name="type" value="${usertype}">
						        						<input type="hidden" name="status" value="reject">
							        					<button type="submit" class="btn btn-danger w-100">Reject Appointment &#160 &#10006;</button>
						        					</form>
							        				<span class="mt-2">Please wait for the Professional to Confirm. <span class="text-danger">You cannot Reject your Booking once you booked an appointment</span></span>
						        				</c:when>
						        				<c:when test="${bk.status == 'rejected' && bk.pStatus == 'rejected'}">
						        					<span class="my-3 text-center">Sorry <br><span class="text-danger">Your Appointment is Rejected</span></span>
						        					<span class="mt-1 text-center">Date : ${bk.stDate}</span>
						        					<span class="mt-1 text-center">Time : ${bk.stTime}</span>
						        				</c:when>
						        				<c:when test="${bk.status == 'rejected' && bk.uStatus == 'rejected'}">
						        					<span class="my-3 text-center">Sorry <br><span class="text-danger">You canceled this Appointment</span></span>
						        					<span class="mt-1 text-center">Date : ${bk.stDate}</span>
						        					<span class="mt-1 text-center">Time : ${bk.stTime}</span>
						        				</c:when>
						        				<c:when test="${bk.status == 'accepted' && bk.pStatus == 'accepted' && bk.uStatus == 'accepted'}">
						        					<form action="ChangeStatus" method="post">
													    <div class="rating">
													      <input type="radio" id="star5" name="rating" value="5"><label for="star5" title="Excelent">5 stars</label>
													      <input type="radio" id="star4" name="rating" value="4"><label for="star4" title="Very Good">4 stars</label>
													      <input type="radio" id="star3" name="rating" value="3"><label for="star3" title="Good">3 stars</label>
													      <input type="radio" id="star2" name="rating" value="2"><label for="star2" title="Bad">2 stars</label>
													      <input type="radio" id="star1" name="rating" value="1"><label for="star1" title="Disappointed">1 star</label>
													    </div>
							        					<input type="submit" class="btn btn-success w-100" value="Task Completed &#160 &#10004;" disabled>
							        				</form>
							        				
							        				<!-- Report form -->
							        				<c:if test="${bk.reported == false}">
								        				<form action="ReportFire.jsp" method="post" class="mt-3">
							        						<input type="hidden" name="bid" value="${bk.bid}">
							        						<input type="hidden" name="id" value="${bk.prof.id}">
							        						<input type="hidden" name="type" value="professionals">
							        						<input type="hidden" name="name" value="${bk.prof.name}">
								        					<button type="submit" class="btn btn-dark w-100">Report &#160</button>
							        					</form>
						        					</c:if>
						        				</c:when>
						        				<c:when test="${bk.status == 'accepted' && bk.pStatus == 'completed' && bk.uStatus == 'accepted'}">
						        					<form action="ChangeStatus" method="post">
						        						<input type="hidden" name="bid" value="${bk.bid}">
						        						<input type="hidden" name="type" value="${usertype}">
						        						<input type="hidden" name="profId" value="${bk.prof.id}">
						        						<input type="hidden" name="status" value="complete">
													    <div class="rating">
													      <input type="radio" id="star5${bk.bid}" name="rating" value="5"><label for="star5${bk.bid}" title="Excelent">5 stars</label>
													      <input type="radio" id="star4${bk.bid}" name="rating" value="4"><label for="star4${bk.bid}" title="Very Good">4 stars</label>
													      <input type="radio" id="star3${bk.bid}" name="rating" value="3"><label for="star3${bk.bid}" title="Good">3 stars</label>
													      <input type="radio" id="star2${bk.bid}" name="rating" value="2"><label for="star2${bk.bid}" title="Bad">2 stars</label>
													      <input type="radio" id="star1${bk.bid}" name="rating" value="1"><label for="star1${bk.bid}" title="Disappointed">1 star</label>
													    </div>
							        					<input type="submit" class="btn btn-success w-100" value="Task Completed &#160 &#10004;">
							        				</form>
							        				<!-- Report form -->
							        				<c:if test="${bk.reported == false}">
								        				<form action="ReportFire.jsp" method="post" class="mt-3">
							        						<input type="hidden" name="bid" value="${bk.bid}">
							        						<input type="hidden" name="id" value="${bk.prof.id}">
							        						<input type="hidden" name="type" value="professionals">
							        						<input type="hidden" name="name" value="${bk.prof.name}">
								        					<button type="submit" class="btn btn-dark w-100">Report &#160</button>
							        					</form>
						        					</c:if>
						        				</c:when>
						        				<c:when test="${bk.status == 'completed' && bk.pStatus == 'completed' && bk.uStatus == 'completed'}">
						        					<span class="my-3 text-center">Thank you<br><span class="text-success">Your Appointment is successfully over</span></span>
						        					<span class="mt-1 text-center">Date : ${bk.stDate}</span>
						        					<span class="mt-1 text-center">Time : ${bk.stTime}</span>
						        					<c:choose>
						        						<c:when test="${bk.rating >= 4}">
						        							<span class="mt-3 badge bg-success text-white py-2 fw-semibold">Rated: &#160; <span class="">${bk.rating}.0 &#9733;</span></span>
						        						</c:when>
						        						<c:when test="${bk.rating == 3}">
						        							<span class="mt-3 badge bg-warning text-dark py-2 fw-semibold">Rated: &#160; <span class="">${bk.rating}.0 &#9733;</span></span>
						        						</c:when>
						        						<c:otherwise>
						        							<span class="mt-3 badge bg-danger text-white py-2 fw-semibold">Rated: &#160; <span class="">${bk.rating}.0 &#9733;</span></span>
						        						</c:otherwise>
						        					</c:choose>
						        				</c:when>
					        				</c:choose>
					        			</div>
					        		
					        		</div>
					        		<!-- End Second Block -->
					        		
					        	</div>
					        <!-- End Main card div -->
				        </c:forEach>
			        </c:when>
			        
			        <c:otherwise>
			        	<c:forEach var="bk" items="${bookings}">
					        <!-- Main card div -->
					        	<div class="border rounded row my-4 p-0 bg-white shadow-lg">
					        	
					        		<!-- First Block -->
					        		<div class="col-md-9 p-4">
					        		
					        			<div class="row">
					        				<div class="col-md-2 d-flex align-items-center">
					        					<img src="./ImageViewer?id=${bk.user.uid}&type=users" class="img-fluid rounded-circle mx-auto d-block" style="width: 105px;">
					        				</div>
					        				<div class="col-md-10">
					        					<h3 class="fw-semibold">${bk.user.name} <span class="fw-light fs-6 text-primary">(${bk.user.gender})</span>
					        						<c:if test="${bk.reported == true}">
					        							<c:choose>
					        								<c:when test="${bk.against == 'users'}">
					        									&#160<span class="badge text-danger border border-danger p-2 fs-6 fw-normal">Reported</span>
					        								</c:when>
					        								<c:otherwise>
					        									&#160<span class="badge text-bg-danger border border-danger p-2 fs-6 fw-normal">Got Reported</span>
					        								</c:otherwise>
					        							</c:choose>
					        						</c:if>
					        					</h3>
					        					<p class="text-secondary mb-1"><i class="bi bi-envelope text-success"></i> &#160 Email : &#160 &#160 <span class="text-secondary fw-light">${bk.user.email}</span></p>
					        					<p class="text-secondary mb-1"><i class="bi bi-phone text-success"></i> &#160 Contact no. : &#160 &#160 <span class="text-secondary fw-light">${bk.user.phone} / ${bk.user.altPhone} </span></p>
					        					<p class="text-secondary mb-1"><i class="bi bi-geo-alt text-success"></i> &#160 Address : &#160 &#160 <span class="text-secondary fw-light">${bk.user.address}</span></p>
					        				</div>
					        			</div>
					        			
					        			<div class="row border-bottom border-top mt-4 pt-3 bg-light">
					        				<div class="col-md-6"><p>Appointment Date : &#160 &#160 &#160 <span class="text-secondary fw-light">${bk.sDate}</span></p></div>
					        				<div class="col-md-6"><p>Appointment Time : &#160 &#160 &#160 <span class="text-secondary fw-light">${bk.sTime}</span></p></div>
					        			</div>
					        			
					        			<div class="row mt-3">
					        				<p>Selected Jobs</p>
					        				
					        				<div class="d-flex">
						        				<c:forEach var="service" items="${bk.services}">
							        				<span class="me-4 text-secondary fw-light"><i class="bi bi-check text-success"></i> &#160 ${service.sname} (${service.price} /-)</span>
						        				</c:forEach>
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
					        						<td><span class="text-secondary fw-light">${bk.bDate}</span> </td>
					        					</tr>
					        					<tr>
					        						<td><p class="mb-1">Payable Price :</p></td>
					        						<td><span class="text-secondary fw-light">${bk.ammount} &#x20b9;</span> </td>
					        					</tr>
					        					<tr>
					        						<td><p class="mb-1">Status :</p></td>
					        						<c:choose>
					        							<c:when test="${bk.status == 'waiting'}">
					        								<td><span class="text-primary fw-light">${bk.status}</span> </td>
					        							</c:when>
					        							<c:when test="${bk.status == 'accepted'}">
					        								<td><span class="text-primary fw-light">${bk.status}</span> </td>
					        							</c:when>
					        							<c:when test="${bk.status == 'completed'}">
					        								<td><span class="text-success fw-light">${bk.status}</span> </td>
					        							</c:when>
					        							<c:otherwise>
					        								<td><span class="text-danger fw-light">${bk.status}</span> </td>
					        							</c:otherwise>
					        						</c:choose>
					        					</tr>
					        				</table>
					        			</div>
					        			<div class="row mt-3 px-3 border-top border-2">
					        				<c:choose>
						        				<c:when test="${bk.status == 'waiting' && bk.uStatus == 'accepted' && bk.pStatus == 'waiting'}">
							        				<form action="ChangeStatus" method="post" id="${bk.bid}">
						        						<input type="hidden" name="bid" value="${bk.bid}">
						        						<input type="hidden" name="type" value="${usertype}">
						        						<input type="hidden" name="status" value="no" id="action${bk.bid}">
						        					</form>
							        					<button class="btn btn-danger my-3 w-100" id="rejectBtn" onClick="setValueform('rejectBtn', 'action${bk.bid}'), submit(${bk.bid})"> Reject Appointment &#160 &#10006;</button>
							        					<button class="btn btn-success w-100" id="acceptBtn" onClick="setValueform('acceptBtn', 'action${bk.bid}'), submit(${bk.bid})"> Accept Appointment &#160 &#10004;</button>
						        					
						        					<span class="my-3 text-center">
						        						Once you accept/reject it will be irreversible.
													</span>
						        				</c:when>
						        				<c:when test="${bk.status == 'rejected' && bk.uStatus == 'rejected'}">
						        					<span class="my-3 text-center">Sorry <br><span class="text-danger">Your Appointment is Rejected</span></span>
						        					<span class="mt-1 text-center">Date : ${bk.stDate}</span>
						        					<span class="mt-1 text-center">Time : ${bk.stTime}</span>
						        				</c:when>
						        				<c:when test="${bk.status == 'rejected' && bk.pStatus == 'rejected'}">
						        					<span class="my-3 text-center">Sorry <br><span class="text-danger">You cancled this Appointment</span></span>
						        					<span class="mt-1 text-center">Date : ${bk.stDate}</span>
						        					<span class="mt-1 text-center">Time : ${bk.stTime}</span>
						        				</c:when>
						        				<c:when test="${bk.status == 'accepted' && bk.pStatus == 'accepted' && bk.uStatus == 'accepted'}">
													<span class="my-3 text-center">You <span
														class="text-success fw-semibold">accepted</span> this
														appointment make sure to attend and after successfully done
														give your password here.
													</span>
													<form action="ChangeStatus" method="post" name="acceptForm" id="acceptForm">
						        						<input type="hidden" name="bid" value="${bk.bid}">
						        						<input type="hidden" name="type" value="${usertype}">
						        						<input type="hidden" name="status" value="complete">
							        					<input type="password" id="${bk.bid}-profPass" name="Pass" class="form-control my-3" placeholder="Enter password">
							        					<input type="submit" class="btn btn-success w-100" onclick="validate(event, ${bk.bid}-profPass)" value="Task Completed &#160 &#10004;">
							        				</form>
							        				
							        				<!-- Report form -->
							        				<c:if test="${bk.reported == false}">
								        				<form action="ReportFire.jsp" method="post" class="mt-3">
							        						<input type="hidden" name="bid" value="${bk.bid}">
							        						<input type="hidden" name="id" value="${bk.user.uid}">
							        						<input type="hidden" name="type" value="users">
							        						<input type="hidden" name="name" value="${bk.user.name}">
								        					<button type="submit" class="btn btn-dark w-100">Report &#160</button>
							        					</form>
						        					</c:if>
												</c:when>
												<c:when test="${bk.status == 'accepted' && bk.pStatus == 'completed' && bk.uStatus == 'accepted'}">
													<span class="my-3 text-center">Have any issue ? you can fire a report below
													</span>
							        				
							        				<!-- Report form -->
							        				<c:if test="${bk.reported == false}">
								        				<form action="ReportFire.jsp" method="post" class="mt-3">
							        						<input type="hidden" name="bid" value="${bk.bid}">
							        						<input type="hidden" name="id" value="${bk.user.uid}">
							        						<input type="hidden" name="type" value="users">
							        						<input type="hidden" name="name" value="${bk.user.name}">
								        					<button type="submit" class="btn btn-dark w-100">Report &#160</button>
							        					</form>
						        					</c:if>
												</c:when>
						        				<c:when test="${bk.status == 'completed' && bk.pStatus == 'completed' && bk.uStatus == 'completed'}">
						        					<span class="my-3 text-center">Thank you<br><span class="text-success">Your Appointment is successfully over</span></span>
						        					<span class="mt-1 text-center">Date : ${bk.stDate}</span>
						        					<span class="mt-1 text-center">Time : ${bk.stTime}</span>
						        					<c:choose>
						        						<c:when test="${bk.rating >= 4}">
						        							<span class="mt-3 badge bg-success text-white py-2 fw-semibold">User Rating: &#160; <span class="">${bk.rating}.0 &#9733;</span></span>
						        						</c:when>
						        						<c:when test="${bk.rating == 3}">
						        							<span class="mt-3 badge bg-warning text-dark py-2 fw-semibold">User Rating: &#160; <span class="">${bk.rating}.0 &#9733;</span></span>
						        						</c:when>
						        						<c:otherwise>
						        							<span class="mt-3 badge bg-danger text-white py-2 fw-semibold">User Rating: &#160; <span class="">${bk.rating}.0 &#9733;</span></span>
						        						</c:otherwise>
						        					</c:choose>
						        				</c:when>
					        				</c:choose>
					        			</div>
					        		
					        		</div>
					        		<!-- End Second Block -->
					        		
					        	</div>
					        <!-- End Main card div -->
				        </c:forEach>
			        </c:otherwise>
		        </c:choose>
	        </c:when>
	        <c:otherwise>
	        	<p class="text-center text-danger"> You have 0 bookings</p>
	        </c:otherwise>
	        </c:choose>
        
        </div>
        
    </section>
    
    <!-- Modal -->
		<div class="modal" tabindex="-1" id="alertModal" data-mdb-backdrop="true" style="display:none;">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">ALERT</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="closeModal()"></button>
		      </div>
		      <div class="modal-body">
		        <p id="modalBody">Modal body text goes here.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  onclick="closeModal()">Close</button>
		      </div>
		    </div>
		  </div>
		  <div class="modal-backdrop" style="z-index:-1; background-color:black; width:100%; height:100%; opacity: 0.5;"></div>
		</div>
    
    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="dashboard.js"></script>
    <script src="form.js"></script>
    <script src="bootstrap.bundle.min.js"></script>
</body>
</html>