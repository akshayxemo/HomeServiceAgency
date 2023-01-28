package com.hsa.generic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
		String status = request.getParameter("status");
		int bid = Integer.parseInt(request.getParameter("bid"));
		try {
			switch(status) {
				case "reject":
					rejectStatus(bid);
					break;
				case "accept":
					acceptStatus(bid);
					break;
				case "complete":
					String pass = request.getParameter("Pass");
					int rating = Integer.parseInt(request.getParameter("rating"));
					int pid = Integer.parseInt(request.getParameter("ProfId"));
					String email = request.getParameter("email");
					boolean checkpass = PasswordMatch.checkPassword("professionals", pid, pass, email);
					if(checkpass) {
						completeStatus(bid);
						updateProfRating(pid, rating);
					}
					else {
						response.sendRedirect("./Dashboard");
					}
					break;
				default:
					response.sendRedirect("./Dashboard");
					break;
			}
			response.sendRedirect("./Dashboard");
		}catch(Exception e) {
			e.printStackTrace();
		}
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
	}
	private void rejectStatus(int bid) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = "update bookings set status = 'rejected' where Bid = "+bid;
		pstm = con.prepareStatement(query);
		pstm.executeUpdate();
	}
	private void acceptStatus(int bid) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = "update bookings set status = 'accepted' where Bid = "+bid;
		pstm = con.prepareStatement(query);
		pstm.executeUpdate();
	}
	private void completeStatus(int bid) throws SQLException {
		Connection con = DbConnection.getConnection();
		PreparedStatement pstm = null;
		String query = "update bookings set status = 'completed' where Bid = "+bid;
		pstm = con.prepareStatement(query);
		pstm.executeUpdate();
	}
}
