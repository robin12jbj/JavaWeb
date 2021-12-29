package cugb.javaee.dao;

import java.util.ArrayList;

import cugb.javaee.bean.Users;

public class UsersDAOMySQLImpl extends baseDAO implements IUsersDAO {

	@Override
	public ArrayList findUsers() {
		String sql = "select userid Userid,username Username,password Pwd from users";
		return findObjs(sql, null,Users.class);
	}

	@Override
	public int updateUser(int userid, String pwd) {
		String sql = "update users set password=? where userid=?";
		Object[] params = {pwd,userid};
		return updateObj(sql, params);
	}

	@Override
	public int updateUser(int userid, String pwd, String username) {
		String sql = "update users set password=? ,username = ?  where userid=?";
		Object[] params = {pwd,username,userid};
		System.out.println("到达此处！");
		return updateObj(sql, params);
	}

	@Override
	public int insertUser(int userid, String username, String userpassword) {
		String sql = "insert into users values(?,?,?)";
		Object[] params = {userid,username,userpassword};
		return updateObj(sql, params);
		//更新成功，返回值为影响的行数
		//更新失败，返回值为0
	}

	@Override
	public ArrayList<Users> findUsersBy(Users users) {
		String sql = "select userid Userid,username Username,password Pwd from users where username=? and password=?";
		Object[] params  = {users.getUsername(),users.getPwd()};
		return findObjs(sql, params,Users.class);
	}

	public int deleteUser(int userid){
		String sql="delete from users where userid = ?";
		Object[] params={userid};
		return  updateObj(sql,params);
	}

	@Override
	public ArrayList<Users> findUsersPageList(int pageNo, int pageSize) {
		String sql = "select *from users limit ?,?";
		Object[] params ={(pageNo-1)*pageSize,pageSize};//返回mysql中指定行数和指定数量的用户
		return findObjs(sql,params,Users.class);//此处能够成功返回用户列表，并且属性已填充

	}

    @Override
    public ArrayList findUsersBy(String sql, Object[] params) {
        return  findObjs(sql,params,Users.class);
    }
}
