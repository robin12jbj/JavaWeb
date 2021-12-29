package cugb.javaee.dao;

import cugb.javaee.bean.Dish;

import java.sql.Timestamp;
import java.util.ArrayList;

public interface IDishDAO {

	/***
	 * findDishesBy
	 * @return
	 */
	ArrayList findDishes();

	/***
	 * updateDish
	 * @param dishid
	 * @param dishname
	 * @return
	 */
	int updateDish(int dishid, String dishname);
	int updateDish(int dishid,String dishname,String dishdescrp,double dishprice,String dishimag,String material);

	ArrayList findDishesBy(String sql, Object[] params);

	int getTotalDishRecords();

	int deleteDish(int dishid);
	public int insertDish(int dishid,String dishname,Double dishprice,String dishdescrp,String dishimag,String material);

}
