<%@ page import="cugb.javaee.dao.OrderDAO" %>
<%@ page import="cugb.javaee.bean.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.bean.PageModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理</title>
<%--管理员管理订单，发货--%>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body>
<%
    int pageNo=1;
    if(request.getParameter("pageNo")!=null)
    {
        //传递了pageNo参数，证明管理员不是第一次进入
        pageNo=Integer.parseInt(request.getParameter("pageNo"));
    }
    OrderDAO orderDAO=new OrderDAO();
    ArrayList<Order> orderlist =orderDAO.findOrders();//获得订单的数组
    int totalRecords = orderlist.size();//获取总共订单数量
    PageModel<Order> pageModel = new PageModel<Order>(totalRecords, pageNo, 6,orderlist);//构造PageModel<Order>

%>
<footer class="main-footer">
    <strong>Copyright &copy; 2021 JavaWeb</strong>
</footer>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

</body><div id="edge-translate-notifier-container" class="edge-translate-notifier-center"></div></html>
