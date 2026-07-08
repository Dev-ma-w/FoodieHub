package com.tap;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import com.tap.Model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int menuId = Integer.parseInt(req.getParameter("menuId"));

		String action = req.getParameter("action");

		HttpSession session = req.getSession();

		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		if (cart != null) {

			Iterator<CartItem> iterator = cart.iterator();

			while (iterator.hasNext()) {

				CartItem item = iterator.next();

				if (item.getMenuId() == menuId) {

					if ("increase".equals(action)) {

						item.setQuantity(item.getQuantity() + 1);

					} else if ("decrease".equals(action)) {

						item.setQuantity(item.getQuantity() - 1);

						if (item.getQuantity() <= 0) {

							iterator.remove();
						}
					}

					break;
				}
			}

			session.setAttribute("cart", cart);
		}

		resp.sendRedirect("customer/cart.jsp");
	}
}