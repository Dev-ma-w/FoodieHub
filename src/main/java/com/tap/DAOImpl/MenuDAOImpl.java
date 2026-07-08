package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.Model.menu;
import com.tap.utility.DBconnection;

public class MenuDAOImpl implements MenuDAO {

	public List<menu> getMenuByRestaurantId(int restaurantId) {

		List<menu> menuList = new ArrayList<>();

		try {

			Connection con = DBconnection.getConnection();

			String query = "SELECT * FROM menu WHERE restaurantId=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, restaurantId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				menu m = new menu();

				m.setMenuId(rs.getInt("menuId"));

				m.setRestaurantId(rs.getInt("restaurantId"));

				m.setItemName(rs.getString("itemName"));

				m.setDescription(rs.getString("description"));

				m.setPrice(rs.getString("price"));

				m.setRatings(rs.getString("ratings"));

				m.setImagePath(rs.getString("imagePath"));

				m.setIsAvailable(rs.getString("isAvailable"));

				menuList.add(m);
			}

		}

		catch (Exception e) {

			e.printStackTrace();
		}

		return menuList;
	}
}