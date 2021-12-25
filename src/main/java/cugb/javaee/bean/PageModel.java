package cugb.javaee.bean;

import java.util.ArrayList;

public class PageModel<T> {

	// ÿҳ��ʾ��¼��
	private int pageSize;
	// ���м�¼��
	private int totalRecords;
	// ��ǰҳ��
	private int pageNo;
	// ��ǰҳ�����м�¼
	private ArrayList<T> list;
	
	

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public ArrayList<T> getList() {
		return list;
	}
	public void setList(ArrayList<T> list) {
		this.list = list;
	}
	public PageModel(int totalRecords,int pageNo,int pageSize,ArrayList<T> list){
		this.totalRecords = totalRecords;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.list = list;
	}
	/***
	 * ����ҳ����
	 * 
	 * @return
	 */
	public int getTotalPages() {
		return (totalRecords + pageSize - 1) / pageSize;
	}

	/***
	 * ��ҳ
	 * 
	 * @return
	 */
	public int getTop() {
		return 1;
	}

	/***
	 * ��һҳ
	 * 
	 * @return
	 */
	public int getNext() {
		if (pageNo < getTotalPages()) {
			return pageNo + 1;
		} else {
			return getTotalPages();
		}
	}

	/***
	 * ��һҳ
	 * 
	 * @return
	 */
	public int getPrev() {
		if (pageNo > 1) {
			return pageNo - 1;
		} else
			return 1;
	}

	/***
	 * βҳ
	 * 
	 * @return
	 */
	public int getBottom() {
		return getTotalPages();
	}
}
