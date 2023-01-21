package com.hsa.generic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;
import com.hsa.data.Feedback;
import com.hsa.data.GetName;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setIntHeader("Refresh", 60);
		response.setContentType("text/html");
		String query = null;
		List<Feedback> feedbacks = new ArrayList<>();
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			query = "Select Uid, Message, F_date from feedback";
			pstm = con.prepareStatement(query);
			rs = pstm.executeQuery();
			while(rs.next()) {
				int uid = rs.getInt("Uid");
				String name = GetName.getUserName(uid, "users");
				String msg = rs.getString("Message");
				String date = rs.getString("F_date");
				Feedback tempFeedback = new Feedback(uid,msg,date,name);
				feedbacks.add(tempFeedback);
			}
			request.setAttribute("ListFeeds", feedbacks);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
			
		
	}

}
