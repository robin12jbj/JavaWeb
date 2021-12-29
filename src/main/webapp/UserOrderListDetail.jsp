<%@ page import="cugb.javaee.dao.OrderDAO" %>
<%@ page import="cugb.javaee.dao.OrderInfoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.bean.OrderInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    该页面根据用户订单id展示对应的详细内容--%>
</head>
<body>
<a href="UserOrderList.jsp">返回我的订单</a>
<%
//获取orderid
    int orderid=Integer.parseInt(request.getParameter("orderid"));
    OrderInfoDAO orderInfoDAO=new OrderInfoDAO();
    ArrayList<OrderInfo> orderInfoArrayList=orderInfoDAO.findOrderInfoByOrderId(orderid);
    ArrayList infos = orderInfoDAO.findOrderInfos();
    OrderInfo test = (OrderInfo)infos.get(0);
    System.out.println(test.getDishname());

%>
<table>
    <th>订单编号</th>
    <th>菜品名称</th>
    <th>菜品数量</th>
    <th>菜品单价</th>
    <%
        int i=0;
        while (i<orderInfoArrayList.size()){
            OrderInfo item=orderInfoArrayList.get(i);
    %>
    <tr>
        <td><%=item.getOrderid()%></td>
        <td><%=item.getDishname()%></td>
        <td><%=item.getQuanity()%></td>
        <td><%=item.getPrice()%></td>
    </tr>
    <%

    i++;}
    %>
</table>
</body>
</html>
