package com.hsa.generic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;

/**
 * Servlet implementation class GotoContactUs
 */
@WebServlet("/GotoContactUs")
public class GotoContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String id = null;
		String type = null;
		String sqlQuery = null;
		boolean cookie1 = false;
		boolean cookie2 = false;
		String msg = null;
		
		Cookie ck[] = request.getCookies();
		if(ck!=null) {
		    for (Cookie cookie : ck) {
		      if(cookie.getName().equals("id")) {
		    	  id = cookie.getValue();
		    	  cookie1 = true;
		      }
		      if(cookie.getName().equals("userType")) {
		    	  type = cookie.getValue();
		    	  cookie2 = true;
			  }
		    }
		  }
		if(cookie1 && cookie2) {
			try {
				if(type.equals("users")) {
					Connection con = DbConnection.getConnection();
					PreparedStatement pstm = null;
					ResultSet rs =  null;
					sqlQuery = "select Message from feedback where Uid = "+id;
					pstm = con.prepareStatement(sqlQuery);
					rs = pstm.executeQuery();
					if(rs.next()) {
						msg = rs.getString("Message");
						
						request.setAttribute("feedMsg",msg);
						request.setAttribute("isExist", "your already gave your feedback. Want to update it !!");
						request.setAttribute("action","Update");
						request.setAttribute("Display", "enabled");
						request.getRequestDispatcher("Contact_us.jsp").include(request, response);
					}
					else {
						request.setAttribute("feedMsg",msg);
						request.setAttribute("isExist", null);
						request.setAttribute("action","Submit");
						request.setAttribute("Display", "enabled");
						request.getRequestDispatcher("Contact_us.jsp").include(request, response);
					}
				}
				else {
					request.setAttribute("feedMsg",msg);
					request.setAttribute("isExist", null);
					request.setAttribute("action","NoAction");
					request.setAttribute("Display", "disabled");
					request.getRequestDispatcher("Contact_us.jsp").include(request, response);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("feedMsg",msg);
			request.setAttribute("isExist", null);
			request.setAttribute("action","Submit");
			request.setAttribute("Display", "enabled");
			request.getRequestDispatcher("Contact_us.jsp").include(request, response);
		}
	}

}
