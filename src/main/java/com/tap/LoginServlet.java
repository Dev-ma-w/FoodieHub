

package com.tap;

import java.io.IOException;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.DAOimpl;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");

		String pwd = req.getParameter("password");

		UserDAO dao = new DAOimpl();

		User user = dao.getUserByEmail(email);
//		System.out.println(user);

		if (user != null && user.getPassword().equals(pwd)) {

			// SESSION

			HttpSession session = req.getSession();

			session.setAttribute("loggedUser", user);

			// ROLE CHECK

			if (user.getRole().equalsIgnoreCase("CUSTOMER")) {

				resp.sendRedirect("home");
			}

			else if (user.getRole().equals("DELIVERY_AGENT")) {

				resp.sendRedirect("delivery/dashboard.jsp");
			}

			else if (user.getRole().equals("RESTAURANT_ADMIN")) {

				resp.sendRedirect("restaurant/dashboard.jsp");
			}

			else if (user.getRole().equals("SUPER_ADMIN")) {

				resp.sendRedirect("admin/dashboard.jsp");
			}
		}

		else {

			resp.sendRedirect("login.html");
		}
	}
}