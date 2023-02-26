package com.hsa.data;

public class User {
	private int uid;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String altPhone;
	private String gender;
	private String status;
	public User(int uid, String name, String email, String address, String phone, String altPhone, String gender,
			String status) {
		super();
		this.uid = uid;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.altPhone = altPhone;
		this.gender = gender;
		this.status = status;
	}
	public User(int uid, String name, String email, String address, String phone, String altPhone, String gender) {
		super();
		this.uid = uid;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.altPhone = altPhone;
		this.gender = gender;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAltPhone() {
		return altPhone;
	}
	public void setAltPhone(String altPhone) {
		this.altPhone = altPhone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", name=" + name + ", email=" + email + ", address=" + address + ", phone=" + phone
				+ ", altPhone=" + altPhone + ", gender=" + gender + ", status=" + status + "]";
	}
}
