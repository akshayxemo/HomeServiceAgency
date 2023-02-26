package com.hsa.authentication;

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
import com.hsa.data.AdminData;
import com.hsa.security.Encryption;
import com.hsa.security.IsExisting;

/**
 * Servlet implementation class AccountLogin
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		String Email = null;
		String Table = null;
		String Password = null;
		String sqlQuery = null;
		String hashPass = null;
		String id = null;
		boolean existingUser = true;
		
		try {
			Email = request.getParameter("Email").toLowerCase();
			Table = request.getParameter("AccountType");
			Password = request.getParameter("Password");
			hashPass = Encryption.toHexString(Encryption.getSHA(Password));
			if(Table.equals("Admin")) {
				boolean checkAdmin = AdminData.checkAdminPassword(Password, Email);
				if(checkAdmin) {
					id = "0X";
					Cookie cookie1 = new Cookie("id",id);
					//cookie1.setMaxAge(60);
					response.addCookie(cookie1);
					Cookie cookie2 = new Cookie("userType","Admin");
					//cookie2.setMaxAge(60);
					response.addCookie(cookie2);
					response.sendRedirect("./Dashboard");
				}
				else {
					request.setAttribute("userVarify", false);
					request.setAttribute("errorMsg","Invalid Password, Please login again !");
					request.getRequestDispatcher("loginSignup.jsp").include(request, response);
				}
			}
			existingUser = IsExisting.checkRedundentUser(Table, Email);
			if(!existingUser) {
				request.setAttribute("userVarify", existingUser);
				request.setAttribute("errorMsg","This Email id is not registered");
				request.getRequestDispatcher("loginSignup.jsp").include(request, response);
			}
			else {
					Connection conn = DbConnection.getConnection();
					ResultSet result = null;
					if(Table.equals("professionals")) {
						sqlQuery = "select Pid, Status from "+Table+" where Email = '"+Email+"' And Password = '"+hashPass+"'" ;
					}
					else {
						sqlQuery = "select Uid, Status from "+Table+" where Email = '"+Email+"' And Password = '"+hashPass+"'" ;
					}
					
					PreparedStatement pstm = conn.prepareStatement(sqlQuery);
					result = pstm.executeQuery();
					if(result.next()) {
						String Status = result.getString("Status");
						if(Status.equals("safe")) {
							id = result.getString(1);
							Cookie cookie1 = new Cookie("id",id);
							//cookie1.setMaxAge(60);
							response.addCookie(cookie1);
							Cookie cookie2 = new Cookie("userType",Table);
							//cookie2.setMaxAge(60);
							response.addCookie(cookie2);
							response.sendRedirect("./Dashboard");
						}
						else {
							request.setAttribute("userVarify", false);
							request.setAttribute("errorMsg","Sorry Your Account id is been BANNED");
							request.getRequestDispatcher("loginSignup.jsp").include(request, response);
						}
					}
					else {
						request.setAttribute("userVarify", false);
						request.setAttribute("errorMsg","Invalid Password, Please login again !");
						request.getRequestDispatcher("loginSignup.jsp").include(request, response);
					}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
