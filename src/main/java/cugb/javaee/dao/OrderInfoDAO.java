package cugb.javaee.dao;

import cugb.javaee.bean.CartItem;
import cugb.javaee.bean.Dish;
import cugb.javaee.bean.Order;
import cugb.javaee.bean.OrderInfo;

import java.util.ArrayList;

public class OrderInfoDAO extends baseDAO{
    public ArrayList findOrderInfos() {
        String sql = "select *from orderinfo;";
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

    public int InsertOrder(CartItem cartItem,int orderid) {
        String sql="INSERT INTO orderinfo(orderid,dishname,quanity,dishid,price) VALUES(?,?,?,?,?)";
        Dish dish=cartItem.getDish();
        Object[] params={orderid,dish.getDishname(),cartItem.getQuantity(),dish.getDishid(),dish.getPrice()};
        return updateObj(sql,params);
    }

    public ArrayList findOrderInfosByUserId(int UserId) {
        String sql = "select * from orderinfo where userid=?";
        Object[] params={UserId};
        return findObjs(sql,params, OrderInfo.class);
    }

}
