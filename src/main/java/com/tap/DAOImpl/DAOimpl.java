
package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.Model.User;
import com.tap.utility.DBconnection;

public class DAOimpl implements UserDAO {

	// ADD USER

	@Override
	public int addUser(User user) {

		String INSERT_QUERY = "INSERT INTO user(userName,password,phone,email,address,role,createDate,lastLoginDate) "
				+ "VALUES(?,?,?,?,?,?,?,?)";

		Connection con = DBconnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY);

			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getPhone()); // Phone
			pstmt.setString(4, user.getEmail()); // Email
			pstmt.setString(5, user.getAddress()); // Address
			pstmt.setString(6, user.getRole()); // Role

			java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

			pstmt.setDate(7, today);
			pstmt.setDate(8, today);

			System.out.println("Phone = " + user.getPhone()); // Debug

			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}
	// GET USER BY ID

	@Override
	public User getUser(int userId) {

		String GET_QUERY = "SELECT * FROM user WHERE userId=?";

		Connection con = DBconnection.getConnection();

		User u = null;

		try {

			PreparedStatement pstmt = con.prepareStatement(GET_QUERY);

			pstmt.setInt(1, userId);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				String userName = rs.getString("userName");

				String password = rs.getString("password");

				String email = rs.getString("email");

				String phone = rs.getString("phone");

				String address = rs.getString("address");
				
				String addressType = rs.getString("addressType");

				String role = rs.getString("role");

				Timestamp createDate = rs.getTimestamp("createDate");

				Timestamp lastLoginDate = rs.getTimestamp("lastLoginDate");

				u = new User(userId, userName, password, phone, email, address,addressType, role, createDate, lastLoginDate);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return u;
	}

	public User getUserByEmail(String email) {

		String query = "SELECT * FROM user WHERE email=?";

		Connection con = DBconnection.getConnection();

		User user = null;

		try {

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, email);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				user = new User();

				user.setUserId(rs.getInt("userId"));

				user.setUserName(rs.getString("userName"));

				user.setPassword(rs.getString("password"));

				user.setPhone(rs.getString("phone"));

				user.setEmail(rs.getString("email"));

				user.setAddress(rs.getString("address"));
				
				user.setAddressType(rs.getString("addressType"));

				user.setRole(rs.getString("role"));

				System.out.println("Logged User = " + user);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return user;
	}
	// UPDATE USER

	@Override
	public User updateuser(User user) {

	    String UPDATE_QUERY =
	        "UPDATE user SET userName=?, phone=?, email=?, address=?, addressType=? WHERE userId=?";

	    Connection con = DBconnection.getConnection();

	    try {

	        PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY);

	        pstmt.setString(1, user.getUserName());
	        pstmt.setString(2, user.getPhone());
	        pstmt.setString(3, user.getEmail());
	        pstmt.setString(4, user.getAddress());
	        pstmt.setString(5, user.getAddressType());
	        pstmt.setInt(6, user.getUserId());

	        pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}
	// DELETE USER

	@Override
	public void deleteuser(int userId) {

		String DELETE_QUERY = "DELETE FROM user WHERE userId=?";

		Connection con = DBconnection.getConnection();

		try {

			PreparedStatement pstmt = con.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, userId);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	// GET ALL USERS

	@Override
	public List<User> getallusers() {

		String GETALL_QUERY = "SELECT * FROM user";

		List<User> list = new ArrayList<User>();

		Connection con = DBconnection.getConnection();

		try {

			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(GETALL_QUERY);

			while (rs.next()) {

				int id = rs.getInt("userId");

				String name = rs.getString("userName");

				String password = rs.getString("password");

				String phone = rs.getString("phone");

				String email = rs.getString("email");

				String address = rs.getString("address");
				
				String addressType = rs.getString("addressType");

				String role = rs.getString("role");

				Timestamp cd = rs.getTimestamp("createDate");

				Timestamp lld = rs.getTimestamp("lastLoginDate");

				User u = new User(id, name, password, phone, email, address,addressType, role, cd, lld);

				list.add(u);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
}