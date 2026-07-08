package com.tap;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.DAO.OrderItemDAO;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.Model.CartItem;
import com.tap.Model.Order;
import com.tap.Model.OrderItem;
import com.tap.Model.Restaurant;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("loggedUser");
        Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (user == null || restaurant == null || cart == null || cart.isEmpty()) {
            resp.sendRedirect("customer/cart.jsp");
            return;
        }

        String paymentMethod = req.getParameter("paymentMethod");

        if (paymentMethod == null) {
            paymentMethod = "COD";
        }

        double totalAmount = 0;

        for (CartItem item : cart) {
            totalAmount += item.getPrice() * item.getQuantity();
        }

        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurant.getRestaurantId());
        order.setTotalAmount(totalAmount);
        order.setStatus("Pending");
        order.setPaymentMethod(paymentMethod);

        OrderDAO orderDAO = new OrderDAOImpl();

        int orderId = orderDAO.addOrder(order);

        if (orderId > 0) {

            OrderItemDAO itemDAO = new OrderItemDAOImpl();

            for (CartItem c : cart) {

                OrderItem item = new OrderItem();

                item.setOrderId(orderId);
                item.setMenuId(c.getMenuId());
                item.setQuantity(c.getQuantity());

                itemDAO.addOrderItem(item);
            }

            session.setAttribute("orderId", orderId);
            session.setAttribute("orderTotal", totalAmount);
            session.setAttribute("paymentMethod", paymentMethod);
            session.setAttribute("restaurant", restaurant);

            session.removeAttribute("cart");

            resp.sendRedirect("customer/orderSuccess.jsp");

        } else {

            resp.sendRedirect("customer/cart.jsp");

        }
    }
}