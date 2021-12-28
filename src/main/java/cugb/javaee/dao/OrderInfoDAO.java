package cugb.javaee.dao;

import cugb.javaee.bean.Order;
import cugb.javaee.bean.OrderInfo;

import java.util.ArrayList;

public class OrderInfoDAO extends baseDAO{
    public ArrayList findOrderInfos() {
        String sql = "select *from orderinfo";
        return findObjs(sql,null, Order.class);
    }


    public int updateOrder(int orderid) {
        // TODO Auto-generated method stub

        return 0;
    }


    public ArrayList<OrderInfo> findOrderInfo(String sql, Object[] params) {
        return findObjs(sql, params,Order.class);
    }


    public int getTotalOrderInfos() {
        String sql = "select count(*) from orderinfo;";
        return findRecords(sql);
    }

    public int InsertOrder(int userid) {
        // TODO Auto-generated method stub
        //根据
        //插入
        return 0;
    }

}
