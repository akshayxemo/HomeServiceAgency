package com.hsa.data;

public class Feedback {
	private int uid;
	private String message;
	private String date;
	private String name;
	public Feedback(int uid, String message, String date, String name) {
		super();
		this.uid = uid;
		this.message = message;
		this.date = date;
		this.name = name;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Feedback [uid=" + uid + ", message=" + message + ", date=" + date + ", name=" + name + "]";
	}
}
