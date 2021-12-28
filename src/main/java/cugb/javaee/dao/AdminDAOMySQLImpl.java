package cugb.javaee.dao;

import cugb.javaee.bean.Admin;
import cugb.javaee.bean.Users;

import java.util.ArrayList;

public class AdminDAOMySQLImpl extends baseDAO implements IAdminDAO  {


    @Override
    public ArrayList<Admin> findAdminBy(Admin admin) {
        String sql = "select adminid Adminid,adminname Adminname,password Pwd from admin where adminname=? and password=?";
        Object[] params  = {admin.getAdminName(),admin.getPwd()};
        return findObjs(sql, params,Admin.class);
    }
}
