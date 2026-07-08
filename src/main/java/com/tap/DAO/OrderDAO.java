package com.tap.DAO;

import java.util.List;

import com.tap.Model.Order;

public interface OrderDAO {

    int addOrder(Order order);
    
    List<Order> getOrdersByUser(int userId);

    Order getOrder(int orderId);

}