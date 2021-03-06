<%@ page import="cugb.javaee.dao.OrderDAO" %>
<%@ page import="cugb.javaee.bean.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.bean.PageModel" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page import="cugb.javaee.biz.IDishService" %>
<%@ page import="cugb.javaee.biz.DishServiceImpl" %>
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
    ArrayList<Order> orderlist = orderDAO.findOrders();
    int c=0;while(c<orderlist.size()){
        System.out.println(orderlist.get(c).getOrderid());
        c++;
    }
    System.out.println(orderlist.size());
    int totalRecords = orderlist.size();//获取总共订单数量
    PageModel<Order> pageModel = new PageModel<Order>(totalRecords, pageNo, 6,orderlist);//构造PageModel<Order>

%>
<div class="wrapper">
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
        </ul>
    </nav>

    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a class="brand-link">
            <span class="brand-text font-weight-light">网上订餐系统</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Admin</a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="UserManage.jsp" class="nav-link">
                            <p>
                                用户管理
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <p>菜品管理<i class="right fas fa-angle-left"></i></p>
                        </a>
                        <ul class="nav nav-treeview" style="display: none">
                            <li class="nav-item" style="padding-left: 20px">
                                <a href="MenuManage.jsp" class="nav-link">
                                    <p>
                                        菜品管理
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item" style="padding-left: 20px">
                                <a href="upload.html" class="nav-link">
                                    <p>
                                        菜品添加
                                    </p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="OrderManage.jsp" class="nav-link">
                            <p>
                                订单管理
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Welcome!</h1>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content-header -->
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">在此，您可以进行用户、菜品和订单管理</h3>
                            </div>
                            <div class="card-body">
                                <div class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6"></div>
                                        <div class="col-sm-12 col-md-6"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="table" class="table table-bordered table-hover dataTable dtr-inline">
                                                <thead>
                                                <tr>
                                                    <th class="sorting sorting_asc" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-sort="ascending" aria-label="订单编号">订单编号</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="用户编号">用户编号</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="情况">情况</th>
                                                    <th tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="操作">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%

                                                    int size=pageModel.getList().size();
                                                    int i=0;
                                                    while(i<size)
                                                    {
                                                        Order orders=pageModel.getList().get(i);
                                                %>
                                                <tr class="odd">
                                                    <td><%=orders.getOrderid()%></td>
                                                    <td><%=orders.getUserid()%></td>
                                                    <td><%=orders.getState()%></td>
                                                    <td class="sorting-1">
                                                        <a href="OrderControl?orderid=<%=orders.getOrderid()%>"><input type="button" class="btn btn-success" name="<%=orders.getOrderid()%>"  value="发货" ></a>
                                                    </td>
                                                </tr>
                                                <%
                                                        i++;}
                                                %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-left:40%">
                                        <TR>
                                            <%--下面为分页功能--%>
                                            <TD align="center">
                                                <nav class="center-block">
                                                    <ul class="pagination">
                                                        <li class="page-item">
                                                            <a id="btnTopPage" class="page-link"
                                                               href="OrderManage.jsp?&pageNo=<%=pageModel.getTop()%>"
                                                               title="首页">|&lt;&lt; </a>&nbsp;
                                                        </li>
                                                        <li class="page-item">
                                                            <a id="btnPreviousPage" class="page-link"
                                                               href="OrderManage.jsp?&pageNo=<%=pageModel.getPrev()%>"
                                                               title="上页" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                                                        </li>
                                                        <%
                                                            int j=0;
                                                            while(j<pageModel.getTotalPages()){

                                                        %>
                                                        <li class="page-item <% if(pageModel.getPageNo()==j+1){ %> active <%} %>" ><a class="page-link"><%=j+1%></a></li>
                                                        <%
                                                                j++;
                                                            }
                                                        %>
                                                        <li class="page-item">
                                                            <a id="btnNextPage" class="page-link"
                                                               href="OrderManage.jsp?&pageNo=<%=pageModel.getNext()%>"
                                                               title="下页" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a id="btnBottomPage" class="page-link"
                                                               href="OrderManage.jsp?&pageNo=<%=pageModel.getBottom()%>"
                                                               title="尾页"> &gt;&gt;|</a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </TD>
                                        </TR>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>

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
