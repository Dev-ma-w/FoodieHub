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

@WebServlet("/applyCoupon")
public class ApplyCouponServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String coupon = req.getParameter("coupon");

		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

		double grandTotal = 0;

		if (cart != null) {
			for (CartItem item : cart) {
				grandTotal += item.getPrice() * item.getQuantity();
			}
		}

		// FOOD100 validation
		if ("FOOD100".equals(coupon) && grandTotal < 500) {

			session.setAttribute("couponError", "Minimum order ₹500 required for FOOD100.");

			session.removeAttribute("coupon");

		} else {

			session.setAttribute("coupon", coupon);

			session.removeAttribute("couponError");
		}

		resp.sendRedirect("customer/cart.jsp");
	}
}