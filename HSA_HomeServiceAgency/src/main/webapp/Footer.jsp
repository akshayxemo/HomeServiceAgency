<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
   	boolean cookie1 = false;
	boolean cookie2 = false;
	String type = null;
	String homeDirection = "./Home";
	   Cookie ck[] = request.getCookies();
		if(ck!=null) {
		    for (Cookie cookie : ck) {
		      if(cookie.getName().equals("id") && cookie.getValue()!=null) {
		    	  cookie1 = true;
		      }
		      if(cookie.getName().equals("userType") && cookie.getValue()!=null) {
		    	  cookie2 = true;
		    	  type = cookie.getValue();
			  }
		    }
		  }
		if(cookie1 && cookie2){
			String cls = null; 
    		if(type.equals("professionals")){ 
    			 cls = "invisible";
    			 homeDirection = "./Dashboard";
    		}
   %>
	<section class="footer-sec">
		<div class="container pb-3">
			<div class="footer-nav d-flex py-3 <%=cls %>">
				<ul class="mx-auto mb-2 mb-lg-0 f-navbar">
	        		<li class="nav-item">
	          			<a class="nav-link" href="./Home">Home</a>
	        		</li>
	       			<li class="nav-item">
	          			<a class="nav-link" href="./SearchProfessionals">Services</a>
	       	 		</li>
	        		<li class="nav-item">
	          			<a class="nav-link" href="about_us.jsp">About us</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link" href="./GotoContactUs">Contact us</a>
	        		</li>
      			</ul>
			</div>
			<hr class="h-rule-footer">
			<div class="row py-2">
			<div class="col-4">
				<a href="<%= homeDirection %>"><img src="images/Logo-white.svg" class="f-image"></a>
			</div>
			<div class="col-2"></div>
			<div class="col-6 my-auto"><p class="m-0"> @ 2022-2023 HomeServiceAgency india Pvt. Ltd.</p></div>
		</div>
		</div>
		
	</section>
	
<%} 
		else{
   %>
   <section class="footer-sec">
		<div class="container pb-3">
			<div class="footer-nav d-flex py-3">
				<ul class="mx-auto mb-2 mb-lg-0 f-navbar">
        		<li class="nav-item">
          			<a class="nav-link" href="index.jsp">Home</a>
        		</li>
       			<li class="nav-item">
          			<a class="nav-link" href="service.jsp">Services</a>
       	 		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="about_us.jsp">About us</a>
        		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="Contact_us.jsp">Contact us</a>
        		</li>
      		</ul>
			</div>
			<hr class="h-rule-footer">
			<div class="row py-2">
			<div class="col-4">
				<a href="index.html"><img src="images/Logo-white.svg" class="f-image"></a>
			</div>
			<div class="col-2"></div>
			<div class="col-6 my-auto"><p class="m-0"> @ 2022-2023 HomeServiceAgency india Pvt. Ltd.</p></div>
		</div>
		</div>
		
	</section>
	<% }%>