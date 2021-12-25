package cugb.javaee.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

public interface IDishDAO {

	/***
	 * findDishes
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

	ArrayList findDishesBy(String sql, Object[] params);

	int getTotalDishRecords();

}
