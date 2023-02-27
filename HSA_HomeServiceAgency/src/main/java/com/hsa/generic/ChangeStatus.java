package com.hsa.generic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;
import com.hsa.security.PasswordMatch;

/**
 * Servlet implementation class ChangeStatus
 */
@WebServlet("/ChangeStatus")
public class ChangeStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//PrintWriter pw = response.getWriter();
		String status = request.getParameter("status");
		int bid = Integer.parseInt(request.getParameter("bid"));
		String type = null;
		String ckStat = null;
		type = request.getParameter("type");
		System.out.println("Heyyyyyyy "+status+","+type+","+bid);
		try {
			switch(status) {
				case "reject":
					ckStat = returnStatus(bid);
					if(!ckStat.equals("accepted")) {
						rejectStatus(bid,type);
					}
					break;
				case "accept":
					ckStat = returnStatus(bid);
					if(!ckStat.equals("rejected")) {
						acceptStatus(bid);
					}
					break;
				case "complete":
					int pid = 0;
					if(type.equals("professionals")) {
						Cookie ck[] =request.getCookies();
						if(ck != null) {
							for(Cookie c:ck) {
								if(c.getName().equals("id")) {
									pid = Integer.parseInt(c.getValue());
								}
							}
						}
						String pass = request.getParameter("Pass");
						boolean checkpass = PasswordMatch.checkPassword("professionals", pid, pass);
						if(checkpass) {
							completeStatus(bid,type);
						}
						else {
							response.sendRedirect("./Dashboard");
						}
					}
					else if(type.equals("users")) {
						pid = Integer.parseInt(request.getParameter("profId"));
						int rating = 0;
						if(request.getParameter("rating") != null) {
							rating = Integer.parseInt(request.getParameter("rating"));
						}
						completeStatus(bid,type);
						if(rating != 0) {
							updateProfRating(pid, rating);
							setBookingsRating(bid,rating);
						}
					}
					completeStatus(bid);
					break;
				default:
					//response.sendRedirect("./Dashboard");
					break;
			}
			response.sendRedirect("./Dashboard");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private String returnStatus(int bid)throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String status = null;
		String query = "select Status from bookings where Bid = "+bid;
		pstm = con.prepareStatement(query);
		rs = pstm.executeQuery();
		if (rs.next()) {
			status = rs.getString("Status");
		}
		con.close();
		pstm.close();
		return status;
	}
	private void updateProfRating(int pid, int rating) throws SQLException{
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int avgRate = 0;
		String query = "select Rating from professionals where Pid = "+pid;
		pstm = con.prepareStatement(query);
		rs = pstm.executeQuery();
		if(rs.next()) {
			avgRate = rs.getInt("Rating");
		}
		if(avgRate != 0) {
			avgRate = (int)(avgRate + rating)/2;
		}
		else {
			avgRate = rating;
		}
		query = "update professionals set rating = "+avgRate+" where Pid = "+pid;
		pstm = con.prepareStatement(query);
		pstm.executeUpdate();
		con.close();
		pstm.close();
	}
	private void setBookingsRating(int bid, int rating) throws SQLException{
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = "update bookings set Rating = ? where Bid = ?";
		pstm = con.prepareStatement(query);
		pstm.setInt(1, rating);
		pstm.setInt(2, bid);
		pstm.executeUpdate();
		con.close();
		pstm.close();
	}
	private void rejectStatus(int bid, String type) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = null;
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		java.sql.Time sqlTime = new java.sql.Time(date.getTime());
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
		DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss"); 
		String strDate = dateFormat.format(sqlDate); 
		String strTime = timeFormat.format(sqlTime);
		if(type.equals("users")) {
			query = "update bookings set status = 'rejected', U_status = 'rejected', St_date = '"+strDate+"' , St_time = '"+strTime+"' where Bid = "+bid;
		}
		else {
			query = "update bookings set status = 'rejected', P_status = 'rejected', St_date = '"+strDate+"' , St_time = '"+strTime+"' where Bid = "+bid;
		}
		pstm = con.prepareStatement(query);
		pstm.executeUpdate();
		con.close();
		pstm.close();
	}
	private void acceptStatus(int bid) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = "update bookings set status = 'accepted' , P_status = 'accepted' where Bid = "+bid;
		pstm = con.prepareStatement(query);
		pstm.executeUpdate();
		con.close();
		pstm.close();
	}
	private void completeStatus(int bid) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		java.sql.Time sqlTime = new java.sql.Time(date.getTime());
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
		DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss"); 
		String strDate = dateFormat.format(sqlDate); 
		String strTime = timeFormat.format(sqlTime);
		String query = "update bookings set status = 'completed', St_date = ? , St_time = ? where P_status = 'completed' and U_status = 'completed' and Bid = ?";
		pstm = con.prepareStatement(query);
		pstm.setString(1, strDate);
		pstm.setString(2, strTime);
		pstm.setInt(3, bid);
		pstm.executeUpdate();
		con.close();
		pstm.close();
	}
	private void completeStatus(int bid, String type) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = null;
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		java.sql.Time sqlTime = new java.sql.Time(date.getTime());
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
		DateFormat timeFormat = new SimpleDateFormat("hh:mm:ss"); 
		String strDate = dateFormat.format(sqlDate); 
		String strTime = timeFormat.format(sqlTime);
		if(type.equals("users")) {
			query = "update bookings set U_status = 'completed', St_date = ? , St_time = ? where Bid = ?";
		}
		else {
			query = "update bookings set P_status = 'completed', St_date = ? , St_time = ? where Bid = ?";
		}
		pstm = con.prepareStatement(query);
		pstm.setString(1, strDate);
		pstm.setString(2, strTime);
		pstm.setInt(3, bid);
		pstm.executeUpdate();
		con.close();
		pstm.close();
	}
}
