package cugb.javaee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cugb.javaee.bean.Dish;
import cugb.javaee.bean.Users;
import cugb.javaee.util.JDBCUtils;

public class DishDAOMySQLImpl extends baseDAO implements IDishDAO {

	@Override
	public ArrayList findDishes() {
		String sql = "select *from dish";
		return findObjs(sql,null, Dish.class);
	}

	@Override
	public int updateDish(int dishid, String dishname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList findDishesBy(String sql, Object[] params) {
			return findObjs(sql, params,Dish.class);
	}

	@Override
	public int getTotalDishRecords() {
		String sql = "select count(*) from dish;";
		return findRecords(sql);
	}

}
