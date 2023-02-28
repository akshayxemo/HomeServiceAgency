package com.hsa.authentication;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.hsa.connection.util.DbConnection;
import com.hsa.security.Encryption;
import com.hsa.security.IsExisting;

/**
 * Servlet implementation class UserSignup
 */
@WebServlet("/UserSignup")
@MultipartConfig(maxFileSize = 16177216) // upto 16 MB
public class UserSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		InputStream Image = null;
		Part filePart = null;
		String Name = null;
		String Address = null;
		String Email = null;
		String Phone = null;
		String AltPhone = null;
		String Gender = null;
		String Password = null;
		
		String sqlQuery = "insert into users(Name,Email,Address,Phone,AltPhone,Gender,Image,Password,Status) values (?,?,?,?,?,?,?,?,?)";
		try {
			
			filePart = request.getPart("UImage"); 
			
			Image = filePart.getInputStream(); 
			
			Name = request.getParameter("UName");
			Address = request.getParameter("UAddress");
			Email = request.getParameter("UEmail").toLowerCase();
			Phone = request.getParameter("Phone");
			AltPhone = request.getParameter("AltPhone");
			Gender = request.getParameter("inlineRadioOptions");
			Password = request.getParameter("Password");
			
			boolean existingUser = IsExisting.checkRedundentUser("users", Email);
			String getEmailForPhone = IsExisting.checkPhone("users", Phone);
			if(existingUser) {
				pw.println("<div style='background-color:red; color:white; text-align:center; padding:10px 0px'>Email id Already Registerd</div>");
				request.getRequestDispatcher("SignUpProcurer.html").include(request, response);
			}
			else if(getEmailForPhone != null) {
				pw.println("<div style='background-color:red; color:white; text-align:center; padding:10px 0px'>This Phone number is Already Registerd</div>");
				request.getRequestDispatcher("SignUpProcurer.html").include(request, response);
			}
			else {
				Connection con = DbConnection.getConnection();
				PreparedStatement pstm = con.prepareStatement(sqlQuery);
				pstm.setString(1, Name);
				pstm.setString(2, Email);
				pstm.setString(3, Address);
				pstm.setString(4, Phone);
				pstm.setString(5, AltPhone);
				pstm.setString(6, Gender);
				pstm.setBlob(7, Image);
				pstm.setString(8, Encryption.toHexString(Encryption.getSHA(Password)));
				pstm.setString(9, "safe");
				pstm.executeUpdate();
				request.setAttribute("Name", Name);
				request.getRequestDispatcher("SuccessPage.jsp").include(request, response);
				//pw.println("Successfully registerd");
				con.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
