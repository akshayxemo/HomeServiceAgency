package com.hsa.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hsa.connection.util.DbConnection;

public class IsExisting {
	public static boolean checkRedundentUser(String table, String email) throws SQLException{
		Connection con=null;
		try {
			con = DbConnection.getConnection();
			String sqlQuery2 = "select Email from "+table+" where Email = '"+email+"'" ;
			PreparedStatement pstm = con.prepareStatement(sqlQuery2);
			ResultSet rs = null;
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
	public static String checkPhone(String table, String Phone) throws SQLException{
		Connection con=null;
		String email = null;
		try {
			con = DbConnection.getConnection();
			String sqlQuery2 = "select Email from "+table+" where Phone = '"+Phone+"'" ;
			PreparedStatement pstm = con.prepareStatement(sqlQuery2);
			ResultSet rs = null;
			rs = pstm.executeQuery();
			if(rs.next()) {
				email = rs.getString("Email");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		con.close();
		return email;
	}
	public static int getId(String table, String Phone) throws SQLException{
		Connection con=null;
		try {
			con = DbConnection.getConnection();
			String sqlQuery2 = null;
			if(table.equals("users")) {
				sqlQuery2 = "select Uid from "+table+" where Phone = '"+Phone+"'" ;
			}
			else {
				sqlQuery2 = "select Pid from "+table+" where Phone = '"+Phone+"'" ;
			}
			PreparedStatement pstm = con.prepareStatement(sqlQuery2);
			ResultSet rs = null;
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		con.close();
		return 0;
	}
}
