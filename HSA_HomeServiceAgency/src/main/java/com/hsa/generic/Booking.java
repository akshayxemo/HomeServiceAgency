package com.hsa.generic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
		boolean cookie1 = false;
		boolean cookie2 = false;
		String profId = request.getParameter("Service_id");
		Professional pro = null;
		List<SubService> subService = new ArrayList<>();
		PrintWriter pw = response.getWriter();
		
		Cookie ck[] = request.getCookies();
		if(ck!=null) {
		    for (Cookie cookie : ck) {
		      if(cookie.getName().equals("id")) {
		    	  cookie1 = true;
		      }
		      if(cookie.getName().equals("userType")) {
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String id = null;
		String type = null;
		boolean cookie1 = false;
		boolean cookie2 = false;
		PrintWriter pw = response.getWriter();
		List<SubService> subService = new ArrayList<>();
		
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
			String[] services = request.getParameterValues("subService");
			String profId = request.getParameter("profId");
			String sTime = request.getParameter("sTime");
			String sDate = request.getParameter("sDate");
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			java.sql.Time sqlTime = new java.sql.Time(date.getTime());
			SubService sDetails = null;
			String status = "waiting";
			Professional pro = null;
			
			int totalPrice = 0;
			try {
				for(String s : services) {
					pw.println(s);
					sDetails = getDetails(Integer.parseInt(s));
					totalPrice += sDetails.getPrice();
					subService.add(sDetails);
				}
				pro = getProf(Integer.parseInt(profId));
				pw.println(" >>>> "+ profId +" >>>> "+ sTime +" >>>> "+ sDate +" >>>> "+ type +" >>>> "+ id +" >>>> "+ sqlDate +" >>>> "+ sqlTime);
				pw.println(subService);
				pw.println(totalPrice);
				
				String query = "insert into bookings(Uid,Pid,B_date,B_time,Date,Time,TotalAmmount,Status) values(?,?,?,?,?,?,?,?)";
				Connection conn = DbConnection.getConnection();
				PreparedStatement pstm = null;
				pstm = conn.prepareStatement(query);
				pstm.setInt(1, Integer.parseInt(id));
				pstm.setInt(2, Integer.parseInt(profId));
				pstm.setDate(3, sqlDate);
				pstm.setTime(4, sqlTime);
				pstm.setString(5, sDate);
				pstm.setString(6, sTime);
				pstm.setInt(7, totalPrice);
				pstm.setString(8, status);
				pw.println("pstm done");
				pstm.executeUpdate();
				pw.println("done");
				conn.close();
				int bid = fetchBookingId(Integer.parseInt(id),Integer.parseInt(profId),sqlDate.toString(),sqlTime.toString());
				pw.println(bid);
				boolean updateDesc = updateBookingDesc(bid,subService);
				if(updateDesc) {
					pw.println("COMPLETED");
				}
				request.setAttribute("profDetails", pro);
				request.setAttribute("services", subService);
				request.setAttribute("bookingDate", sqlDate);
				request.setAttribute("BookingTime", sqlTime);
				request.setAttribute("serviceDate", sDate);
				request.setAttribute("serviceTime", sTime);
				request.setAttribute("TotalPrice",totalPrice);
				request.getRequestDispatcher("BookingDetails.jsp").forward(request, response);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		else {
			request.setAttribute("userVarify", false);
			request.setAttribute("errorMsg","Please login first before booking");
			request.getRequestDispatcher("loginSignup.jsp").forward(request, response);
		}
	}
	private int fetchBookingId(int uid, int pid, String sqlDate, String sqlTime)throws SQLException {
		String query = "select Bid from bookings where Uid = "+uid+
				" and Pid = "+pid+" and B_date = '"+sqlDate+"' and B_time = '"+sqlTime+"'";
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		ResultSet rs = null;
		int bid = 0;
		rs = pstm.executeQuery();
		if(rs.next()) {
			bid = rs.getInt("Bid");
		}
		conn.close();
		return bid;
	}
	private boolean updateBookingDesc(int bid, List<SubService> subService) throws SQLException {
		String query = "insert into bookings_desc(Bid,Sid,S_name) values(?,?,?)";
		Connection conn = DbConnection.getConnection();
		//Statement stmt = conn.createStatement();
		PreparedStatement pstm = conn.prepareStatement(query);
		for(SubService temp : subService) {
			pstm.setInt(1, bid);
			pstm.setInt(2, temp.getSid());
			pstm.setString(3, temp.getSname());
			pstm.executeUpdate();
		}
		//stmt.executeBatch();
		conn.close();
		return true;
	}
	private SubService getDetails(int sid)throws SQLException {
		String query = "select S_name, Price from sub_services where Sid = " + sid;
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		ResultSet rs = null;
		rs = pstm.executeQuery();
		SubService sDetails = null;
		if(rs.next()) {
			sDetails = new SubService(sid,rs.getString("S_name"),rs.getInt("Price"));
		}
		conn.close();
		return sDetails;
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
