package com.hsa.generic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;
import com.hsa.data.Professional;
import com.hsa.data.SubService;

/**
 * Servlet implementation class Booking
 */
@WebServlet("/Booking")
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = null;
		String type = null;
		String sqlQuery = null;
		boolean cookie1 = false;
		boolean cookie2 = false;
		String message = null;
		String profId = request.getParameter("Service_id");
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		Professional pro = null;
		List<SubService> subService = new ArrayList<>();
		PrintWriter pw = response.getWriter();
		
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
				pro = getProf(Integer.parseInt(profId));
				pw.println("Pro : " + pro.toString());
				String query = "select Sid, S_name, Price from sub_services where Cid = " + pro.getServiceId();
				Connection conn = DbConnection.getConnection();
				PreparedStatement pstm = conn.prepareStatement(query);
				ResultSet rs = null;
				rs = pstm.executeQuery();
				while(rs.next()) {
					int sId = rs.getInt("Sid");
					String sName = rs.getString("S_name");
					int price = rs.getInt("Price");
					SubService tempService = new SubService(sId, sName, price);
					subService.add(tempService);
				}
				request.setAttribute("services",subService);
				request.setAttribute("profInfo", pro);
				request.getRequestDispatcher("Booking.jsp").forward(request, response);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("userVarify", false);
			request.setAttribute("errorMsg","Please login first before booking");
			request.getRequestDispatcher("loginSignup.jsp").forward(request, response);
		}
	}
	
	private Professional getProf(int Pid) throws SQLException {
		String query = "select Name, Email, Rating, Gender, Service_id from professionals where Pid = " + Pid;
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		ResultSet rs = null;
		String Name = null;
		String Email = null;
		int Rating = 0;
		String Gender = null;
		int ServiceId = 0;
		rs = pstm.executeQuery();
		
		if(rs.next()) {
			Name = rs.getString("Name");
			Email = rs.getString("Email");
			Rating = rs.getInt("Rating");
			Gender = rs.getString("Gender");
			ServiceId = rs.getInt("Service_id");
		}
		Professional prof = new Professional(Pid, Name, Email, Rating, Gender, ServiceId);
		conn.close();
		return prof;
		
	}

}
