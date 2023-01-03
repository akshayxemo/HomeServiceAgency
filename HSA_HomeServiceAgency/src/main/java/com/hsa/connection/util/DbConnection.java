package com.hsa.connection.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	static Connection conn = null; 
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hsa","root","ad007");
		}catch(Exception e) {
			System.out.println(e);
		}
		return conn;
	}
}
