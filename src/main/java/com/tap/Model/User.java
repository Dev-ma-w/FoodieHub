package com.tap.Model;

import java.sql.Timestamp;

public class User {

	private int userId;
	private String userName;
	private String phone;
	private String password;
	private String email;
	private String address;
	private String role;
	private String addressType;
	private Timestamp createDate;
	private Timestamp lastLoginDate;

	public User() {

	}

	public User(String userName, String password, String email, String phone, String address, String role,
			String addressType) {
		super();
		this.userName = userName;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addressType = addressType;
		this.role = role;
	}

	public User(int userId, String userName, String password, String phone, String email, String address, String role,
			String addressType, Timestamp createDate, Timestamp lastLoginDate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addressType = addressType;
		this.role = role;
		this.createDate = createDate;
		this.lastLoginDate = lastLoginDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + ", address=" + address +",addressType=" +addressType + ", role=" + role + ", createDate=" + createDate
				+ ", lastLoginDate=" + lastLoginDate + "]";
	}

}
