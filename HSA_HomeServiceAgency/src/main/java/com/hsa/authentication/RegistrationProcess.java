package com.hsa.authentication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationProcess
 */
@WebServlet("/RegistrationProcess")
public class RegistrationProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type = null;
		boolean cookie1 = false;
		boolean cookie2 = false;
		
		Cookie ck[] = request.getCookies();
		if(ck!=null) {
		    for (Cookie cookie : ck) {
		      if(cookie.getName().equals("id")) {
		    	  cookie1 = true;
		      }
		      if(cookie.getName().equals("userType")) {
		    	  cookie2 = true;
			  }
		    }
		  }
		//System.out.println("cookie1: "+cookie1+" Cookie2: "+cookie2);
		if(cookie1 && cookie2) {
			response.sendRedirect("./Dashboard");
		}
		else {
			type = request.getParameter("type");
			if(type.equals("users")) {
				request.getRequestDispatcher("SignUpProcurer.html").forward(request, response);
			}
			else if(type.equals("professionals")) {
				request.getRequestDispatcher("Signup(professional).html").forward(request, response);
			}
		}
	}

}
