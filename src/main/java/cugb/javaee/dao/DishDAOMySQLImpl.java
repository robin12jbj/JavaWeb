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
	public int updateDish(int dishid, String dishname, String dishdescrp, double dishprice, String dishimag,String material) {
		String sql="update dish set name=?,price=?,description=?,img=?,material=? where dishid=?";
		Object[] params={dishname,dishprice,dishdescrp,dishimag,material,dishid};
		return updateObj(sql,params);

	}

	@Override
	public ArrayList<Dish> findDishesBy(String sql, Object[] params) {
			return findObjs(sql, params,Dish.class);
	}

	@Override
	public int getTotalDishRecords() {
		String sql = "select count(*) from dish;";
		return findRecords(sql);
	}

	@Override
	public int deleteDish(int dishid) {
		String sql="delete from dish where dishid = ?";
		Object[] params = {dishid};
		return updateObj(sql,params);
	}

    @Override
    public int insertDish(int dishid,String dishname,Double dishprice,String dishdescrp,String dishimag,String material) {
		String	sql="insert into dish values(?,?,?,?,?,?)";
		Object[] params={dishid,dishname,dishprice,dishdescrp,dishimag,material};
        return updateObj(sql,params);
    }

}
