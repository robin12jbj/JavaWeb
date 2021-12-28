package cugb.javaee.dao;

import cugb.javaee.bean.Dish;
import cugb.javaee.bean.Order;

import java.util.ArrayList;

public class OrderDAO extends baseDAO{
    public ArrayList findOrders() {
        String sql = "select *from order";
        return findObjs(sql,null, Order.class);
    }


    public int updateOrder(int orderid) {
        // TODO Auto-generated method stub
        //更新订单状态，未发送->已发送
        return 0;
    }


    public ArrayList<Order> findOrder(String sql, Object[] params) {
        return findObjs(sql, params,Order.class);
    }


    public int getTotalOrders() {
        String sql = "select count(*) from order;";
        return findRecords(sql);
    }

    public int InsertOrder(int orderid) {
        // TODO Auto-generated method stub
        //插入order订单数据库，orderid自增长，只需插入userid
        return 0;
    }
}
