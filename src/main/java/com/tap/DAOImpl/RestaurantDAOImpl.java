package com.tap.DAOImpl;
import java.sql.PreparedStatement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.Model.Restaurant;
import com.tap.utility.DBconnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	public List<Restaurant> getAllRestaurants() {

		List<Restaurant> restaurantList = new ArrayList<>();

		try {

			Connection con = DBconnection.getConnection();

			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery("SELECT * FROM restaurant");

			while (rs.next()) {

				Restaurant r = new Restaurant();

				r.setRestaurantId(rs.getInt("restaurantId"));

				r.setName(rs.getString("name"));

				r.setCuisineType(rs.getString("cuisineType"));

				r.setDeliveryTime(rs.getString("deliveryTime"));

				r.setAddress(rs.getString("address"));

				r.setRatings(rs.getString("ratings"));

				r.setImagePath(rs.getString("imagePath"));

				r.setOffer(rs.getString("offer"));

				r.setPriceForTwo(rs.getString("priceForTwo"));

				r.setIsActive(rs.getString("isActive"));

				restaurantList.add(r);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return restaurantList;
	}

public List<Restaurant> searchRestaurant(String keyword) {

    List<Restaurant> restaurantList = new ArrayList<>();

    try {

        Connection con = DBconnection.getConnection();

        String query =
                "SELECT * FROM restaurant " +
                "WHERE name LIKE ? " +
                "OR cuisineType LIKE ?";

        PreparedStatement pstmt =
                con.prepareStatement(query);

        pstmt.setString(1, "%" + keyword + "%");
        pstmt.setString(2, "%" + keyword + "%");

        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {

            Restaurant r = new Restaurant();

            r.setRestaurantId(rs.getInt("restaurantId"));
            r.setName(rs.getString("name"));
            r.setCuisineType(rs.getString("cuisineType"));
            r.setDeliveryTime(rs.getString("deliveryTime"));
            r.setAddress(rs.getString("address"));
            r.setRatings(rs.getString("ratings"));
            r.setImagePath(rs.getString("imagePath"));
            r.setOffer(rs.getString("offer"));
            r.setPriceForTwo(rs.getString("priceForTwo"));
            r.setIsActive(rs.getString("isActive"));

            restaurantList.add(r);
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return restaurantList;
}


public Restaurant getRestaurantById(int restaurantId) {

    Restaurant r = null;

    try {

        Connection con =
                DBconnection.getConnection();

        String query =
                "SELECT * FROM restaurant WHERE restaurantId=?";

        PreparedStatement pstmt =
                con.prepareStatement(query);

        pstmt.setInt(1, restaurantId);

        ResultSet rs =
                pstmt.executeQuery();

        if(rs.next()) {

            r = new Restaurant();

            r.setRestaurantId(rs.getInt("restaurantId"));
            r.setName(rs.getString("name"));
            r.setCuisineType(rs.getString("cuisineType"));
            r.setDeliveryTime(rs.getString("deliveryTime"));
            r.setAddress(rs.getString("address"));
            r.setRatings(rs.getString("ratings"));
            r.setImagePath(rs.getString("imagePath"));
            r.setOffer(rs.getString("offer"));
            r.setPriceForTwo(rs.getString("priceForTwo"));
            r.setIsActive(rs.getString("isActive"));
        }

    }
    catch(Exception e) {

        e.printStackTrace();
    }

    return r;
}

@Override
public List<Restaurant> getRestaurantsByCuisine(String cuisineType) {

    List<Restaurant> restaurants = new ArrayList<>();

    String query =
            "SELECT * FROM restaurant WHERE cuisineType LIKE ?";

    try {

        Connection con =
                DBconnection.getConnection();

        PreparedStatement pstmt =
                con.prepareStatement(query);

        pstmt.setString(1, "%" + cuisineType + "%");

        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {

            Restaurant r = new Restaurant();

            r.setRestaurantId(rs.getInt("restaurantId"));
            r.setName(rs.getString("name"));
            r.setCuisineType(rs.getString("cuisineType"));
            r.setAddress(rs.getString("address"));
            r.setRatings(rs.getString("ratings"));
            r.setDeliveryTime(rs.getString("deliveryTime"));
            r.setImagePath(rs.getString("imagePath"));

            restaurants.add(r);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return restaurants;
}
}
