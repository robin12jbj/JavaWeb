<%@ page import="java.util.Set" %>
<%@ page import="cugb.javaee.biz.IDishService" %>
<%@ page import="cugb.javaee.util.DAOFactory" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.bean.*" %>
<%@ page import="cugb.javaee.dao.UsersDAOMySQLImpl" %>
<%@ page import="cugb.javaee.dao.OrderDAO" %>
<%@ page import="cugb.javaee.dao.OrderInfoDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%--展示订单交易成功界面--%>
<body>
<%
//通过session中的cart
    Cart myCart=(Cart)(session.getAttribute("menus"));//我的购物车
    Set myset=myCart.getMenus().keySet();
    Object[] keys=myset.toArray();

    //生成用户订单order
    Order newOrder=new Order();
    Users users=(Users)(session.getAttribute("user"));
    int userid=users.getUserid();
    newOrder.setUserid(userid);
    OrderDAO orderDAO=new OrderDAO();
    orderDAO.InsertOrder(userid);//添加order信息到orderlist表中
    ArrayList<Order> orderlist=orderDAO.findOrders();
    int orderid=orderlist.get(orderlist.size()-1).getOrderid();
    //获取刚刚添加的orderid
    System.out.println("新的订单编号为:"+orderid);
    //测试成功
    //将所有订单详细信息添加到orderinfo表中
    OrderInfoDAO orderInfoDAO=new OrderInfoDAO();
    System.out.println("keys.length"+keys.length);
    int i=0;
    while (i<keys.length){
        CartItem cartItem=(CartItem) (myCart.getMenus().get(keys[i]));
        orderInfoDAO.InsertOrder(cartItem,orderid);
        i++;
    }
    //信息添加完毕
    session.setAttribute("menus",new Cart());//删除购物车，添加新的购物车
//    PrintWriter tip=response.getWriter();
//    tip.println("<script language=javascript>alert('支付成功!');</script>");
    RequestDispatcher rd = request.getRequestDispatcher("/logincheck?action=pagelist&pageNo=1");
    rd.forward(request, response);

%>
</body>
</html>
