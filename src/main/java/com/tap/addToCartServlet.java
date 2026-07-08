package com.tap;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tap.Model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class addToCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int menuId = Integer.parseInt(req.getParameter("menuId"));

		String itemName = req.getParameter("itemName");
		String restaurantName = req.getParameter("restaurantName");

		String priceStr = req.getParameter("price");

		priceStr = priceStr.replace("₹", "");

		double price = Double.parseDouble(priceStr);

		HttpSession session = req.getSession();

		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		if (cart == null) {

			cart = new ArrayList<>();
		}

		boolean itemExists = false;

		for (CartItem item : cart) {

			if (item.getMenuId() == menuId) {

				item.setQuantity(item.getQuantity() + 1);

				itemExists = true;

				break;
			}
		}

		if (!itemExists) {

			CartItem item = new CartItem(menuId, itemName, price, 1);

			cart.add(item);
		}
		session.setAttribute("restaurantName", restaurantName);
		session.setAttribute("cart", cart);

		System.out.println(cart);

		resp.sendRedirect("customer/cart.jsp");
	}
}