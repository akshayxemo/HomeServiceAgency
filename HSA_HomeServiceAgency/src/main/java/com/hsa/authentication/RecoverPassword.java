package com.hsa.authentication;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.security.IsExisting;

/**
 * Servlet implementation class RecoverPassword
 */
@WebServlet("/RecoverPassword")
public class RecoverPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Email  =  request.getParameter("Email").toLowerCase();
		String Phone  =  request.getParameter("Phone");
		String Table = request.getParameter("AccountType");
		
		try {
			boolean existingUser =true;
			existingUser = IsExisting.checkRedundentUser(Table, Email);
			//System.out.println(Table);
			String getEmailForPhone = IsExisting.checkPhone(Table, Phone);
			if(!existingUser) {
				request.setAttribute("userVarify", existingUser);
				request.setAttribute("errorMsg","This Email id is not registered");
				request.getRequestDispatcher("forgetPassword.jsp").include(request, response);
			}
			else {
				if(getEmailForPhone.equals(Email)) {
					int Id =  IsExisting.getId(Table, Phone);
					//System.out.println(Id);
					request.setAttribute("id", Id);
					request.setAttribute("type", Table);
					request.getRequestDispatcher("forgetPassword.jsp").include(request, response);
				}
				else {
					request.setAttribute("userVarify", false);
					request.setAttribute("errorMsg","The Phone no. is not registered for this email");
					request.getRequestDispatcher("forgetPassword.jsp").include(request, response);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}

}
