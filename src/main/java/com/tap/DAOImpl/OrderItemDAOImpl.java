package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.Model.OrderItem;
import com.tap.utility.DBconnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public void addOrderItem(OrderItem item) {

        try {

            Connection con = DBconnection.getConnection();

            String sql =
            "INSERT INTO orderitems(orderId,menuId,quantity) VALUES(?,?,?)";

            PreparedStatement pstmt =
            con.prepareStatement(sql);

            pstmt.setInt(1, item.getOrderId());
            pstmt.setInt(2, item.getMenuId());
            pstmt.setInt(3, item.getQuantity());

            pstmt.executeUpdate();

        }
        catch(Exception e){

            e.printStackTrace();

        }

    }


    @Override
    public List<OrderItem> getOrderItems(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        try {

            Connection con = DBconnection.getConnection();

            String sql =
            "SELECT * FROM orderitems WHERE orderId=?";

            PreparedStatement pstmt =
            con.prepareStatement(sql);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()){

                OrderItem item = new OrderItem();

                item.setOrderItemId(rs.getInt("orderItemId"));
                item.setOrderId(rs.getInt("orderId"));
                item.setMenuId(rs.getInt("menuId"));
                item.setQuantity(rs.getInt("quantity"));

                items.add(item);

            }

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return items;
    }

}