package com.tap;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.Model.Order;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		User user = (User) session.getAttribute("loggedUser");

		if (user == null) {

			resp.sendRedirect("login.html");
			return;
		}

		OrderDAO orderDAO = new OrderDAOImpl();
		System.out.println("Logged User = " + user);
		System.out.println("User ID = " + user.getUserId());

		List<Order> orderList = orderDAO.getOrdersByUser(user.getUserId());
		

		req.setAttribute("orderList", orderList);

		req.getRequestDispatcher("customer/orderHistory.jsp").forward(req, resp);
	}

}