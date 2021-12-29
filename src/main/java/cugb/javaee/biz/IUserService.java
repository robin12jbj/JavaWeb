package cugb.javaee.biz;


import cugb.javaee.bean.Users;

import java.util.ArrayList;

public interface IUserService {
	/***
	 * validateUser
	 * @param users
	 * @return
	 */
	public boolean validateUser(Users users);

}
