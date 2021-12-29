package cugb.javaee.dao;

import cugb.javaee.bean.Dish;
import cugb.javaee.bean.Order;
import cugb.javaee.util.DAOFactory;

import java.util.ArrayList;

public class OrderDAO extends baseDAO{
    public ArrayList findOrders() {
        String sql = "select orderid Orderid,userid Userid,state State from orderlist;";
        return findObjs(sql,null, Order.class);
    }
    public ArrayList findOrdersByUserId(int userid) {
        String sql = "select orderid Orderid,userid Userid,state State from orderlist where userid = ? ";
        Object[] params={userid};
        return findObjs(sql,params, Order.class);
    }
    public ArrayList findOrderPageList(int pageNo, int pageSize) {
        String sql = "select * from orderlist limit ?,?";
        Object[] params ={(pageNo-1)*pageSize,pageSize};//返回mysql中指定行数和指定数量的订单数量
        return findObjs(sql,params,Order.class);//此处能够成功返回订单列表，并且属性已填充

    }

    public int updateOrder(int orderid) {
        //更新订单状态，未发送->已发送
        String sql="update orderlist set state='已发货' where orderid=?";
        Object[] params={orderid};
        return updateObj(sql,params);
    }


    public ArrayList<Order> findOrder(String sql, Object[] params) {
        return findObjs(sql, params,Order.class);
    }


    public int getTotalOrders() {
        String sql = "select count(*) from orderlist";
        return findRecords(sql);
    }

    public int InsertOrder(int userid) {
        // TODO Auto-generated method stub
        //插入order订单数据库，orderid自增长，只需插入userid
        String sql="insert into orderlist(userid) values(?)";
        Object[] params={userid};
        return updateObj(sql,params);
    }


}
