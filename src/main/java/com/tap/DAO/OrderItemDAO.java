package com.tap.DAO;

import java.util.List;
import com.tap.Model.OrderItem;

public interface OrderItemDAO {

    void addOrderItem(OrderItem item);

    List<OrderItem> getOrderItems(int orderId);

}