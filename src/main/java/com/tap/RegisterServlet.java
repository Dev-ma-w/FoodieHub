package com.tap;

import java.io.IOException;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.DAOimpl;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String username = req.getParameter("username");

		String email = req.getParameter("email");
		String phone = req.getParameter("phone");

		String pwd = req.getParameter("password");

		String address = req.getParameter("address");

		User user = new User();

		user.setUserName(username);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(pwd);

		user.setAddress(address);

		user.setRole("CUSTOMER");

		UserDAO uDAO = new DAOimpl();

		int status = uDAO.addUser(user);

		if (status > 0) {

			resp.sendRedirect("login.html");

		} else {

			resp.sendRedirect("register.html");

		}
	}
}