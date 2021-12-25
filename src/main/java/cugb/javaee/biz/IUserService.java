package cugb.javaee.biz;


import cugb.javaee.bean.Users;

public interface IUserService {
	/***
	 * validateUser
	 * @param users
	 * @return
	 */
	public boolean validateUser(Users users);
}
