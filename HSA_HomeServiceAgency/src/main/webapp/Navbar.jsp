<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <% 
   	boolean cookie1 = false;
	boolean cookie2 = false;
	String type = null;
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
   %>
   <!--  <nav class="navbar bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand">Navbar</a>
		    <form class="d-flex" role="search">
		      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-success" type="submit">Search</button>
		    </form>
		  </div>
	</nav> -->
   <nav class="navbar navbar-expand-lg white px-4 fixed-top">
	  	<div class="container-fluid  ">
	   			<a class="navbar-brand" href="index.html"><img src="images/Logo.svg" class="logo"></a>
	    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	      		<span class="navbar-toggler-icon"></span>
	    		</button>
	    		<% String cls = null; 
	    		if(type.equals("professionals")){ 
	    			 cls = "invisible";	
	    		} %>
	    	<div class="collapse navbar-collapse" id="navbarText">
	      		
	      		<ul class="navbar-nav mx-auto mb-2 mb-lg-0 <%= cls %>">
	        		<li class="nav-item">
	          			<a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
	        		</li>
	       			<li class="nav-item">
	          			<a class="nav-link" href="servicePage.html">Services</a>
	       	 		</li>
	        		<li class="nav-item">
	          			<a class="nav-link" href="about_us.html">About us</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link" href="Contact_us.jsp">Contact us</a>
	        		</li>
	      		</ul>
	      		
	      		<span class="navbar-text">
	      			<a href="LogOut" type="button" class="btn btn-dark" id="logOutButton" style="color:white">Log Out</a>
	      			<a href="Dashboard" type="button"  id="logOutButton" style="color:white"> <img src="./ImagePutter" class=" user-img-top rounded-circle img-fluid" style="height: 50px; width: 50px;"></a>
	      			
	      		</span>
	    	</div>
	  	</div>
	</nav>
   <%} 
		else{
   %>
	<nav class="navbar navbar-expand-lg white px-4 fixed-top">
	  	<div class="container-fluid">
	   			<a class="navbar-brand" href="index.html"><img src="images/Logo.svg" class="logo"></a>
	    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	      		<span class="navbar-toggler-icon"></span>
	    		</button>
	    	<div class="collapse navbar-collapse" id="navbarText">
	      		<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
	        		<li class="nav-item">
	          			<a class="nav-link active" aria-current="page" href="index.html">Home</a>
	        		</li>
	       			<li class="nav-item">
	          			<a class="nav-link" href="servicePage.html">Services</a>
	       	 		</li>
	        		<li class="nav-item">
	          			<a class="nav-link" href="about_us.html">About us</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link" href="Contact_us.jsp">Contact us</a>
	        		</li>
	      		</ul>
	      		<span class="navbar-text">
	      			<button type="button" class="btn btn-dark" id="loginButton">Login</button>
	        		<button type="button" class="btn btn-warning" id="signupButton">Signup</button>
	      		</span>
	    	</div>
	  	</div>
	</nav>
	<% }%>