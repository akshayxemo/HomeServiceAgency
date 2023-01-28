package com.hsa.data;

public class SubService {

	private int sid;
	private String sname;
	private int price;
	public SubService(int sid, String sname, int price) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.price = price;
	}
	public SubService(int sid, String sname) {
		super();
		this.sid = sid;
		this.sname = sname;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "SubService [sid=" + sid + ", sname=" + sname + ", price=" + price + "]";
	}
}
