package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.Model.Order;
import com.tap.utility.DBconnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public int addOrder(Order order) {

        int orderId = 0;

        try {

            Connection con = DBconnection.getConnection();

            String sql =
            "INSERT INTO orders(userId,restaurantId,totalAmount,status,paymentMethod) VALUES(?,?,?,?,?)";

            PreparedStatement pstmt =
            con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getRestaurantId());
            pstmt.setDouble(3, order.getTotalAmount());
            pstmt.setString(4, order.getStatus());
            pstmt.setString(5, order.getPaymentMethod());

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();

            if(rs.next()){

                orderId = rs.getInt(1);

            }

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return orderId;
    }


    @Override
    public List<Order> getOrdersByUser(int userId) {

        List<Order> orders = new ArrayList<>();

        try {

            Connection con = DBconnection.getConnection();

            String sql =
            "SELECT * FROM orders WHERE userId=? ORDER BY orderId DESC";

            PreparedStatement pstmt =
            con.prepareStatement(sql);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()){

                Order order = new Order();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setOrderDate(rs.getTimestamp("orderDate"));

                orders.add(order);

            }

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return orders;
    }


    @Override
    public Order getOrder(int orderId) {

        Order order = null;

        try {

            Connection con = DBconnection.getConnection();

            String sql =
            "SELECT * FROM orders WHERE orderId=?";

            PreparedStatement pstmt =
            con.prepareStatement(sql);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()){

                order = new Order();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setOrderDate(rs.getTimestamp("orderDate"));

            }

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return order;
    }

}