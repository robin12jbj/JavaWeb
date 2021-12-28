package cugb.javaee.biz;


import java.util.ArrayList;
import cugb.javaee.dao.IDishDAO;
import cugb.javaee.util.DAOFactory;

public class DishServiceImpl implements IDishService {

	@Override
	public ArrayList findDish4PageList(int pageNo, int pageSize) {
		IDishDAO dishDAO = (IDishDAO) DAOFactory.newInstance("IDishDAO");
		String sql = "select dishid Dishid,name Dishname,price Price,img Imag,"
				+ "description Descrp,material Dishmaterial from dish limit ?,?";
		Object[] params ={(pageNo-1)*pageSize,pageSize};//返回mysql中指定行数和指定数量的菜品
		return dishDAO.findDishesBy(sql,params);//此处能够成功返回菜品列表，并且属性已填充
		
	}

	@Override
	public int getTotalRecords() {
		IDishDAO dishDAO = (IDishDAO) DAOFactory.newInstance("IDishDAO");
		return dishDAO.getTotalDishRecords();
	}

	@Override
	public ArrayList findDishes() {
		IDishDAO dishDAO = (IDishDAO) DAOFactory.newInstance("IDishDAO");
		String sql ="select dishid Dishid,name Dishname,price Price,img Imag,"
				+ "description Descrp,material Dishmaterial from dish ";
		Object[] params ={};//返回mysql中指定行数和指定数量的菜
		return dishDAO.findDishesBy(sql,params);//可以获得Dish
	}

	public ArrayList findDishesBy(int dishid){
		IDishDAO dishDAO = (IDishDAO) DAOFactory.newInstance("IDishDAO");
		String  sql2 ="select dishid Dishid,name Dishname,price Price,img Imag,"
				+ "description Descrp,material Dishmaterial from dish where dishid = ?";
		Object[] params ={dishid};//返回mysql中指定行数和指定数量的菜
		return dishDAO.findDishesBy(sql2,params);
	}


}
