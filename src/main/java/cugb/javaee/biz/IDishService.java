package cugb.javaee.biz;


import java.util.ArrayList;

public interface IDishService {

	/***
	 * 分页查询
	 * @param pageNo 当前页码
	 * @param pageSize 页面大小
	 * @return 当前页的所有记录
	 */
	public ArrayList findDish4PageList(int pageNo, int pageSize);
	
	/***
	 * 
	 * @return
	 */
	public int getTotalRecords();


	public ArrayList findDishes();//成功

	public ArrayList findDishesBy(int dishid);//根据菜号找到菜品详细内容
}
