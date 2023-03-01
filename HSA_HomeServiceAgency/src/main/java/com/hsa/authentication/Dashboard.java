package com.hsa.authentication;

import java.io.IOException;
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
import com.hsa.data.BDetails;
import com.hsa.data.Professional;
import com.hsa.data.ServiceDetails;
import com.hsa.data.SubService;
import com.hsa.data.User;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// Set refresh, autoload time as 1 seconds
        //response.setIntHeader("Refresh", 60);
        
		response.setContentType("text/html");
		//PrintWriter pw = response.getWriter();
		String id = null;
		String type = null;
		String sqlQuery = null;
		boolean cookie1 = false;
		boolean cookie2 = false;
		String Name = null;
		String rating = null;
		List<BDetails> bookings = new ArrayList<>();
		List<SubService> services = new ArrayList<>();
		
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
		
		if(cookie1 && cookie2 ) {
			if(type.equals("Admin") && id.equals("0X")) {
				request.getRequestDispatcher("./Admin").forward(request, response);
			}
			else {
				try {
					Connection conn = DbConnection.getConnection();
					ResultSet result = null;
					PreparedStatement pstm = null;
					if(type.equals("professionals")) {
						sqlQuery = "select Name, Rating from "+ type +" where Pid = '"+id+"'";
						pstm = conn.prepareStatement(sqlQuery);
						result = pstm.executeQuery();
						if(result.next()) {
							Name = result.getString("Name");
							rating = result.getString("Rating");
						}
						sqlQuery = "select Bid,Uid,Pid,B_date,B_time,Date,Time,TotalAmmount,Status,U_status,P_status,St_date,St_time,Rating from bookings where Pid = "+id +" order by Bid DESC";
						pstm = conn.prepareStatement(sqlQuery);
						ResultSet rs = pstm.executeQuery();
						while(rs.next()) {
							int bid = rs.getInt("Bid");
							int uid = rs.getInt("Uid");
							int pid = rs.getInt("Pid");
							String bDate = rs.getString("B_date");
							String bTime = rs.getString("B_time");
							String date = rs.getString("Date");
							String time = rs.getString("Time");
							int ammount = rs.getInt("TotalAmmount");
							String status = rs.getString("Status");
							String uStatus = rs.getString("U_status");
							String pStatus = rs.getString("P_status");
							String stDate = rs.getString("St_date");
							String stTime = rs.getString("St_time");
							int rate = rs.getInt("Rating");
							User user = getUser(uid);
							String reportAgainst = isReported(bid,type);
							boolean isReported = false;
							if(reportAgainst!= null) {
								isReported = true;
							}
							services = ServiceDetails.getDetail(bid);
							BDetails temp = new BDetails(bid,uid,pid,bDate,bTime,date,time,ammount,status,uStatus,pStatus,stDate,stTime,user,services,rate,isReported,reportAgainst);
							bookings.add(temp);
						}
					}
					else if(type.equals("users")) {
						sqlQuery = "select Name from "+ type +" where Uid = '"+id+"'";
						pstm = conn.prepareStatement(sqlQuery);
						result = pstm.executeQuery();
						if(result.next()) {
							Name = result.getString("Name");
							rating = null;
						}
						sqlQuery = "select Bid,Uid,Pid,B_date,B_time,Date,Time,TotalAmmount,Status,U_status,P_status,St_date,St_time,Rating from bookings where Uid = "+id +" order by Bid DESC";
						pstm = conn.prepareStatement(sqlQuery);
						ResultSet rs = pstm.executeQuery();
						while(rs.next()) {
							int bid = rs.getInt("Bid");
							int uid = rs.getInt("Uid");
							int pid = rs.getInt("Pid");
							String bDate = rs.getString("B_date");
							String bTime = rs.getString("B_time");
							String date = rs.getString("Date");
							String time = rs.getString("Time");
							int ammount = rs.getInt("TotalAmmount");
							String status = rs.getString("Status");
							String uStatus = rs.getString("U_status");
							String pStatus = rs.getString("P_status");
							String stDate = rs.getString("St_date");
							String stTime = rs.getString("St_time");
							int rate = rs.getInt("Rating");
							Professional prof = getProf(pid);
							String reportAgainst = isReported(bid,type);
							boolean isReported = false;
							if(reportAgainst!= null) {
								isReported = true;
							}
							services = ServiceDetails.getDetail(bid);
							BDetails temp = new BDetails(bid,uid,pid,bDate,bTime,date,time,ammount,status,uStatus,pStatus,stDate,stTime,prof,services,rate,isReported,reportAgainst);
							bookings.add(temp);
						}
					}
					conn.close();
					
					request.setAttribute("usertype", type);
					request.setAttribute("userName", Name);
					request.setAttribute("rate", rating);
					request.setAttribute("bookings",bookings);
					request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		else {
			request.setAttribute("userVarify", false);
			request.setAttribute("errorMsg","You Logged Out!! Please Login again");
			request.getRequestDispatcher("loginSignup.jsp").forward(request, response);
		}
	}
	private String isReported(int id, String type) throws SQLException {
		String query = "select Rid, AgainstType from report where Bid = " + id;
		
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		ResultSet rs = null;
		rs = pstm.executeQuery();
		if(rs.next()) {
			String AgainstType = rs.getString("AgainstType");
			conn.close();
			return AgainstType;
		}
		conn.close();
		return null;
	}
	private Professional getProf(int Pid) throws SQLException {
		String query = "select Name, Email, Service_id, Rating, Gender, Phone, AltPhone from professionals where Pid = " + Pid;
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		ResultSet rs = null;
		String Name = null;
		String Email = null;
		int Rating = 0;
		String Gender = null;
		String Phone = null;
		String AltPhone = null;
		String serviceId = null;
		rs = pstm.executeQuery();
		
		if(rs.next()) {
			Name = rs.getString("Name");
			Email = rs.getString("Email");
			Rating = rs.getInt("Rating");
			Gender = rs.getString("Gender");
			Phone = rs.getString("Phone");
			AltPhone = rs.getString("AltPhone");
			serviceId = rs.getString("Service_id");
		}
		
		query = "select C_name from service_catagory where Cid = " + serviceId  ;
		PreparedStatement pstm2 = conn.prepareStatement(query);
		ResultSet rs2 = null;
		rs2 = pstm2.executeQuery();
		String service_name = null;
		if(rs2.next()) {
			service_name = rs2.getString("C_name");
		}
		
		Professional prof = new Professional(Pid, Name, Email, Rating, Gender, Phone, AltPhone,service_name);
		conn.close();
		return prof;
		
	}
	private User getUser(int Uid) throws SQLException {
		String query = "select Name, Email, Address, Phone, AltPhone, Gender from users where Uid = " + Uid;
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		ResultSet rs = null;
		String Name = null;
		String Email = null;
		String Address = null;
		String Phone = null;
		String AltPhone = null;
		String Gender = null;
		
		rs = pstm.executeQuery();
		
		if(rs.next()) {
			Name = rs.getString("Name");
			Email = rs.getString("Email");
			Address = rs.getString("Address");
			Phone = rs.getString("Phone");
			AltPhone = rs.getString("AltPhone");
			Gender = rs.getString("Gender");
		}
		User user = new User(Uid, Name, Email, Address, Phone, AltPhone, Gender);
		conn.close();
		return user;
		
	}

}
