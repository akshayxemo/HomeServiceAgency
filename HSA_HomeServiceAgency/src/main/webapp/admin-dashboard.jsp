<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
<title>Admin Dashboard</title>
<style type="text/css">
	body{
		background-image:url("./images/AdminBg.png");
		background-size:cover;
		background-repeat:no-repeat;
	}
	.bg{
		height:80vh;
		overflow:hidden;
		background-image:url("./images/admin.jpg");
		background-size:cover;
		background-repeat:no-repeat;
	}
	.logo{
		height:2rem;
	}
	::-webkit-scrollbar {
		  width: 0px;
		}
		
		/* Track */
		::-webkit-scrollbar-track {
		  background: #f1f1f1;
		}
		
		/* Handle */
		::-webkit-scrollbar-thumb {
		  background: #000;
		}
		
		/* Handle on hover */
		::-webkit-scrollbar-thumb:hover {
		  background: #ffff00;
		}
		
</style>
</head>
<body class="">
	<nav class="navbar bg-white shadow-lg p-3 mb-5 bg-body rounded">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="./Home"><img src="images/Logo.svg" class="logo"></a>
	    <em class="fs-4 fw-semibold">Admin Pannel</em>
	    <span class="d-flex" role="search">
	      <a href="LogOut" type="button" class="btn btn-dark me-2" id="logOutButton" style="color:white">Log Out</a>
	    </span>
	  </div>
	</nav>
	<div class="container-fluid">
	  <div class="row px-4">
	  	<div class="col-md-4">
	  		<div class="bg-white shadow-lg mb-5 p-0 rounded border">
		  		<h4 class="text-center rounded-top text-bg-warning w-100 fw-bold p-2">PROFESSIONALS</h4>
		  		<div class="px-5 py-2" style="overflow-y: auto; max-height:75vh;">
		  		
			  		<c:forEach var="p" items="${ProfInfo}">
				  		<div class="border-bottom">
					  		<p class="d-flex justify-content-between my-3 align-items-center" id="hsa-${p.id}">
					  			<span># ${p.id} &#160 &#160 
					  				<span class="fs-5"> ${p.name}</span>
					  			</span>
					  			<span>
					  			<c:choose>
					  				<c:when test="${p.status == 'safe'}">
					  					<span class="badge text-success border-success border p-2 fs-6 fw-normal">secured</span> &#160 &#160
					  				</c:when>
					  				<c:otherwise>
					  					<span class="badge text-bg-danger p-2 fs-6 fw-normal">Banned</span> &#160 &#160
					  				</c:otherwise>
					  			</c:choose>
								  <button class="btn btn-light border" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${p.id}-p" aria-expanded="false" aria-controls="collapseExample">
								 	<i class="bi bi-chevron-down text-dark"></i>
								  </button>
					  			</span>
							</p>
							<div class="collapse" id="hsa-${p.id}-p">
							  <div class="card card-body">
							  	<div class="row">
							  		<div class="col-md-9">
								  		<table>
								  			<tr>
								  				<td colspan="1"><p class="fw-semibold"><i class="bi bi-envelope"></i> Email:</p></td>
								  				<td><p> ${p.email}</p></td>
								  			</tr>
								  			<tr>
								  				<td colspan="1"><p class="fw-semibold"><i class="bi bi-phone"></i> Phone:</p></td>
								  				<td><p> ${p.phone} / ${p.altPhone}</p></td>
								  			</tr>
								  			<tr>
								  				<td colspan="1"><p class="fw-semibold"><i class="bi bi-pin"></i> Address:</p></td>
								  				<td><p> ${p.address}</p></td>
								  			</tr>
								  			<tr>
								  				<td colspan="1"><p class="fw-semibold"><i class="bi bi-star"></i> Rating:</p></td>
								  				<td><p> ${p.rating}</p></td>
								  			</tr>
								  		</table>				  	
								  	</div>
								  	<div class="col-md-3">
								  		<img src="./ImageViewer?id=${p.id}&type=professionals" class="img-fluid border border-dark border-2 rounded-circle mx-auto d-block" style="width: 5rem; height: 4.9rem;">
								  		<form action="adminApproval.jsp" method="post">
								  			<input type="hidden" name="BanID" value="${p.id}">
								  			<input type="hidden" name="Type" value="professionals">
								  			<c:choose>
								  				<c:when test="${p.status == 'safe'}">
								  					<input type="hidden" name="Action" value="ban">
								  					<input type="hidden" name="Message" value="Banning Professional Id">
								  					<button class="btn btn-danger w-100 mt-3">Ban Account</button>
								  				</c:when>
								  				<c:otherwise>
								  					<input type="hidden" name="Action" value="unban">
								  					<input type="hidden" name="Message" value="Unbanning Professional Id">
								  					<button class="btn btn-success w-100 mt-3">Unban Account</button>
								  				</c:otherwise>
								  			</c:choose>
								  		</form>
								  	</div>
							  	</div>
							  </div>
							</div>
						</div>
					</c:forEach>
				</div>
	  		</div>
	  	</div>
	  	
	  	<div class="col-md-4">
	  		<div class="bg-white shadow-lg mb-5 p-0 rounded border">
		  		<h4 class="text-center rounded-top text-bg-dark w-100 fw-bold p-2">USERS</h4>
		  		<div class="px-5 py-2" style="overflow-y: auto; max-height:75vh;">
		  		
			  		<c:forEach var="u" items="${UserInfo}">
				  		<div class="border-bottom">
					  		<p class="d-flex justify-content-between my-3 align-items-center" id="hsa-${u.uid}">
					  			<span># ${u.uid} &#160 &#160 
					  				<span class="fs-5"> ${u.name}</span>
					  			</span>
					  			<span>
					  				<c:choose>
						  				<c:when test="${u.status == 'safe'}">
						  					<span class="badge text-success border-success border p-2 fs-6 fw-normal">secured</span> &#160 &#160
						  				</c:when>
						  				<c:otherwise>
						  					<span class="badge text-bg-danger p-2 fs-6 fw-normal">Banned</span> &#160 &#160
						  				</c:otherwise>
					  				</c:choose>
								  	<button class="btn btn-light border" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${u.uid}-u" aria-expanded="false" aria-controls="collapseExample">
								    	<i class="bi bi-chevron-down text-dark"></i>
								  	</button>
					  			</span>
							</p>
							<div class="collapse" id="hsa-${u.uid}-u">
							  <div class="card card-body">
							  	<div class="row">
							  		<div class="col-md-9">
								  		<table>
								  			<tr>
								  				<td colspan="1"><p class="fw-semibold"><i class="bi bi-envelope text-dark"></i> Email:</p></td>
								  				<td><p> ${u.email}</p></td>
								  			</tr>
								  			<tr>
								  				<td colspan="1"><p class="fw-semibold"><i class="bi bi-phone text-dark"></i> Phone:</p></td>
								  				<td><p> ${u.phone} / ${u.altPhone}</p></td>
								  			</tr>
								  			<tr>
								  				<td colspan="1"><p class="fw-semibold"><i class="bi bi-pin text-dark"></i> Address:</p></td>
								  				<td><p> ${u.address}</p></td>
								  			</tr>
								  		</table>				  	
								  	</div>
								  	<div class="col-md-3">
								  		<img src="./ImageViewer?id=${u.uid}&type=users" class="img-fluid border border-dark border-2 rounded-circle mx-auto d-block" style="width: 5rem; height: 4.9rem;">
								  		<form action="adminApproval.jsp" method="post">
								  			<input type="hidden" name="BanID" value="${u.uid}">
								  			<input type="hidden" name="Type" value="users">
								  			<c:choose>
								  				<c:when test="${u.status == 'safe'}">
								  					<input type="hidden" name="Action" value="ban">
								  					<input type="hidden" name="Message" value="Banning user Id">
								  					<button class="btn btn-danger w-100 mt-3">Ban Account</button>
								  				</c:when>
								  				<c:otherwise>
								  					<input type="hidden" name="Action" value="unban">
								  					<input type="hidden" name="Message" value="Unbanning user Id">
								  					<button class="btn btn-success w-100 mt-3">Unban Account</button>
								  				</c:otherwise>
								  			</c:choose>
								  		</form>
								  	</div>
							  	</div>
							  </div>
							</div>
						</div>
					</c:forEach>
				</div>
	  		</div>
	  	</div>
	  	
	  												<!--  Report section -->
	  	
	  	<div class="col-md-4">
	  		<div class="bg-dark shadow-lg mb-5 p-4 rounded">
	  				<p class="text-light">
					  <button class="btn btn-primary position-relative" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRepor" aria-expanded="false" aria-controls="collapseExample">
					    Reports
					    <c:if test="${ReportUnseen.size() gt 0}">
						    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
						    ${ReportUnseen.size()}
						    	<span class="visually-hidden">New alerts</span>
						  	</span>
						 </c:if>
					  </button>
					 	&#160  here is all the reports are fired by
					</p>
	  			<div style="overflow-y: auto; height:75vh">
					<div class="collaps" id="collapseReport">
					  <div class="card card-body">
					  <c:if test="${ReportUnseen.size() == 0}">
					  	<em class="text-danger fw-semibold">There is no new reports</em>
					  </c:if>
					  	<c:forEach var="repS" items="${ReportUnseen}">
						  <div class="border-bottom">
						    <div class="d-flex justify-content-between align-items-center my-3">
						    	<span class="text-danger fw-bold">Report No. : ${repS.id}</span>
						    	<span class="text-dark fw-normal"> ${repS.date} -- ${repS.time}</span>
						    	
							    <form method="post" action="Admin">
							    	<input type="hidden" name="rid" value="${repS.id}">
							    	<input type="hidden" name="action" value="changeSeen">
								  	<button onclick="Submit(event)" class="btn btn-dark" type="submit" data-bs-toggle="collapse" data-bs-target="#Rid-${repS.id}-s" aria-expanded="false" aria-controls="collapseExample">
								    	<i class="bi bi-chevron-down"></i>
								  	</button>
								</form>
								
							</div>
							<div class="collapse" id="Rid-${repS.id}-s">
							  <div class="card card-body">
							  
							    <div class="row">
							  		<div class="col-md-9">
								  		<div class="mb-3 w-100 row">
								  			<div class="text-center col-md-4">
								  					<c:choose>
								  						<c:when test="${repS.againstType == 'professionals'}">
															<img src="./ImageViewer?id=${repS.uid}&type=users"
																class="img-fluid border border-dark border-2 mx-auto rounded-circle d-block"
																style="width: 3rem; height: 3rem;">
															<p>User</p>
								  						</c:when>
								  						<c:otherwise>
															<img src="./ImageViewer?id=${repS.pid}&type=professionals"
																class="img-fluid border border-dark mx-auto border-2 rounded-circle d-block"
																style="width: 3rem; height: 3rem;">
															<p>Professional</p>
								  						</c:otherwise>
								  					</c:choose>
								  			</div>
								  			<div class="text-center col-md-4 text-danger">
								  				<i class="bi bi-exclamation-triangle-fill fs-2"></i>
								  				<p>Reports</p>
								  			</div>
								  			<div class="text-center col-md-4">
								  					<c:choose>
								  						<c:when test="${repS.againstType == 'professionals'}">
								  							<img src="./ImageViewer?id=${repS.pid}&type=professionals" class="img-fluid border border-dark mx-auto border-2 rounded-circle d-block" style="width: 3rem; height: 3rem;">
								  							<p>Professional</p>
								  						</c:when>
								  						<c:otherwise>
								  							<img src="./ImageViewer?id=${repS.uid}&type=users" class="img-fluid border border-dark border-2 mx-auto rounded-circle d-block" style="width: 3rem; height: 3rem;">
								  							<p>User</p>
								  						</c:otherwise>
								  					</c:choose>
								  			</div>
								  		</div>
								  		<div class="mt-3 pt-3 border-top">
								  			<p class="fw-semibold m-0"> Report: </p>
								  			<p class="fw-normal mt-1 text-secondary">${repS.msg}</p>
								  		</div>				  	
								  	</div>
								  	<div class="col-md-3">
								  		<form id="UnseenResolve" method="post">
								  			<input type="hidden" name="rid" value="${repS.id}">
								  			<input type="hidden" name="action" value="resolve">
								  			<button type="submit" onclick="setFormAction1()" class="btn btn-success w-100">Resolve</button>
								  		</form>
								  		<form action="adminApproval.jsp" method="post">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<c:forEach var="u" items="${UserInfo}">
								  						<c:if test="${repS.uid == u.uid}">
								  							<c:choose>
								  								<c:when test="${u.status == 'baned'}">
								  									<p>Reporter Banned ID: ${u.uid} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.uid}">
												  					<input type="hidden" name="RepBan" value="userBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="users">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning users Id">
												  					<button class="btn btn-warning w-100 mt-3">Ban Reporter</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:when>
								  				<c:otherwise>
								  					<c:forEach var="p" items="${ProfInfo}">
								  						<c:if test="${repS.pid == p.id}">
								  							<c:choose>
								  								<c:when test="${p.status == 'baned'}">
								  									<p>Reporter Banned ID: ${p.id} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.pid}">
												  					<input type="hidden" name="RepBan" value="profBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="professionals">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning professionals Id">
												  					<button class="btn btn-warning w-100 mt-3">Ban Reporter</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:otherwise>
								  			</c:choose>
								  		</form>
								  		<form action="adminApproval.jsp" method="post">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<c:forEach var="p" items="${ProfInfo}">
								  						<c:if test="${repS.pid == p.id}">
								  							<c:choose>
								  								<c:when test="${p.status == 'baned'}">
								  									<p>Reporter Banned ID: ${p.id} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.pid}">
												  					<input type="hidden" name="RepBan" value="profBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="professionals">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning professionals Id">
												  					<button class="btn btn-danger w-100 mt-3">Ban Reported</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:when>
								  				<c:otherwise>
								  					<c:forEach var="u" items="${UserInfo}">
								  						<c:if test="${repS.uid == u.uid}">
								  							<c:choose>
								  								<c:when test="${u.status == 'baned'}">
								  									<p>Reporter Banned ID: ${u.uid} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.uid}">
												  					<input type="hidden" name="RepBan" value="userBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="users">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning users Id">
												  					<button class="btn btn-danger w-100 mt-3">Ban Reported</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:otherwise>
								  			</c:choose>
								  		</form>
								  	</div>
								  </div>
							   		<div class="row pt-2 border-top mt-3">
							   			<div class=" col-md-6 text-center">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<span class="fw-semibold">Reporter</span>
								  					<a href="#hsa-${repS.uid}">
									  					<button class="btn btn-light border w-100 mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.uid}-u" aria-expanded="false" aria-controls="collapseExample">
															 Users details
														</button>
													</a>
													<br>
								  				</c:when>
								  				<c:otherwise>
								  					<span class="fw-semibold">Reporter</span>
								  					<a href="#hsa-${repS.pid}">
									  					<button class="btn btn-light border w-100 mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.pid}-p" aria-expanded="false" aria-controls="collapseExample">
															Professionals details
														</button>
													</a>
													<br>
								  				</c:otherwise>
								  			</c:choose>
								  		</div>
								  		<div class="col-md-6 text-center">
							   				<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<span class="fw-semibold">Reported</span>
								  					<a href="#hsa-${repS.pid}">
									  					<button class="btn btn-dark w-100 border mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.pid}-p" aria-expanded="false" aria-controls="collapseExample">
															Professionals details
														</button>
													</a>
													<br>
								  				</c:when>
								  				<c:otherwise>
								  					<span class="fw-semibold">Reported</span>
								  					<a href="#hsa-${repS.uid}">
									  					<button class="btn btn-dark w-100 border mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.uid}-u" aria-expanded="false" aria-controls="collapseExample">
															 Users details
														</button>
													</a>
													<br>
								  				</c:otherwise>
								  			</c:choose>
							   			</div>
							   		</div>
								  </div>
								</div>
							</div>
						</c:forEach>
						
						<span class="my-3 badge text-bg-warning py-3 fs-6 fw-semibold"> Seen Unresolved reports </span>
						<c:forEach var="repS" items="${ReportSeen}">
						<c:if test="${repS.action == 'none'}">
						  <div class="border-bottom">
						    <div class="d-flex justify-content-between align-items-center my-3">
						    	<span class="text-dark fw-bold">Report No. : ${repS.id}</span>
						    	<span class="text-dark fw-normal"> ${repS.date} -- ${repS.time}</span>
								<button class="btn btn-dark" type="button" data-bs-toggle="collapse" data-bs-target="#Rid-${repS.id}-s" aria-expanded="false" aria-controls="collapseExample">
								    <i class="bi bi-chevron-down"></i>
								</button>
							</div>
							<div class="collapse" id="Rid-${repS.id}-s">
							  <div class="card card-body">
							  
							    <div class="row">
							  		<div class="col-md-9">
								  		<div class="mb-3 w-100 row">
								  			<div class="text-center col-md-4">
								  					<c:choose>
								  						<c:when test="${repS.againstType == 'professionals'}">
															<img src="./ImageViewer?id=${repS.uid}&type=users"
																class="img-fluid border border-dark border-2 mx-auto rounded-circle d-block"
																style="width: 3rem; height: 3rem;">
															<p>User</p>
								  						</c:when>
								  						<c:otherwise>
															<img src="./ImageViewer?id=${repS.pid}&type=professionals"
																class="img-fluid border border-dark mx-auto border-2 rounded-circle d-block"
																style="width: 3rem; height: 3rem;">
															<p>Professional</p>
								  						</c:otherwise>
								  					</c:choose>
								  			</div>
								  			<div class="text-center col-md-4 text-danger">
								  				<i class="bi bi-exclamation-triangle-fill fs-2"></i>
								  				<p>Reports</p>
								  			</div>
								  			<div class="text-center col-md-4">
								  					<c:choose>
								  						<c:when test="${repS.againstType == 'professionals'}">
								  							<img src="./ImageViewer?id=${repS.pid}&type=professionals" class="img-fluid border border-dark mx-auto border-2 rounded-circle d-block" style="width: 3rem; height: 3rem;">
								  							<p>Professional</p>
								  						</c:when>
								  						<c:otherwise>
								  							<img src="./ImageViewer?id=${repS.uid}&type=users" class="img-fluid border border-dark border-2 mx-auto rounded-circle d-block" style="width: 3rem; height: 3rem;">
								  							<p>User</p>
								  						</c:otherwise>
								  					</c:choose>
								  			</div>
								  		</div>
								  		<div class="mt-3 pt-3 border-top">
								  			<p class="fw-semibold m-0"> Report: </p>
								  			<p class="fw-normal mt-1 text-secondary">${repS.msg}</p>
								  		</div>				  	
								  	</div>
								  	<div class="col-md-3">
								  		<form id="SeenResolved" method="post">
								  			<input type="hidden" name="rid" value="${repS.id}">
								  			<input type="hidden" name="action" value="resolve">
								  			<button type="submit" onclick="setFormAction2()" class="btn btn-success w-100">Resolve</button>
								  		</form>
								  		<form action="adminApproval.jsp" method="post">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<c:forEach var="u" items="${UserInfo}">
								  						<c:if test="${repS.uid == u.uid}">
								  							<c:choose>
								  								<c:when test="${u.status == 'baned'}">
								  									<p>Reporter Banned ID: ${u.uid} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.uid}">
												  					<input type="hidden" name="RepBan" value="userBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="users">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning users Id">
												  					<button class="btn btn-warning w-100 mt-3">Ban Reporter</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:when>
								  				<c:otherwise>
								  					<c:forEach var="p" items="${ProfInfo}">
								  						<c:if test="${repS.pid == p.id}">
								  							<c:choose>
								  								<c:when test="${p.status == 'baned'}">
								  									<p>Reporter Banned ID: ${p.id} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.pid}">
												  					<input type="hidden" name="RepBan" value="profBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="professionals">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning professionals Id">
												  					<button class="btn btn-warning w-100 mt-3">Ban Reporter</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:otherwise>
								  			</c:choose>
								  		</form>
								  		<form action="adminApproval.jsp" method="post">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<c:forEach var="p" items="${ProfInfo}">
								  						<c:if test="${repS.pid == p.id}">
								  							<c:choose>
								  								<c:when test="${p.status == 'baned'}">
								  									<p>Reporter Banned ID: ${p.id} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.pid}">
												  					<input type="hidden" name="RepBan" value="profBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="professionals">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning professionals Id">
												  					<button class="btn btn-danger w-100 mt-3">Ban Reported</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:when>
								  				<c:otherwise>
								  					<c:forEach var="u" items="${UserInfo}">
								  						<c:if test="${repS.uid == u.uid}">
								  							<c:choose>
								  								<c:when test="${u.status == 'baned'}">
								  									<p>Reporter Banned ID: ${u.uid} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.uid}">
												  					<input type="hidden" name="RepBan" value="userBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="users">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning users Id">
												  					<button class="btn btn-danger w-100 mt-3">Ban Reported</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:otherwise>
								  			</c:choose>
								  		</form>
								  	</div>
								  </div>
							   		<div class="row pt-2 border-top mt-3">
							   			<div class=" col-md-6 text-center">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<span class="fw-semibold">Reporter</span>
								  					<a href="#hsa-${repS.uid}">
									  					<button class="btn btn-light border w-100 mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.uid}-u" aria-expanded="false" aria-controls="collapseExample">
															 Users details
														</button>
													</a>
													<br>
								  				</c:when>
								  				<c:otherwise>
								  					<span class="fw-semibold">Reporter</span>
								  					<a href="#hsa-${repS.pid}">
									  					<button class="btn btn-light border w-100 mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.pid}-p" aria-expanded="false" aria-controls="collapseExample">
															Professionals details
														</button>
													</a>
													<br>
								  				</c:otherwise>
								  			</c:choose>
								  		</div>
								  		<div class="col-md-6 text-center">
							   				<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<span class="fw-semibold">Reported</span>
								  					<a href="#hsa-${repS.pid}">
									  					<button class="btn btn-dark w-100 border mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.pid}-p" aria-expanded="false" aria-controls="collapseExample">
															Professionals details
														</button>
													</a>
													<br>
								  				</c:when>
								  				<c:otherwise>
								  					<span class="fw-semibold">Reported</span>
								  					<a href="#hsa-${repS.uid}">
									  					<button class="btn btn-dark w-100 border mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.uid}-u" aria-expanded="false" aria-controls="collapseExample">
															 Users details
														</button>
													</a>
													<br>
								  				</c:otherwise>
								  			</c:choose>
							   			</div>
							   		</div>
								  </div>
								</div>
							</div>
							</c:if>
						</c:forEach>
						
						<span class="my-3 badge text-bg-success py-3 fs-6 fw-semibold"> Resolved reports </span>
						<c:forEach var="repS" items="${ReportSeen}">
						<c:if test="${repS.action != 'none'}">
						  <div class="border-bottom">
						    <div class="d-flex justify-content-between align-items-center my-3">
						    	<span class="text-dark fw-bold">Report No. : ${repS.id}</span>
						    	<span class="text-dark fw-normal"> ${repS.date} -- ${repS.time}</span>
								<button class="btn btn-dark" type="button" data-bs-toggle="collapse" data-bs-target="#Rid-${repS.id}-s" aria-expanded="false" aria-controls="collapseExample">
									<i class="bi bi-chevron-down"></i>
								</button>
							</div>
							<div class="collapse" id="Rid-${repS.id}-s">
							  <div class="card card-body">
							  
							    <div class="row">
							  		<div class="col-md-9">
								  		<div class="mb-3 w-100 row">
								  			<div class="text-center col-md-4">
								  					<c:choose>
								  						<c:when test="${repS.againstType == 'professionals'}">
															<img src="./ImageViewer?id=${repS.uid}&type=users"
																class="img-fluid border border-dark border-2 mx-auto rounded-circle d-block"
																style="width: 3rem; height: 3rem;">
															<p>User</p>
								  						</c:when>
								  						<c:otherwise>
															<img src="./ImageViewer?id=${repS.pid}&type=professionals"
																class="img-fluid border border-dark mx-auto border-2 rounded-circle d-block"
																style="width: 3rem; height: 3rem;">
															<p>Professional</p>
								  						</c:otherwise>
								  					</c:choose>
								  			</div>
								  			<div class="text-center col-md-4 text-danger">
								  				<i class="bi bi-exclamation-triangle-fill fs-2"></i>
								  				<p>Reports</p>
								  			</div>
								  			<div class="text-center col-md-4">
								  					<c:choose>
								  						<c:when test="${repS.againstType == 'professionals'}">
								  							<img src="./ImageViewer?id=${repS.pid}&type=professionals" class="img-fluid border border-dark mx-auto border-2 rounded-circle d-block" style="width: 3rem; height: 3rem;">
								  							<p>Professional</p>
								  						</c:when>
								  						<c:otherwise>
								  							<img src="./ImageViewer?id=${repS.uid}&type=users" class="img-fluid border border-dark border-2 mx-auto rounded-circle d-block" style="width: 3rem; height: 3rem;">
								  							<p>User</p>
								  						</c:otherwise>
								  					</c:choose>
								  			</div>
								  		</div>
								  		<div class="mt-3 pt-3 border-top">
								  			<p class="fw-semibold m-0"> Report: </p>
								  			<p class="fw-normal mt-1 text-secondary">${repS.msg}</p>
								  		</div>				  	
								  	</div>
								  	<div class="col-md-3">
								  			<p class="p-2 text-center rounded border border-success border-2 fw-semibold text-success w-100">${repS.action}</p>
								  		<form action="adminApproval.jsp" method="post">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<c:forEach var="u" items="${UserInfo}">
								  						<c:if test="${repS.uid == u.uid}">
								  							<c:choose>
								  								<c:when test="${u.status == 'baned'}">
								  									<p>Reporter Banned ID: ${u.uid} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.uid}">
												  					<input type="hidden" name="RepBan" value="userBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="users">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning users Id">
												  					<button class="btn btn-warning w-100 mt-3">Ban Reporter</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:when>
								  				<c:otherwise>
								  					<c:forEach var="p" items="${ProfInfo}">
								  						<c:if test="${repS.pid == p.id}">
								  							<c:choose>
								  								<c:when test="${p.status == 'baned'}">
								  									<p>Reporter Banned ID: ${p.id} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.pid}">
												  					<input type="hidden" name="RepBan" value="profBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="professionals">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning professionals Id">
												  					<button class="btn btn-warning w-100 mt-3">Ban Reporter</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:otherwise>
								  			</c:choose>
								  		</form>
								  		<form action="adminApproval.jsp" method="post">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<c:forEach var="p" items="${ProfInfo}">
								  						<c:if test="${repS.pid == p.id}">
								  							<c:choose>
								  								<c:when test="${p.status == 'baned'}">
								  									<p>Reporter Banned ID: ${p.id} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.pid}">
												  					<input type="hidden" name="RepBan" value="profBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="professionals">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning professionals Id">
												  					<button class="btn btn-danger w-100 mt-3">Ban Reported</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:when>
								  				<c:otherwise>
								  					<c:forEach var="u" items="${UserInfo}">
								  						<c:if test="${repS.uid == u.uid}">
								  							<c:choose>
								  								<c:when test="${u.status == 'baned'}">
								  									<p>Reporter Banned ID: ${u.uid} </p>
								  								</c:when>
								  								<c:otherwise>
												  					<input type="hidden" name="BanID" value="${repS.uid}">
												  					<input type="hidden" name="RepBan" value="userBan">
												  					<input type="hidden" name="rid" value="${repS.id}">
												  					<input type="hidden" name="Type" value="users">
												  					<input type="hidden" name="Action" value="ban">
												  					<input type="hidden" name="Message" value="Banning users Id">
												  					<button class="btn btn-danger w-100 mt-3">Ban Reported</button>
								  								</c:otherwise>
								  							</c:choose>
								  						</c:if>
								  					</c:forEach>
								  				</c:otherwise>
								  			</c:choose>
								  		</form>
								  	</div>
								  </div>
							   		<div class="row pt-2 border-top mt-3">
							   			<div class=" col-md-6 text-center">
								  			<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<span class="fw-semibold">Reporter</span>
								  					<a href="#hsa-${repS.uid}">
									  					<button class="btn btn-light border w-100 mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.uid}-u" aria-expanded="false" aria-controls="collapseExample">
															 Users details
														</button>
													</a>
													<br>
								  				</c:when>
								  				<c:otherwise>
								  					<span class="fw-semibold">Reporter</span>
								  					<a href="#hsa-${repS.pid}">
									  					<button class="btn btn-light border w-100 mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.pid}-p" aria-expanded="false" aria-controls="collapseExample">
															Professionals details
														</button>
													</a>
													<br>
								  				</c:otherwise>
								  			</c:choose>
								  		</div>
								  		<div class="col-md-6 text-center">
							   				<c:choose>
								  				<c:when test="${repS.againstType == 'professionals'}">
								  					<span class="fw-semibold">Reported</span>
								  					<a href="#hsa-${repS.pid}">
									  					<button class="btn btn-dark w-100 border mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.pid}-p" aria-expanded="false" aria-controls="collapseExample">
															Professionals details
														</button>
													</a>
													<br>
								  				</c:when>
								  				<c:otherwise>
								  					<span class="fw-semibold">Reported</span>
								  					<a href="#hsa-${repS.uid}">
									  					<button class="btn btn-dark w-100 border mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#hsa-${repS.uid}-u" aria-expanded="false" aria-controls="collapseExample">
															 Users details
														</button>
													</a>
													<br>
								  				</c:otherwise>
								  			</c:choose>
							   			</div>
							   		</div>
								  </div>
								</div>
							</div>
							</c:if>
						</c:forEach>
						
					  </div>
					</div>
	  			</div>
	  		</div>
	  	</div>
	  </div>
	</div>
	<script src="adminDashboard.js"></script>
</body>
</html>