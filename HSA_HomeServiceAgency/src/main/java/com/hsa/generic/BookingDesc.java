package com.hsa.generic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;
import com.hsa.data.BDetails;
import com.hsa.data.Professional;
import com.hsa.data.SubService;

/**
 * Servlet implementation class BookingDesc
 */
@WebServlet("/BookingDesc")
public class BookingDesc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	private boolean updateBookingDesc(int bid, List<SubService> subService) throws SQLException {
		String query = "insert into bookings_desc(Bid,Sid,S_name,Price) values(?,?,?,?)";
		Connection conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		for(SubService temp : subService) {
			pstm.setInt(1, bid);
			pstm.setInt(2, temp.getSid());
			pstm.setString(3, temp.getSname());
			pstm.setInt(4, temp.getPrice());
			pstm.executeUpdate();
		}
		conn.close();
		return true;
	}
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		ServletContext context=getServletContext();  
		Professional pro = (Professional)context.getAttribute("profDetails");
		List<SubService> subService = (List<SubService>)context.getAttribute("services");
		BDetails bDetails = (BDetails) context.getAttribute("bDetails");
		String service_name = (String) context.getAttribute("ServiceName");
		pw.println(pro+"........."+subService+"........."+bDetails);
		pw.println(bDetails.getUid()+"......."+pro.getId()+"......."+bDetails.getbDate()+"......."+bDetails.getbTime()+">>>>>");
		int bid = 0;
		ResultSet rs = null;
		Connection conn = DbConnection.getConnection();
		String query = "select Bid from bookings where B_date = '"+bDetails.getbDate()+"' and Uid = "+bDetails.getUid()+
				" and Pid = "+pro.getId()+" and B_Time = '"+bDetails.getbTime()+"'";
		try {
			PreparedStatement pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			pw.println("outside");
			while(rs.next()) {
				pw.println("inside");
				bid = rs.getInt("Bid");
				pw.println(bid);
			}
			conn.close();
			//pw.println(bid);
			boolean updateDesc = updateBookingDesc(bid,subService);
			if(updateDesc) {
				pw.println("COMPLETED");
			}
			request.setAttribute("ServiceName", service_name);
			request.setAttribute("profDetails", pro);
			request.setAttribute("services", subService);
			request.setAttribute("bDetails", bDetails);
			request.getRequestDispatcher("BookingDetails.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
