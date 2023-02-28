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
 * Servlet implementation class ProfessionalSignup
 */
@WebServlet("/ProfessionalSignup")
@MultipartConfig(maxFileSize = 16177216) // upto 16 MB
public class ProfessionalSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ProfessionalSignup() {
        // TODO Auto-generated constructor stub
    }

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
		int ServiceId;
		int Rating = 0;
		
		String sqlQuery = "insert into professionals(Name,Email,Address,Phone,AltPhone,Gender,Service_id,Image,Password,Rating,Status) values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			
			filePart = request.getPart("PImage"); 
			
			Image = filePart.getInputStream(); 
			
			Name = request.getParameter("PName");
			Address = request.getParameter("PAddress");
			Email = request.getParameter("PEmail").toLowerCase();
			Phone = request.getParameter("Phone");
			AltPhone = request.getParameter("AltPhone");
			Gender = request.getParameter("inlineRadioOptions");
			Password = request.getParameter("Password");
			ServiceId = Integer.parseInt(request.getParameter("SelectService"));
			
			boolean existingUser = IsExisting.checkRedundentUser("professionals", Email);
			String getEmailForPhone = IsExisting.checkPhone("professionals", Phone);
			if(existingUser) {
				pw.println("<div style='background-color:red; color:white; text-align:center; padding:10px 0px'>Email id Already Registerd</div>");
				request.getRequestDispatcher("Signup(professional).html").include(request, response);
			}
			else if(getEmailForPhone != null) {
				pw.println("<div style='background-color:red; color:white; text-align:center; padding:10px 0px'>This Phone number is Already Registerd</div>");
				request.getRequestDispatcher("Signup(professional).html").include(request, response);
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
				pstm.setInt(7, ServiceId);
				pstm.setBlob(8, Image);
				pstm.setString(9, Encryption.toHexString(Encryption.getSHA(Password)));
				pstm.setInt(10, Rating);
				pstm.setString(11, "safe");
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
