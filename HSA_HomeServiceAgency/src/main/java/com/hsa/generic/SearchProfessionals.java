package com.hsa.generic;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.hsa.data.Professional;

/**
 * Servlet implementation class SearchProfessionals
 */
@WebServlet("/SearchProfessionals")
public class SearchProfessionals extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String service = null;
		String query = null;
		List<Professional> professionals = new ArrayList<>() ;
		service = request.getParameter("Service_id");
		//pw.println("This is my Servlet "+service);
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			query = "select Pid,Name,Email,Rating from professionals where Service_id = "+service;
			pstm = con.prepareStatement(query);
			rs = pstm.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("Pid");
				String name = rs.getString("Name");
				String email = rs.getString("Email");
				int rating = rs.getInt("Rating");
				Professional tempProf = new Professional(pid,name,email,rating);
				professionals.add(tempProf);	
			}
			request.setAttribute("listProfs", professionals);
			request.getRequestDispatcher("service.jsp").forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
