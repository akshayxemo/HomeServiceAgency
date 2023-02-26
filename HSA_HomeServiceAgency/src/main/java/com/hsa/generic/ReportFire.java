package com.hsa.generic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;

/**
 * Servlet implementation class ReportFire
 */
@WebServlet("/ReportFire")
public class ReportFire extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int fromId = 0;
		String fromType = null;
		Cookie ck[] =request.getCookies();
		if(ck != null) {
			for(Cookie c:ck) {
				if(c.getName().equals("id")) {
					fromId = Integer.parseInt(c.getValue());
				}
				if(c.getName().equals("userType")) {
					fromType = c.getValue();
				}
			}
		}
		
		String Message = request.getParameter("Message");
		String AgainstType = request.getParameter("type");
		int bookingId = Integer.parseInt(request.getParameter("bid"));
		int ToId = Integer.parseInt(request.getParameter("id"));
		String query = null;
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement pstm =  null;
			
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			java.sql.Time sqlTime = new java.sql.Time(date.getTime());
			DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
			DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss"); 
			String strDate = dateFormat.format(sqlDate); 
			String strTime = timeFormat.format(sqlTime);
			
			if(fromType.equals("users")) {
				query = "INSERT INTO report (Bid,Uid,Pid,Message,AgainstType,Date,Time,Seen,Action) values(?,?,?,?,?,?,?,?,?)";
				pstm = con.prepareStatement(query);
				pstm.setInt(1, bookingId);
				pstm.setInt(2, fromId);
				pstm.setInt(3, ToId);
				pstm.setString(4, Message);
				pstm.setString(5, AgainstType);
				pstm.setString(6, strDate);
				pstm.setString(7, strTime);
				pstm.setString(8, "false");
				pstm.setString(9, "none");
			}
			else {
				query = "INSERT INTO report (Bid,Uid,Pid,Message,AgainstType,Date,Time,Seen,Action) values(?,?,?,?,?,?,?,?,?)";
				pstm = con.prepareStatement(query);
				pstm.setInt(1, bookingId);
				pstm.setInt(2, ToId);
				pstm.setInt(3, fromId);
				pstm.setString(4, Message);
				pstm.setString(5, AgainstType);
				pstm.setString(6, strDate);
				pstm.setString(7, strTime);
				pstm.setString(8, "false");
				pstm.setString(9, "none");
			}
			pstm.executeUpdate();
			response.sendRedirect("./Dashboard");
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
