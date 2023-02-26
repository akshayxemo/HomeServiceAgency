package com.hsa.data;

public class AdminData {
	private static String Pass = "@1234#";
	private static String email = "hsaadmin@gmail.com";
	
	public static boolean checkAdminPassword(String Password, String Email) {
		if(Password.equals(Pass) && Email.equals(email)) {
			return true;
		}
		else {
			return false;
		}
	}
	public static boolean checkAdminPassword(String Password) {
		if(Password.equals(Pass)) {
			return true;
		}
		else {
			return false;
		}
	}
}
