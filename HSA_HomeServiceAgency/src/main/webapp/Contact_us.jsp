<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<head>
	<meta charset="ISO-8859-1">
	<title>Home Service Agency</title>
	
	<link rel="icon" type="image/x-icon" href="images/favicon.ico">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
	<link rel="stylesheet" href="docs.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="style.css" type="text/css">
	<link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
	<link rel="stylesheet" href="bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="Contact_us.css" type="text/css">
	<%
		String display = null;
		display = (String) request.getAttribute("Display");
	%>
</head>
<body>
  <!-------------------------------------------------Header---------------------------------> 
	<jsp:include page="Navbar.jsp"></jsp:include>                                                        
    <!-------------------------------------------------Feedback(heading)---------------------------------> 
    <div class="container" style="margin-top:7%;">
        <div class="mb-3">
          <h1><b>Your Feedback Is Valuable To Us!</b></h1>
        </div>
        <!-------------------------------------------------Feedback(Left Box)--------------------------------->
        <c:if test="${userVarify == false}">
			<div class="container">
				<div class="alert alert-danger d-flex align-items-center" role="alert">
				  <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
				    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
				  </svg>
				  <div>
				    ${errorMsg}
				  </div>
				</div>
			</div>
		</c:if>
		<c:if test="${isExist != null}">
			<div class="container">
				<div class="alert alert-warning d-flex align-items-center" role="alert">
				  <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
				    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
				  </svg>
				  <div>
				    ${isExist}
				  </div>
				</div>
			</div>
		</c:if>
        <div class="row">
          <div class="col-md-4">
              <div class="form-outline">
                    <form action="Contact_us" method="POST">
                    	<input type="hidden" name="action" value="${action}">
                    	<c:choose>
	                    	<c:when test="${feedMsg != null}">
		                    	<textarea <%=display%> class="form-control form-control-lg" id="text" rows="7" name="fmessage" placeholder="Write Your Feedback"  style="border-radius: 15px; width: 31rem; height: 25rem;" >${feedMsg}</textarea>
	                      	</c:when>
	                      	<c:otherwise>
	                      		<textarea <%=display%> class="form-control form-control-lg" id="text" rows="7" name="fmessage" placeholder="Write Your Feedback"  style="border-radius: 15px; width: 31rem; height: 25rem;" ></textarea>
	                      	</c:otherwise>
                      	</c:choose>
                      <label class="form-label" for="text"></label><br>
                      <c:if test="${action != 'NoAction'}">
                      <input type="submit" class="btn btn-warning btn-lg" style="margin-bottom:1rem" id="submitButton" value="${action}">
                      </c:if>
                    </form>
                                           
              </div>
          </div>
          <div class="col-md-1"></div>
          <!--Feedback(Right Box-Map)-->
          <div class="col-md-7">
              <div id="map-container-google-1" class="z-depth-1-half map-container" >
                  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3684.211985517326!2d88.41447610000002!3d22.571173499999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a02750e49614001%3A0x6c73b229a36be669!2sHome%20Service%20Agency!5e0!3m2!1sen!2sin!4v1670760769623!5m2!1sen!2sin" frameborder="0"
                    style="border:0" allowfullscreen></iframe>
              </div>
          </div>
        </div>
    </div>
  </section>
  <jsp:include page="Footer.jsp"></jsp:include>

<script src="bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="Contact_us.js"></script>
<script src="loginSignup.js"></script>
</body>

</html>

