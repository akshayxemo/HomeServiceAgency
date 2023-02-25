package com.hsa.generic;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.hsa.connection.util.DbConnection;
import com.hsa.data.Professional;
import com.hsa.data.User;
import com.hsa.security.Encryption;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
@MultipartConfig(maxFileSize = 16177216) // upto 16 MB
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		//PrintWriter pw = response.getWriter();
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
		if(cookie1 && cookie2) {
			try {
				Connection con = DbConnection.getConnection();
				PreparedStatement pstm = null;
				ResultSet rs = null;
				if(type.equals("users")) {
					User user = null;
					sqlQuery = "Select Name, Email, Address, Phone, AltPhone, Gender from users where Uid = "+id;
					pstm = con.prepareStatement(sqlQuery);
					rs = pstm.executeQuery();
					if(rs.next()) {
						String Name = rs.getString("Name");
						String Email = rs.getString("Email");
						String Address = rs.getString("Address");
						String Phone  = rs.getString("Phone");
						String AltPh = rs.getString("AltPhone");
						String Gender = rs.getString("Gender");
						user = new User(Integer.parseInt(id),Name,Email,Address,Phone,AltPh,Gender);
					}
					request.setAttribute("profile", user);
					request.setAttribute("type", type);
					request.getRequestDispatcher("editProfile.jsp").forward(request, response);
				}else {
					Professional prof = null;
					sqlQuery = "Select Name, Email, Address, Phone, AltPhone, Gender from professionals where Pid = "+id;
					pstm = con.prepareStatement(sqlQuery);
					rs = pstm.executeQuery();
					if(rs.next()) {
						String Name = rs.getString("Name");
						String Email = rs.getString("Email");
						String Address = rs.getString("Address");
						String Phone  = rs.getString("Phone");
						String AltPh = rs.getString("AltPhone");
						String Gender = rs.getString("Gender");
						prof = new Professional(Integer.parseInt(id),Name,Email,Gender,Phone,AltPh,Address);
					}
					request.setAttribute("profile", prof);
					request.setAttribute("type", type);
					request.getRequestDispatcher("editProfile.jsp").forward(request, response);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("userVarify", false);
			request.setAttribute("errorMsg","You Logged Out!! Please Login First");
			request.getRequestDispatcher("loginSignup.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		Part filePart = null;
		InputStream Image = null;
		String action = null;
		String type = null;
		String id = null;
		int update = 0;
		
		action = request.getParameter("action");
		type = request.getParameter("type");
		id = request.getParameter("id");
		System.out.print("action : "+action+" type : "+type+" id : "+id+" huuuu ");
		try {
			switch(action) {
			case "imageChange":
				filePart = request.getPart("image");
				Image = filePart.getInputStream();
				changeImage(Integer.parseInt(id),Image,type);
				break;
			case "passwordChange":
				String oldPass = request.getParameter("Password");
				String newPass = request.getParameter("Npassword");
				update = changePassword(Integer.parseInt(id), Encryption.toHexString(Encryption.getSHA(oldPass)), Encryption.toHexString(Encryption.getSHA(newPass)),type);
				if(update == 0) {
					request.setAttribute("msg", "Password is wrong");
					request.getRequestDispatcher("SettingError.jsp").forward(request, response);
				}
				else {
					request.setAttribute("msg", "Passsword successfully changed");
					request.getRequestDispatcher("SettingSuccess.jsp").forward(request, response);
				}
				break;
			case "recoverPassword":
				String newPass2 = request.getParameter("Npassword");
				update = recoverPassword(Integer.parseInt(id), Encryption.toHexString(Encryption.getSHA(newPass2)),type);
				if(update == 0) {
					request.setAttribute("msg", "Password is wrong");
					request.getRequestDispatcher("SettingError.jsp").forward(request, response);
				}
				else {
					request.setAttribute("msg", "Passsword successfully changed");
					request.getRequestDispatcher("SettingSuccess.jsp").forward(request, response);
				}
				break;
			case "generalChange":
				String name = request.getParameter("Name");
				String email = request.getParameter("Email");
				String phone = request.getParameter("Phone");
				String altPh = request.getParameter("AltPhone");
				String address = request.getParameter("Address");
				String pass = request.getParameter("Password");
				update = 0;
				update = updateDetails(Integer.parseInt(id), type, name, email, phone, altPh, address, Encryption.toHexString(Encryption.getSHA(pass)));
				if(update == 0) {
					request.setAttribute("msg", "Password is wrong");
					request.getRequestDispatcher("SettingError.jsp").forward(request, response);
				}
				else {
					request.setAttribute("msg", "Profile details changed successfully");
					request.getRequestDispatcher("SettingSuccess.jsp").forward(request, response);
				}
				break;
			default:
				doGet(request, response);
				break;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}
	private int recoverPassword(int id, String newPass, String type) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = null;
		int i = 0;
		if(type.equals("users")) {
			query = "update users set Password = ? where Uid = ?";
		}
		else {
			query = "update professionals set Password = ? where Pid = ?";
		}
		pstm = con.prepareStatement(query);
		pstm.setString(1, newPass);
		pstm.setInt(2, id);
		i = pstm.executeUpdate();
		return i;
	}
	private int changePassword(int id, String oldPass, String newPass, String type) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = null;
		int i = 0;
		if(type.equals("users")) {
			query = "update users set Password = ? where Uid = ? and Password = ?";
		}
		else {
			query = "update professionals set Password = ? where Pid = ? and Password = ?";
		}
		pstm = con.prepareStatement(query);
		pstm.setString(1, newPass);
		pstm.setInt(2, id);
		pstm.setString(3, oldPass);
		i = pstm.executeUpdate();
		return i;
	}
	private void changeImage(int id, InputStream img, String type) throws SQLException{
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = null;
		if(type.equals("users")) {
			query = "update users set Image = ? where Uid = ?";
		}
		else {
			query = "update professionals set Image = ? where Pid = ?";
		}
		pstm = con.prepareStatement(query);
		pstm.setBlob(1, img);
		pstm.setInt(2, id);
		pstm.executeUpdate();
	}
	private int updateDetails(int id, String type, String name, String email, String phone, String altph, String address, String pass)throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = null;
		int i = 0;
		if(type.equals("users")) {
			query = "update users set Name = ?, Email = ?, Phone = ?, AltPhone = ?, Address = ? where Uid = ? and Password = ?";
		}
		else {
			query = "update professionals set Name = ?, Email = ?, Phone = ?, AltPhone = ?, Address = ? where Pid = ? and Password = ?";
		}
		pstm = con.prepareStatement(query);
		pstm.setString(1, name);
		pstm.setString(2,email);
		pstm.setString(3,phone);
		pstm.setString(4,altph);
		pstm.setString(5,address);
		pstm.setInt(6, id);
		pstm.setString(7,pass);
		i = pstm.executeUpdate();
		return i;
	}

}
