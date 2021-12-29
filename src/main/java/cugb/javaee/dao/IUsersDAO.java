package cugb.javaee.dao;

import java.util.ArrayList;

import cugb.javaee.bean.Users;

public interface IUsersDAO {

	/***
	 * 
	 * @param users
	 * @return
	 */
	public ArrayList<Users> findUsersBy(Users users);
	/***
	 * findUsers
	 * @return
	 */
	ArrayList findUsers();

	/***
	 * updateUser
	 * @param userid
	 * @param pwd
	 * @return
	 */
	int updateUser(int userid, String pwd);

	int updateUser(int userid, String pwd,String username);
	/***
	 * insertUser
	 *
	 * @param userid
	 * @param username
	 * @param userpassword
	 * @return
	 */
	int insertUser(int userid,String username,String userpassword);

	public int deleteUser(int userid);

	public ArrayList findUsersPageList(int pageNo,int pageSize);

	public ArrayList findUsersBy(String sql,Object[] params);

}