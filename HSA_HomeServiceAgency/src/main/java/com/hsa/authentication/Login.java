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
		PrintWriter pw = response.getWriter();
		pw.println("hehe");
		
		String Email = null;
		String Table = null;
		String Password = null;
		String sqlQuery = null;
		String hashPass = null;
		String id = null;
		boolean existingUser = true;
		
		try {
			Email = request.getParameter("Email");
			Table = request.getParameter("AccountType");
			Password = request.getParameter("Password");
			hashPass = Encryption.toHexString(Encryption.getSHA(Password));
			existingUser = IsExisting.checkRedundentUser(Table, Email);
			if(!existingUser) {
				pw.println(existingUser);
				request.setAttribute("userVarify", existingUser);
				request.setAttribute("errorMsg","This Email id is not registered");
				request.getRequestDispatcher("loginSignup.jsp").include(request, response);
			}
			/*else if(!validatePassword(Table,hashPass, Email)) {
				request.setAttribute("userVarify", false);
				request.setAttribute("errorMsg","Incorrect Password");
				request.getRequestDispatcher("loginSignup.jsp").include(request, response);
			}*/
			else {
				Connection conn = DbConnection.getConnection();
				ResultSet result = null;
				
				if(Table == "professionals") {
					sqlQuery = "select Pid from "+Table+" where Email = '"+Email+"' And Password = '"+hashPass+"'" ;
				}
				else {
					sqlQuery = "select Uid from "+Table+" where Email = '"+Email+"' And Password = '"+hashPass+"'" ;
				}
				
				PreparedStatement pstm = conn.prepareStatement(sqlQuery);
				result = pstm.executeQuery();
				
				if(result.next()) {
					id = result.getString(1);
					Cookie cookie1 = new Cookie("id",id);
					cookie1.setMaxAge(60);
					response.addCookie(cookie1);
					Cookie cookie2 = new Cookie("userType",Table);
					cookie2.setMaxAge(60);
					response.addCookie(cookie2);
					pw.println("hmmm");
					//doGet(request,response);
					//request.getRequestDispatcher("Dashboard.jsp").include(request,response);
					//response.sendRedirect("Dashboard.jsp");
					response.sendRedirect("./Dashboard");
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
	/*private static boolean validatePassword(String table, String password, String email )throws SQLException {
		Connection con=null;
		ResultSet rs = null;
		String pass = null;
		try {
			con = DbConnection.getConnection();
			String sqlQuery2 = "select Password from "+table+" where Email = '"+email+"'" ;
			PreparedStatement pstm = con.prepareStatement(sqlQuery2);
			rs = pstm.executeQuery();
			if(rs.next()) {
				pass = rs.getString("Password");
				con.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(password.equals(pass)) {
			return true;
		}
		else {
			return false;
		}
	}*/

}
