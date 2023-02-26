package com.hsa.data;

public class Report {
	private int id;
	private int bid; 
	private int uid; 
	private int pid;
	private String msg;
	private String againstType;
	private String date;
	private String time;
	private String seen;
	private String action;
	public Report(int id, int bid, int uid, int pid, String msg, String againstType, String date, String time,
			String seen, String action) {
		super();
		this.id = id;
		this.bid = bid;
		this.uid = uid;
		this.pid = pid;
		this.msg = msg;
		this.againstType = againstType;
		this.date = date;
		this.time = time;
		this.seen = seen;
		this.action = action;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getAgainstType() {
		return againstType;
	}
	public void setAgainstType(String againstType) {
		this.againstType = againstType;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSeen() {
		return seen;
	}
	public void setSeen(String seen) {
		this.seen = seen;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	@Override
	public String toString() {
		return "Report [id=" + id + ", bid=" + bid + ", uid=" + uid + ", pid=" + pid + ", msg=" + msg + ", againstType="
				+ againstType + ", date=" + date + ", time=" + time + ", seen=" + seen + ", action=" + action + "]";
	}
}
