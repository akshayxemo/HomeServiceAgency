<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirm Admin</title>
	<link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="bootstrap.min.css" type="text/css">
</head>
<style>
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
<body>
	<% 
		String BanId = request.getParameter("BanID"); 
		String Type = request.getParameter("Type"); 
		String Msg = request.getParameter("Message"); 
		String Action = request.getParameter("Action"); 
		String repBan = request.getParameter("RepBan");
		String rid =  request.getParameter("rid");
	%>
	<section class="top">
		<a class="navbar-brand" href="./Home"><img src="images/Logo.svg" class="logo"></a>
		<p>Welcome to Home Service Agency</p>
	</section>
		<section>
			<div class="modal" tabindex="-1" style="display:block; z-index:1;">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content text-center">
			     <c:choose>
				   	 <c:when test="${Varify != true}">
					      <div class="modal-body">
					       	<h3>Admin Confirm</h3>
					       		<%= Msg %> <%= BanId %>
					      </div>
				      </c:when>
				      <c:otherwise>
				      	<div class="modal-body text-bg-${color}">
					    	<h3>Admin Confirm</h3>
					       	${Msg}
					    </div>
				      </c:otherwise>
			      </c:choose>
			      <div class="modal-body text-bg-light">
			      <c:if test="${Varify != true}">
			      		<form name="AdminConfirm" id="AdminConfirm" method="post" action="Admin">
			      			<input type="hidden" name="RepBan" value="<%= repBan%>">
			      			<input type="hidden" name="rid" value="<%= rid%>">
				        	<input type="hidden" name="action" value="<%= Action %>">
				        	<input type="hidden" name="type" value="<%= Type %>">
				        	<input type="hidden" name="id" value="<%= BanId %>">
				        	<div class="form-floating mb-3">
								<input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
								<label for="floatingPassword">Enter Password <span style="color:red">* </span></label>
							</div>
				        	<button type="submit" class="btn btn-success mb-3" onclick="passwordFieldCheck(event)">Done</button>
				        </form>
			        </c:if>
			        <a href="./Dashboard">Go back</a>
			      </div>
			    </div>
			  </div>
			</div>
		</section>
	
	
	<script src="bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	function passwordFieldCheck(event){
		let newPass = document.getElementById("floatingPassword");
		if(newPass.value !=""){
			return true;
		}
		else{
			event.preventDefault();
			alert("Fill the password fields");
			newPass.classList.add("is-invalid");
		}
	}
	</script>
</body>
</html>