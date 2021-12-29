<%@ page import="cugb.javaee.dao.OrderDAO" %>
<%@ page import="cugb.javaee.dao.OrderInfoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.bean.OrderInfo" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="cugb.javaee.util.JDBCUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<%--    该页面根据用户订单id展示对应的详细内容--%>
</head>
<body>
<%
//获取orderid
    int orderid=Integer.parseInt(request.getParameter("orderid"));
    OrderInfo orderInfo=new OrderInfo();
    ArrayList<OrderInfo> orderInfoArrayList=new ArrayList<>();
    Connection conn = JDBCUtils.getConnection();
    String sql="select *from orderinfo where orderid=?";
    PreparedStatement ps = null;
    ps = conn.prepareStatement(sql);
    try {
        ps.setObject(1,orderid);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    try {

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            //获取查询结果中的第一行数据，为count(*),总共菜品数量
            int id=rs.getInt(1);
            //System.out.println(id);
            int orderid2=rs.getInt(2);
            String dishname=rs.getString(3);
            int quanity=rs.getInt(4);
            int dishid=rs.getInt(5);
            double price=rs.getInt(6);
            OrderInfo test=new OrderInfo();
            test.setId(id);test.setOrderid(orderid2);test.setDishname(dishname);test.setQuanity(quanity);
            test.setDishid(dishid);test.setPrice(price);
            orderInfoArrayList.add(test);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }


%>
<header class="container">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="font-size: large" href="#">网上订餐系统</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="logincheck?action=pagelist&pageNo=1">网站首页</a></li>
                    <li><a href="about.html">关于我们</a></li>
                    <li><a href="help.html">订餐帮助</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container" style="padding-left: 15px">
    <div class="page-header">
            <h2>订单详情</h2>
    </div>

    <table class="table table-striped">
        <thead>
        <th>订单编号</th>
        <th>菜品名称</th>
        <th>菜品数量</th>
        <th>菜品单价</th>
        </thead>
        <tbody>
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
        </tbody>
    </table>
</div>

<div class="container">
    <div class="row">
        <a class="btn btn-success btn-block center-block" style="width: 30%" href="UserOrderList.jsp">返回我的订单</a>
    </div>
</div>


<div class="container">
    <hr>
    <footer>
        <p class="text-center">&copy; 2021 JavaWeb</p>
    </footer>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>
