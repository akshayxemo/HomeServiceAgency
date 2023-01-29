package com.hsa.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hsa.connection.util.DbConnection;

public class PasswordMatch {
	static Connection con=null;
	static ResultSet rs = null;
	static String e = null;
	public static boolean checkPassword(String table, int pid, String pass) throws SQLException{
		boolean status = false;
		try {
			con = DbConnection.getConnection();
			String hashpass = Encryption.toHexString(Encryption.getSHA(pass));
			String sqlQuery2 = "select Email from "+table+" where Password = '"+hashpass+"' and Pid = "+pid ;
			PreparedStatement pstm = con.prepareStatement(sqlQuery2);
			rs = pstm.executeQuery();
			if(rs.next()) {
					status = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		con.close();
		return status;
	}
}
