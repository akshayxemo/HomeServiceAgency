package com.hsa.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hsa.connection.util.DbConnection;

public class IsExisting {
	static Connection con=null;
	static ResultSet rs = null;
	static String e = null;
	public static boolean checkRedundentUser(String table, String email) throws SQLException{
		try {
			con = DbConnection.getConnection();
			String sqlQuery2 = "select Email from "+table+" where Email = '"+email+"'" ;
			PreparedStatement pstm = con.prepareStatement(sqlQuery2);
			rs = pstm.executeQuery();
			if(rs.next()) {
				con.close();
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		con.close();
		return false;
	}
}
