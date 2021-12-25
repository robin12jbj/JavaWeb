package cugb.javaee.dao;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.ParameterMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import cugb.javaee.bean.Users;
import cugb.javaee.util.JDBCUtils;

public class baseDAO {

	/***
	 * 
	 * @param sql select count(*) from tablename;
	 * @return
	 */
	public int findRecords(String sql) {
		try {
			Connection conn = JDBCUtils.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

	public ArrayList findObjs(String sql, Object[] params, Class clazz) {
		ArrayList userarray = new ArrayList();
		try {
			Connection conn = JDBCUtils.getConnection();
			// step 3 statement
//				String sql = "select * from users";
			PreparedStatement ps = conn.prepareStatement(sql);
			if (params != null) {
				ParameterMetaData psmeta = ps.getParameterMetaData();
				for (int i = 0; i < psmeta.getParameterCount(); i++) {
					ps.setObject(i + 1, params[i]);
				}
			}
			// step 4 resultset
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				// System.out.println(rs.getString("userid") + "," +rs.getString("username") +
				// ","
				// + rs.getString("password"));
//					Users users = new Users();
				Object obj = MappingObj(rs, clazz);
//					users.setUserid(rs.getShort("userid"));
//					users.setUsername(rs.getString("username"));
//					users.setPwd(rs.getString("password"));
				userarray.add(obj);
			}
			// step free
			JDBCUtils.free(rs, ps, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userarray;
	}

	public int updateObj(String sql, Object[] params) {
		int records = 0;
		try {
			Connection conn = JDBCUtils.getConnection();
			// step 3 statement
//			String sql = "update users set password=? where userid=?";			
			PreparedStatement ps = conn.prepareStatement(sql);
			ParameterMetaData psmeta = ps.getParameterMetaData();
			for (int i = 0; i < psmeta.getParameterCount(); i++) {
				ps.setObject(i + 1, params[i]);
			}
//			ps.setString(1, pwd);
//			ps.setInt(2, userid);
			records = ps.executeUpdate();
			// step free
			JDBCUtils.free(null, ps, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return records;

	}

	private Object MappingObj(ResultSet rs, Class clazz) throws SQLException {
		// Users users = new Users();
		// users.setUserid(rs.getInt(1));
		// users.setUsername(rs.getString(2));
		// users.setPassword(rs.getString("password"));
		// 实例化对象
		Object obj;
		try {
			obj = clazz.newInstance();
			// 获取映射对象的方法集合
			Method[] methods = clazz.getMethods();
			// 获取结果集中元数据信息
			ResultSetMetaData meta = rs.getMetaData();
			// 按字段数目循环结果集中记录，进行对象映射
			int j = meta.getColumnCount();
			for (int i = 1; i <= meta.getColumnCount(); i++) {
				// 构造当前列的set方法名称
				String colname = meta.getColumnLabel(i);
				String methodname = "set" + colname;
				// 循环查找同名方法，并通过反射调用该方法，设置属性值
				for (Method method : methods) {
					if (method.getName().equals(methodname)) {
						Object rsobj = rs.getObject(i);
						method.invoke(obj, rsobj);
						break;
					}
				}
			}
			return obj;
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}