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
import com.hsa.data.Professional;

/**
 * Servlet implementation class SearchProfessionals
 */
@WebServlet("/SearchProfessionals")
public class SearchProfessionals extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String service = null;
		String query = null;
		String ServiceName = null;
		List<Professional> professionals = new ArrayList<>() ;
		service = request.getParameter("Service_id");
		//pw.println("This is my Servlet "+service);
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			//query = "select Pid,Name,Email,Rating from professionals where Service_id = "+service;
			
			String filter = null;
			filter = request.getParameter("filter");
			if(filter != null) {
				if(filter.equals("Rating-High-Low")) {
					query = "select Service_catagory.C_name, professionals.Pid, professionals.Name, "
							+ "professionals.Email, professionals.Rating, professionals.Gender from professionals "
							+ "Inner join service_catagory ON service_catagory.Cid = professionals.Service_id where "
							+ "professionals.Service_id = "+service +" ORDER BY professionals.Rating DESC";
				}
				else if(filter.equals("Female")) {
					query = "select Service_catagory.C_name, professionals.Pid, professionals.Name, "
							+ "professionals.Email, professionals.Rating, professionals.Gender from professionals "
							+ "Inner join service_catagory ON service_catagory.Cid = professionals.Service_id where "
							+ "professionals.Service_id = "+service +" and professionals.Gender = 'Female'";
				}
				else if(filter.equals("Male")) {
					query = "select Service_catagory.C_name, professionals.Pid, professionals.Name, "
							+ "professionals.Email, professionals.Rating, professionals.Gender from professionals "
							+ "Inner join service_catagory ON service_catagory.Cid = professionals.Service_id where "
							+ "professionals.Service_id = "+service +" and professionals.Gender = 'Male'";
				}
				else if(filter.equals("Others")) {
					query = "select Service_catagory.C_name, professionals.Pid, professionals.Name, "
							+ "professionals.Email, professionals.Rating, professionals.Gender from professionals "
							+ "Inner join service_catagory ON service_catagory.Cid = professionals.Service_id where "
							+ "professionals.Service_id = "+service +" and professionals.Gender = 'Others'";
				}
				else {
					query = "select Service_catagory.C_name, professionals.Pid, professionals.Name, "
							+ "professionals.Email, professionals.Rating, professionals.Gender from professionals "
							+ "Inner join service_catagory ON service_catagory.Cid = professionals.Service_id where "
							+ "professionals.Service_id = "+service;
				}
			}
			else {
				query = "select Service_catagory.C_name, professionals.Pid, professionals.Name, "
						+ "professionals.Email, professionals.Rating, professionals.Gender from professionals "
						+ "Inner join service_catagory ON service_catagory.Cid = professionals.Service_id where "
						+ "professionals.Service_id = "+service;
			}
			pstm = con.prepareStatement(query);
			rs = pstm.executeQuery();
			while(rs.next()) {
				ServiceName = rs.getString("C_name");
				int pid = rs.getInt("Pid");
				String name = rs.getString("Name");
				String email = rs.getString("Email");
				int rating = rs.getInt("Rating");
				String gender = rs.getString("Gender");
				Professional tempProf = new Professional(pid,name,email,rating,gender);
				professionals.add(tempProf);	
			}
			request.setAttribute("Filter", filter);
			request.setAttribute("listProfs", professionals);
			request.setAttribute("ServiceName", ServiceName);
			request.getRequestDispatcher("service.jsp").forward(request, response);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
