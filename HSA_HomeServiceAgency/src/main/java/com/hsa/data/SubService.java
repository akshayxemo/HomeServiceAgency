package com.hsa.data;

public class SubService {

	private int Sid;
	private String Sname;
	private int price;
	public SubService(int sid, String sname, int price) {
		super();
		Sid = sid;
		Sname = sname;
		this.price = price;
	}
	public int getSid() {
		return Sid;
	}
	public void setSid(int sid) {
		Sid = sid;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "SubService [Sid=" + Sid + ", Sname=" + Sname + ", price=" + price + "]";
	}
	
}
