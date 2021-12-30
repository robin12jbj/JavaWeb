<%@ page import="cugb.javaee.dao.IDishDAO" %>
<%@ page import="cugb.javaee.dao.DishDAOMySQLImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page import="cugb.javaee.bean.Admin" %>
<%@ page import="cugb.javaee.dao.IAdminDAO" %>
<%@ page import="cugb.javaee.util.DAOFactory" %>
<%@ page import="cugb.javaee.biz.IDishService" %>
<%@ page import="cugb.javaee.bean.PageModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员主界面</title>

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
    int pageNo = 1;
    String adminname = request.getParameter("loginName");
    String password = request.getParameter("loginPass");
    Admin admin = new Admin();
    admin.setAdminName(adminname);
    admin.setPwd(password);
    IAdminDAO adminDAO = (IAdminDAO) DAOFactory.newInstance("IAdminDAO");
    if (adminDAO.findAdminBy(admin).size() > 0) {
        //管理员账号存在
        //登录管理员主界面
        IDishService dishserv = (IDishService) DAOFactory.newInstance("IDishService");
        ArrayList<Dish> dishlist = dishserv.findDish4PageList(pageNo, 6);//获得菜品的数组
        int totalRecords = dishserv.getTotalRecords();//获取总共菜品数量
        PageModel<Dish> pageModel = new PageModel<Dish>(totalRecords, pageNo, 6, dishlist);//构造PageModel<Dish>
        request.setAttribute("pageModel", pageModel);
        // 跳转到show.jsp页面

    }
    else{
//        RequestDispatcher rd = request.getRequestDispatcher("/AdminLogin.html");
//        rd.forward(request, response);
        response.sendRedirect("/AdminLogin.html");
    }
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
                            <li class="nav-item">
                                <a href="MenuManage.jsp" class="nav-link">
                                    <p>
                                        菜品管理
                                    </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="upload.html" class="nav-link">
                                    <p>
                                        添加菜品
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
