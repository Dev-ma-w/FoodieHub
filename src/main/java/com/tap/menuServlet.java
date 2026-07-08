package com.tap;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.Model.Restaurant;
import com.tap.Model.menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu")
public class menuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

		HttpSession session = req.getSession();

		RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

		Restaurant restaurant = restaurantDAO.getRestaurantById(restaurantId);
		System.out.println("Restaurant = " + restaurant);

		if(restaurant != null) {

		    System.out.println("Name = " + restaurant.getName());

		    System.out.println("Image = " + restaurant.getImagePath());

		    System.out.println("Rating = " + restaurant.getRatings());

		}

		session.setAttribute("restaurantId", restaurantId);

		session.setAttribute("restaurant", restaurant);
//		System.out.println("Restaurant ID Stored = " + restaurantId);

		MenuDAO dao = new MenuDAOImpl();

		List<menu> menuList = dao.getMenuByRestaurantId(restaurantId);

		req.setAttribute("menuList", menuList);

		RequestDispatcher rd = req.getRequestDispatcher("customer/menu.jsp");

		rd.forward(req, resp);
	}
}