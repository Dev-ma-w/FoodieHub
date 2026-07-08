package com.tap;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.Model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")

public class HomeServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RestaurantDAO dao = new RestaurantDAOImpl();

		List<Restaurant> restaurantList = dao.getAllRestaurants();

		req.setAttribute("restaurantList", restaurantList);

		RequestDispatcher rd = req.getRequestDispatcher("customer/home.jsp");

		rd.forward(req, resp);
	}
}