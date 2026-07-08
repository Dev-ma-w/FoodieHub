package com.tap.DAO;

import java.util.List;

import com.tap.Model.User;

public interface UserDAO {

	 int addUser(User user);
	 
	 User getUserByEmail(String email);
	
	 User getUser(int UserId);
	 
	 User updateuser(User user);
	 
	 void deleteuser(int User);
	 
	 List <User> getallusers();
	
}
