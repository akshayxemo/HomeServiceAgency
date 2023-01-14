package com.hsa.authentication;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Dashboard
 */
@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// Set refresh, autoload time as 1 seconds
        response.setIntHeader("Refresh", 60);
        
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		pw.println("hoho");
		String id = null;
		String type = null;
		String sqlQuery = null;
		boolean cookie1 = false;
		boolean cookie2 = false;
		
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
		
		if(cookie1 && cookie2 ) {
			pw.println("User Logged In "+id+" "+type);
			try {
				Connection conn = DbConnection.getConnection();
				ResultSet result = null;
				if(type == "professionals") {
					sqlQuery = "select Name from "+ type +" where Pid = '"+id+"'";
				}
				else {
					sqlQuery = "select Name from "+ type +" where Uid = '"+id+"'";
				}
				PreparedStatement pstm = conn.prepareStatement(sqlQuery);
				result = pstm.executeQuery();
				if(result.next()) {
					request.setAttribute("userName", result.getString(1));
					request.getRequestDispatcher("userDashboard.jsp").forward(request, response);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("userVarify", false);
			request.setAttribute("errorMsg","Service time Out Login again");
			request.getRequestDispatcher("loginSignup.jsp").forward(request, response);
		}
	}

}
