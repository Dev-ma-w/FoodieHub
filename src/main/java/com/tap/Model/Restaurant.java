package com.tap.Model;

public class Restaurant {

	
	private int RestaurantId;
	private String name;
	private String cuisineType;
	private String deliveryTime;
	private String address;
	private String ratings;
	private String imagePath;
	private String offer;
	private String priceForTwo;
	private String isActive;
	
	
	public Restaurant() {
		
	}


	public Restaurant(int restaurantId, String name, String cuisineType, String deliveryTime, String address,
			String ratings, String imagePath, String offer, String priceForTwo, String isActive) {
		super();
		RestaurantId = restaurantId;
		this.name = name;
		this.cuisineType = cuisineType;
		this.deliveryTime = deliveryTime;
		this.address = address;
		this.ratings = ratings;
		this.imagePath = imagePath;
		this.offer = offer;
		this.priceForTwo = priceForTwo;
		this.isActive = isActive;
	}


	public int getRestaurantId() {
		return RestaurantId;
	}


	public void setRestaurantId(int restaurantId) {
		RestaurantId = restaurantId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCuisineType() {
		return cuisineType;
	}


	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}


	public String getDeliveryTime() {
		return deliveryTime;
	}


	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getRatings() {
		return ratings;
	}


	public void setRatings(String ratings) {
		this.ratings = ratings;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	public String getOffer() {
		return offer;
	}


	public void setOffer(String offer) {
		this.offer = offer;
	}


	public String getPriceForTwo() {
		return priceForTwo;
	}


	public void setPriceForTwo(String priceForTwo) {
		this.priceForTwo = priceForTwo;
	}


	public String getIsActive() {
		return isActive;
	}


	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	
	
}
