package cugb.javaee.biz;


import java.util.ArrayList;

public interface IDishService {

	/***
	 * ��ҳ��ѯ
	 * @param pageNo ��ǰҳ��
	 * @param pageSize ҳ���С
	 * @return ��ǰҳ�����м�¼
	 */
	public ArrayList findDish4PageList(int pageNo, int pageSize);
	
	/***
	 * 
	 * @return
	 */
	public int getTotalRecords();

	public ArrayList findDishes();
}
