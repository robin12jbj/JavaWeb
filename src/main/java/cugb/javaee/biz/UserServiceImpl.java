package cugb.javaee.biz;

import cugb.javaee.bean.Users;
import cugb.javaee.dao.IUsersDAO;
import cugb.javaee.util.DAOFactory;

public class UserServiceImpl implements IUserService {


	public boolean validateUser(Users users) {
		// UsersDAO userdao = new UsersDAOImpl();
		IUsersDAO userdao = (IUsersDAO) DAOFactory.newInstance("IUsersDAO");
		if (userdao.findUsersBy(users).size() > 0) {
			return true;
		} else {
			return false;
		}
	}
}
