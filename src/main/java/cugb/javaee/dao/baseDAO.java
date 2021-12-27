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
				//��ȡ��ѯ����еĵ�һ�����ݣ�Ϊcount(*),�ܹ���Ʒ����
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
			System.out.println(sql);
			PreparedStatement ps = conn.prepareStatement(sql);
			if (params != null) {
				ParameterMetaData psmeta = ps.getParameterMetaData();
				for (int i = 0; i < psmeta.getParameterCount(); i++) {
					ps.setObject(i + 1, params[i]);
				}
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Object obj = MappingObj(rs, clazz);
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
			PreparedStatement ps = conn.prepareStatement(sql);
			ParameterMetaData psmeta = ps.getParameterMetaData();
			for (int i = 0; i < psmeta.getParameterCount(); i++) {
				ps.setObject(i + 1, params[i]);
			}

			records = ps.executeUpdate();
			// step free
			JDBCUtils.free(null, ps, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return records;

	}

	private Object MappingObj(ResultSet rs, Class clazz) throws SQLException {
		// ʵ��������
		Object obj;
		try {
			obj = clazz.newInstance();
			// ��ȡӳ�����ķ�������
			Method[] methods = clazz.getMethods();
			// ��ȡ�������Ԫ������Ϣ
			ResultSetMetaData meta = rs.getMetaData();
			// ���ֶ���Ŀѭ��������м�¼�����ж���ӳ��
			int j = meta.getColumnCount();
			for (int i = 1; i <= meta.getColumnCount(); i++) {
				// ���쵱ǰ�е�set��������
				String colname = meta.getColumnLabel(i);
				String methodname = "set" + colname;
				// ѭ������ͬ����������ͨ��������ø÷�������������ֵ
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