package com.hsa.generic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;

/**
 * Servlet implementation class Contact_us
 */
@WebServlet("/Contact_us")
public class Contact_us extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    			// TODO Auto-generated method stub
    			
    			// Set refresh, autoload time as 1 seconds
    	       
    	        
    			response.setContentType("text/html");
    			//PrintWriter pw = response.getWriter();
    			String id = null;
    			String type = null;
    			String sqlQuery = null;
    			boolean cookie1 = false;
    			boolean cookie2 = false;
    			String message = null;
    			//String name = null;
    			//String sqlQuery2 = null;
    			
    			
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
    				try {
    					Connection conn = DbConnection.getConnection();
    					//ResultSet result = null;
    					PreparedStatement pstm = null;
    					//PreparedStatement pstm1 = null;
    					if(type.equals("users")) {
    						sqlQuery = "insert into feedback(Uid,Message)values(?,?)";
    						//sqlQuery2 = "Select Name from " + type + "where Uid = " + id;
    						message = request.getParameter("fmessage");
    						//pstm1 = conn.prepareStatement(sqlQuery2); 
    						pstm = conn.prepareStatement(sqlQuery);
    						pstm.setInt(1, Integer.parseInt(id));
    						pstm.setString(2, message);
    						pstm.executeUpdate();
    						//result = pstm1.executeQuery();
    						//System.out.println("Executed.");
    						//if(result.next()) { name = result.getString("Name"); }
    					}
    					conn.close();
    					//result.close();
    					//request.setAttribute("UserName", name);
    					request.getRequestDispatcher("feedbackSuccess.jsp").forward(request, response);
    				}catch(Exception e) {
    					e.printStackTrace();
    				}
    			}
    			else {
    				request.setAttribute("userVarify", false);
    				request.setAttribute("errorMsg","Please LogIn First !");
    				request.getRequestDispatcher("loginSignup.jsp").forward(request, response);
    			}
    		}


	}


