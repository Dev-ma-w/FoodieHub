package com.tap.DAO;

import java.util.List;

import com.tap.Model.Restaurant;

public interface RestaurantDAO {

	List<Restaurant> getAllRestaurants();

	List<Restaurant> searchRestaurant(String keyword);
	
	Restaurant getRestaurantById(int restaurantId);

	List<Restaurant> getRestaurantsByCuisine(String cuisineType);

	
}
