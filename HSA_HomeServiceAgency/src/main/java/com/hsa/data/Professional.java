package com.hsa.data;

public class Professional {
	private int id; 
	private String name = null;
	private String email = null;
	private int rating ;
	public Professional(int id, String name, String email, int rating) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.rating = rating;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "Professional [id=" + id + ", name=" + name + ", email=" + email + ", rating=" + rating + "]";
	}
	
		
	
}
