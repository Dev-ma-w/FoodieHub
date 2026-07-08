package com.tap;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");

		RestaurantDAOImpl dao = new RestaurantDAOImpl();

		List<Restaurant> restaurantList = dao.getRestaurantsByCuisine(type);

		request.setAttribute("restaurantList", restaurantList);

		request.setAttribute("selectedCategory", type);

		request.getRequestDispatcher("customer/home.jsp").forward(request, response);
	}
}