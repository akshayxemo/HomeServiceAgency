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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;
import com.hsa.data.AdminData;
import com.hsa.data.Professional;
import com.hsa.data.Report;
import com.hsa.data.User;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Professional> professionals = new ArrayList<>();
		List<User> users = new ArrayList<>();
		List<Report> reportsSeen = new ArrayList<>();
		List<Report> reportsUnseen = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement pstm1 = null;
			PreparedStatement pstm2 = null;
			ResultSet rs1 = null;
			ResultSet rs2 = null;
			String sql1 = "SELECT Pid, Name, Email, Rating, Gender, Service_id, Phone, AltPhone, Address, Status FROM professionals where Pid is not null";
			String sql2 = "SELECT Uid, Name, Email, Gender, Phone, AltPhone, Address, Status FROM users where Uid is not null";
			pstm1 = con.prepareStatement(sql1);
			pstm2 = con.prepareStatement(sql2);
			rs1 = pstm1.executeQuery();
			rs2 = pstm2.executeQuery();
			while(rs1.next()) {
				int Id = rs1.getInt("Pid");
				String Name =  rs1.getString("Name");
				String Email = rs1.getString("Email");
				int Rating = rs1.getInt("Rating");
				String Gender =  rs1.getString("Gender");
				int ServiceId = rs1.getInt("Service_id");
				String Phone  =  rs1.getString("Phone");
				String AltPhone  =  rs1.getString("AltPhone");
				String Address =  rs1.getString("Address");
				String Status = rs1.getString("Status");
				String ServiceName = getServiceName(ServiceId);
				Professional prof = new Professional(Id, Name, Email, Rating, Gender, ServiceId, Phone, AltPhone, Address, ServiceName, Status);
				professionals.add(prof);
			}
			while(rs2.next()) {
				int Id = rs2.getInt("Uid");
				String Name =  rs2.getString("Name");
				String Email = rs2.getString("Email");
				String Gender =  rs2.getString("Gender");
				String Phone  =  rs2.getString("Phone");
				String AltPhone  =  rs2.getString("AltPhone");
				String Address =  rs2.getString("Address");
				String Status = rs2.getString("Status");
				User user = new User(Id, Name, Email , Address, Phone, AltPhone, Gender, Status);
				users.add(user);
			}
			reportsSeen = getReport("true");
			reportsUnseen = getReport("false");
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//System.out.println(reportsSeen);
		//System.out.println(reportsUnseen);
		request.setAttribute("ReportSeen", reportsSeen);
		request.setAttribute("ReportUnseen", reportsUnseen);
		request.setAttribute("ProfInfo", professionals);
		request.setAttribute("UserInfo", users);
		request.getRequestDispatcher("/admin-dashboard.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Id = request.getParameter("id"); 
		String Type = request.getParameter("type"); 
		String Action = "noAction";
		String Password = request.getParameter("password");
		Action = request.getParameter("action");
		String rid = request.getParameter("rid");
		String RepBan = request.getParameter("RepBan");
		if(Password != null) {
			if(AdminData.checkAdminPassword(Password) == false) {
				Action = "noAction";
			}
		}
		boolean done =  false;
		try {
			switch(Action) {
			case "ban":
				changeStatus(Type, Id, "baned");
				//System.out.print(RepBan+" and "+rid);
				if(RepBan != null) {
					reportAction(rid, RepBan);
					reportSeen(rid);
				}
				request.setAttribute("Varify", true);
				request.setAttribute("color", "success");
				request.setAttribute("Msg","Successfully Banned "+Type+" id "+Id);
				done = true;
				break;
			case "unban":
				changeStatus(Type, Id, "safe");
				request.setAttribute("Varify", true);
				request.setAttribute("color", "success");
				request.setAttribute("Msg","Successfully Unbanned "+Type+" id "+Id);
				done = true;
				break;
			case "changeSeen":
				//System.out.println(" Seen Enter "+Action);
				reportSeen(rid);
				response.sendRedirect("./Dashboard");
				break;
			case "resolve":
				//System.out.println(" resolve Enter "+Action);
				reportResolve(rid);
				reportSeen(rid);
				response.sendRedirect("./Dashboard");
				break;
			default:
				done = false;
				break;
			}
			if(done) {
				request.getRequestDispatcher("adminApproval.jsp").forward(request, response);
			}
			else {
				request.setAttribute("Varify", true);
				request.setAttribute("color", "danger");
				request.setAttribute("Msg","Sorry Something went wrong");
				request.getRequestDispatcher("adminApproval.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private void reportAction(String rid, String Action)throws SQLException {
		String query = "UPDATE report SET Action = '"+Action+"' WHERE Rid = "+rid;
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		pstm.executeUpdate();
		conn.close();
		pstm.close();
	}
	private void reportResolve(String rid)throws SQLException {
		String query = "UPDATE report SET Action = 'resolved' WHERE Rid = "+rid;
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		pstm.executeUpdate();
		conn.close();
		pstm.close();
	}
	private void reportSeen(String rid)throws SQLException {
		String query = "UPDATE report SET Seen = 'true' WHERE Rid = "+rid;
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		pstm.executeUpdate();
		conn.close();
		pstm.close();
	}
	private List<Report> getReport(String seen) throws SQLException {
		//System.out.println(seen);
		String query = "select Rid,Bid,Uid,Pid,Message,AgainstType,Date,Time,Seen,Action from report where Seen = '"+seen+"'";
		
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		ResultSet rs = null;
		
		List<Report> reps = new ArrayList<>();
		
		rs = pstm.executeQuery();
		while(rs.next()) {
			int rid = rs.getInt("Rid");
			int bid = rs.getInt("Bid"); 
			int uid = rs.getInt("Uid"); 
			int pid = rs.getInt("Pid");
			String msg = rs.getString("Message");
			String againstType = rs.getString("AgainstType");
			String date = rs.getString("Date");
			String time = rs.getString("Time");
			String Seen = rs.getString("Seen");
			String action = rs.getString("Action");
			Report rep = new Report(rid,bid,uid,pid,msg,againstType,date,time,Seen,action);
			//System.out.println(rep);
			reps.add(rep);
		}
		conn.close();
		//System.out.println(reps);
		return reps;
	}
	private static void changeStatus(String type, String id, String status)throws SQLException {
		Connection conn = DbConnection.getConnection();
		String query = null ;
		if(type.equals("professionals")) {
			query = "update professionals set Status = ? where Pid = ?" ;
		}
		else {
			query = "update users set Status = ? where Uid = ?" ;
		}
		PreparedStatement pstm = conn.prepareStatement(query);
		pstm.setString(1, status);
		pstm.setString(2, id);
		pstm.executeUpdate();
		pstm.close();
		conn.close();
	}
	private static String getServiceName(int serviceId) throws SQLException {
		Connection conn = DbConnection.getConnection();
		String query = "select C_name from service_catagory where Cid = " + serviceId  ;
		PreparedStatement pstm2 = conn.prepareStatement(query);
		ResultSet rs2 = null;
		rs2 = pstm2.executeQuery();
		String service_name = null;
		if(rs2.next()) {
			service_name = rs2.getString("C_name");
		}
		conn.close();
		return service_name;
	}

}
