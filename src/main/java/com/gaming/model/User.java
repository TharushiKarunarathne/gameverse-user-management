package com.gaming.model;

public class User {
    private int id;
    private String firstname;
    private String lastname;
    private String username;
    private String email;
    private String password;
    private String fileName;
    private String role;
    
    
	public int getId() {
		return id;
	}
	public String getFirstname() {
		return firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public String getUsername() {
		return username;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getFileName() {
		return fileName;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getRole() {
	    return role;
	}
	public void setRole(String role) {
	    this.role = role;
	}
    
    
}

