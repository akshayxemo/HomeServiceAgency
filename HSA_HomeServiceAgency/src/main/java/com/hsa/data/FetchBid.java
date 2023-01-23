package com.hsa.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hsa.connection.util.DbConnection;

public class FetchBid {
	private static Connection conn;
	private static String query;
	public static int fetchBookingId(int uid, int pid, String sqlDate, String sqlTime)throws SQLException {
		int bid = 0;
		query = "select Bid from bookings where Uid = "+uid+
				" and Pid = "+pid+" and B_date = '"+sqlDate+"' and B_time = '"+sqlTime+"'";
		conn = DbConnection.getConnection();
		PreparedStatement pstm = conn.prepareStatement(query);
		ResultSet rs = null;
		rs = pstm.executeQuery();
		if(rs.next()) {
			bid = rs.getInt("Bid");
			conn.close();
			return bid;
		}
		return 100;
	}
}
