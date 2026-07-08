package com.tap;

import java.io.IOException;
import java.util.List;

import com.tap.Model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeCart")
public class RemoveCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int menuId = Integer.parseInt(req.getParameter("menuId"));

		HttpSession session = req.getSession();

		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		if (cart != null) {

			cart.removeIf(item -> item.getMenuId() == menuId);
		}

		session.setAttribute("cart", cart);

		resp.sendRedirect("customer/cart.jsp");
	}
}