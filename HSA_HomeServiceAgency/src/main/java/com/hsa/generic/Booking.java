package com.hsa.generic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;
import com.hsa.data.BDetails;
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
				
				query = "select C_name from service_catagory where Cid = " + pro.getServiceId();
				PreparedStatement pstm2 = conn.prepareStatement(query);
				ResultSet rs2 = null;
				rs2 = pstm2.executeQuery();
				String service_name = null;
				if(rs2.next()) {
					service_name = rs2.getString("C_name");
				}
				
				request.setAttribute("ServiceName", service_name);
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
			String service_name = request.getParameter("ServiceName");
			String[] services = request.getParameterValues("subService");
			String profId = request.getParameter("profId");
			String sTime = request.getParameter("sTime");
			String sDate = request.getParameter("sDate");
			java.util.Date date = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			java.sql.Time sqlTime = new java.sql.Time(date.getTime());
			DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
			DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss"); 
			String strDate = dateFormat.format(sqlDate); 
			String strTime = timeFormat.format(sqlTime); 
			
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
				
				String query = "insert into bookings(Uid,Pid,B_date,B_time,Date,Time,TotalAmmount,Status,U_status,P_status,Rating) values(?,?,?,?,?,?,?,?,?,?,?)";
				Connection conn = DbConnection.getConnection();
				PreparedStatement pstm = null;
				pstm = conn.prepareStatement(query);
				pstm.setInt(1, Integer.parseInt(id));
				pstm.setInt(2, Integer.parseInt(profId));
				pstm.setString(3, strDate);
				pstm.setString(4, strTime);
				pstm.setString(5, sDate);
				pstm.setString(6, sTime);
				pstm.setInt(7, totalPrice);
				pstm.setString(8, status);
				pstm.setString(9, "accepted");
				pstm.setString(10, status);
				pstm.setInt(11, 0);
				pw.println("pstm done");
				pstm.executeUpdate();
				pw.println("done");
				conn.close();
				//BDetails bDetails = new BDetails(sqlDate.toString(),sqlTime.toString(),sDate,sTime,totalPrice);
				BDetails bDetails = new BDetails(Integer.parseInt(id),Integer.parseInt(profId),strDate,strTime,sDate,sTime,totalPrice,status);
				ServletContext context=getServletContext();
				context.setAttribute("ServiceName", service_name);
				context.setAttribute("profDetails", pro);
				context.setAttribute("services", subService);
				context.setAttribute("bDetails", bDetails);
				response.sendRedirect("BookingDesc");
				
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
