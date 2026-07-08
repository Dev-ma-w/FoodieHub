package com.tap.Model;

public class menu {

    private int menuId;
    private int restaurantId;
    private String itemName;
    private String description;
    private String price;
    private String ratings;
    private String imagePath;
    private String isAvailable;

    public menu() {

    }

    public menu(int menuId, int restaurantId, String itemName,
            String description, String price,
            String ratings, String imagePath,
            String isAvailable) {

        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
        this.ratings = ratings;
        this.imagePath = imagePath;
        this.isAvailable = isAvailable;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
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

    public String getIsAvailable() {
        return isAvailable;
    }

    @Override
	public String toString() {
		return "menu [menuId=" + menuId + ", restaurantId=" + restaurantId + ", itemName=" + itemName + ", description="
				+ description + ", price=" + price + ", ratings=" + ratings + ", imagePath=" + imagePath
				+ ", isAvailable=" + isAvailable + "]";
	}

	public void setIsAvailable(String isAvailable) {
        this.isAvailable = isAvailable;
    }
}