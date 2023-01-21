package com.hsa.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hsa.connection.util.DbConnection;

public class GetName {
	static private Connection con=null;
	static private ResultSet rs = null;
	static private String name = null;
	public static String getUserName(int id, String table) throws SQLException{
		try {
			con = DbConnection.getConnection();
			String sqlQuery2 = null;
			if(table.equals("users")) {
				sqlQuery2 = "select Name from "+table+" where Uid = "+ id ;
			}
			else {
				sqlQuery2 = "select Name from "+table+" where Pid = "+ id ;
			}
			PreparedStatement pstm = con.prepareStatement(sqlQuery2);
			rs = pstm.executeQuery();
			if(rs.next()) {
				name = rs.getString("Name");
				con.close();
				return name;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		con.close();
		return name;
	}
}
