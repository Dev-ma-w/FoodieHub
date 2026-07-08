package com.tap;

import java.io.IOException;

import com.tap.DAOImpl.DAOimpl;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User loggedUser = (User) session.getAttribute("loggedUser");

		if (loggedUser == null) {

			resp.sendRedirect("login.html");
			return;
		}

		loggedUser.setUserName(req.getParameter("userName"));

		loggedUser.setEmail(req.getParameter("email"));

		loggedUser.setPhone(req.getParameter("phone"));

		loggedUser.setAddress(req.getParameter("address"));

		loggedUser.setAddressType(
				req.getParameter("selectedAddressType"));

		DAOimpl dao = new DAOimpl();

		dao.updateuser(loggedUser);

		session.setAttribute("loggedUser", loggedUser);

		resp.sendRedirect("customer/profile.jsp");

	}

}