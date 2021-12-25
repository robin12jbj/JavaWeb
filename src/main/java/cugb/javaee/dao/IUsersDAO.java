package cugb.javaee.dao;

import java.sql.Timestamp;
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

	/***
	 * insertUser
	 * @param dt
	 * @return
	 */
	int insertUser(Timestamp dt);

}