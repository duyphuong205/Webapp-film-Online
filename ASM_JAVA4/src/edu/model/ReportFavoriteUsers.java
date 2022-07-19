package edu.model;

import java.util.Date;

public class ReportFavoriteUsers {
	private String id;
	private String fullname;
	private String email;
	private Date favoriteDate;

	public ReportFavoriteUsers() {
		// TODO Auto-generated constructor stub
	}

	public ReportFavoriteUsers(String id, String fullname, String email, Date favoriteDate) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.favoriteDate = favoriteDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getFavoriteDate() {
		return favoriteDate;
	}

	public void setFavoriteDate(Date favoriteDate) {
		this.favoriteDate = favoriteDate;
	}

}
