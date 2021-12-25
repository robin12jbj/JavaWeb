package cugb.javaee.biz;


import java.util.ArrayList;
import cugb.javaee.dao.IDishDAO;
import cugb.javaee.util.DAOFactory;

public class DishServiceImpl implements IDishService {

	@Override
	public ArrayList findDish4PageList(int pageNo, int pageSize) {
		IDishDAO dishDAO = (IDishDAO) DAOFactory.newInstance("IDishDAO");
		String sql = "select dishid Dishid,name Dishname,price Price,img Imag,"
				+ "description Descrp from dish limit ?,?";
		Object[] params ={(pageNo-1)*pageSize,pageSize};
		return dishDAO.findDishesBy(sql,params);
		
	}

	@Override
	public int getTotalRecords() {
		IDishDAO dishDAO = (IDishDAO) DAOFactory.newInstance("IDishDAO");
		return dishDAO.getTotalDishRecords();
	}	

}
