package com.tap.DAO;

import java.util.List;

import com.tap.Model.menu;

public interface MenuDAO {

    List<menu> getMenuByRestaurantId(int restaurantId);

}