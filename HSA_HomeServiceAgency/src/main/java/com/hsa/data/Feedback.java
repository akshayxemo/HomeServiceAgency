package com.hsa.data;

public class Feedback {
	private String message;
	private String date;
	public Feedback(String message, String date) {
		this.message = message;
		this.date = date;
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
	@Override
	public String toString() {
		return "Feedback [message=" + message + ", date=" + date + "]";
	}
}
