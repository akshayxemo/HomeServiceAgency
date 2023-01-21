package com.hsa.generic;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hsa.connection.util.DbConnection;

/**
 * Servlet implementation class ImageViewer
 */
@WebServlet("/ImageViewer")
public class ImageViewer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		byte[] img = null;
		ServletOutputStream sos =null;
		String id = null, type = null, sqlQuery=null;
		
		id = request.getParameter("id");
		type = request.getParameter("type");
		if(type.equals("users")) {
			sqlQuery = "select Image from "+ type +" where Uid = "+id;
		}else {
			sqlQuery = "select Image from "+ type +" where Pid = "+id;
		}
		
		try {
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(sqlQuery);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				img = rs.getBytes(1);
			}
			sos = response.getOutputStream();
			sos.write(img);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
