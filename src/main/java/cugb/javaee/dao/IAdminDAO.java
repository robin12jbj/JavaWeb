package cugb.javaee.dao;

import cugb.javaee.bean.Admin;
import cugb.javaee.bean.Users;

import java.util.ArrayList;

public interface IAdminDAO {
    public ArrayList<Admin> findAdminBy(Admin admin);


}
