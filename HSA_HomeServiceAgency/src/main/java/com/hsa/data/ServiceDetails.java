package com.hsa.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hsa.connection.util.DbConnection;

public class ServiceDetails {
	private static Connection con;
	private static PreparedStatement pstm;
	private static ResultSet rs;
	public static List<SubService> getDetail(int bid) throws SQLException{
		String sqlQuery = null;
		List<SubService> services = new ArrayList<>();
		con = DbConnection.getConnection();
		sqlQuery = "select Sid, S_name, Price from bookings_desc where Bid = "+bid;
		pstm = con.prepareStatement(sqlQuery);
		rs = pstm.executeQuery();
		while(rs.next()) {
			SubService temp = new SubService(rs.getInt("Sid"),rs.getString("S_name"),rs.getInt("Price"));
			services.add(temp);
		}
		return services;
	}
}
