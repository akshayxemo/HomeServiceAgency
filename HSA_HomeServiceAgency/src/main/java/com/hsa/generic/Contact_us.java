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
    	        
    			response.setContentType("text/html");
    			String action = request.getParameter("action");
    			switch(action) {
    			case "Submit":
    				try {
						submitFeedback(request,response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
    				break;
    			case "Update":
    				try {
						updateFeedback(request,response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
    				break;
    			case "NoAction":
    				request.setAttribute("userVarify", false);
    				request.setAttribute("errorMsg","Professionals cannot give feedback !");
    				request.getRequestDispatcher("Contact_us.jsp").forward(request, response);
    				break;
    			default:
    				try {
						submitFeedback(request,response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
    				break;
    			}
    }
    
    
    public void updateFeedback(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	String id = null;
		String type = null;
		String sqlQuery = null;
		boolean cookie1 = false;
		boolean cookie2 = false;
		String message = null;
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
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
				PreparedStatement pstm = null;
				if(type.equals("users")) {
					message = request.getParameter("fmessage");
					sqlQuery = "update feedback set Message = ?, F_date = ? where Uid = ?";
					pstm = conn.prepareStatement(sqlQuery);
					pstm.setString(1, message);
					pstm.setDate(2, sqlDate);
					pstm.setInt(3, Integer.parseInt(id));
					pstm.executeUpdate();
					
					conn.close();
					request.getRequestDispatcher("feedbackSuccess.jsp").forward(request, response);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
    }
    
    
    public void submitFeedback(HttpServletRequest request, HttpServletResponse response) throws Exception{
    	String id = null;
		String type = null;
		String sqlQuery = null;
		boolean cookie1 = false;
		boolean cookie2 = false;
		String message = null;
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		
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
				PreparedStatement pstm = null;
				
				if(type.equals("users")) {
					sqlQuery = "insert into feedback(Uid,Message,F_date)values(?,?,?)";
					message = request.getParameter("fmessage");
					
					pstm = conn.prepareStatement(sqlQuery);
					pstm.setInt(1, Integer.parseInt(id));
					pstm.setString(2, message);
					pstm.setDate(3, sqlDate);
					pstm.executeUpdate();
					
					conn.close();
					request.getRequestDispatcher("feedbackSuccess.jsp").forward(request, response);
				}
				
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


