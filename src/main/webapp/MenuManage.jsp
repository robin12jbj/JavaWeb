<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cugb.javaee.dao.IDishDAO" %>
<%@ page import="cugb.javaee.dao.DishDAOMySQLImpl" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.biz.IDishService" %>
<%@ page import="cugb.javaee.util.DAOFactory" %>
<%@ page import="cugb.javaee.bean.PageModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品管理</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <script>
        function Value(dishid,dishname,dishdescrp,dishprice,dishimag,material) {
            $("#dishid").val(dishid);
            $("#dishname").val(dishname);
            $("#dishdescrp").val(dishdescrp);
            $("#dishprice").val(dishprice);
            $("#dishimag").val(dishimag);
            $("#material").val(material);
            $("#action").val('modify');

        }
        function DefaultValue(nextdishid){
            $("#dishid").val(nextdishid);
            $("#action").val('add');
        }
    </script>
</head>
<body>
<%
    int pageNo=1;
    if(request.getParameter("pageNo")!=null)
    {
        //传递了pageNo参数，证明管理员不是第一次进入
        pageNo=Integer.parseInt(request.getParameter("pageNo"));
    }
    IDishService dishserv = (IDishService) DAOFactory.newInstance("IDishService");
    ArrayList<Dish> dishlist = dishserv.findDish4PageList(pageNo, 6);//获得菜品的数组
    System.out.println(dishlist.size());
    int totalRecords = dishserv.getTotalRecords();//获取总共菜品数量
    PageModel<Dish> pageModel = new PageModel<Dish>(totalRecords, pageNo, 6, dishlist);//构造PageModel<Dish>
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
    <div class="content-wrapper" style="min-height: 1245px">
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
                                                    <th class="sorting sorting_asc" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-sort="ascending" aria-label="菜品编号">菜品编号</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="菜品名称">菜品名称</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="菜品描述">菜品描述</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="菜品价格">菜品价格</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="菜品图片">菜品图片</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="菜品原料">菜品原料</th>
                                                    <th tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="操作">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    int size=pageModel.getList().size();
                                                    int i=0;
                                                    ArrayList<Dish> dishes=pageModel.getList();
                                                    while(i<size)
                                                    {
                                                %>
                                                <tr class="odd">
                                                    <td class="dtr-control"><%=dishes.get(i).getDishid()%></td>
                                                    <td><%=dishes.get(i).getDishname()%></td>
                                                    <td><%=dishes.get(i).getDescrp()%></td>
                                                    <td><%=dishes.get(i).getPrice()%></td>
                                                    <td><img src="<%=dishes.get(i).getImag()%>" width="200px" height="150px"></td>
                                                    <td><%=dishes.get(i).getDishmaterial()%></td>
                                                    <td class="sorting-1">
                                                        <input type="button" class="btn btn-success" name="<%=dishes.get(i).getDishid()%>" data-toggle="modal" data-target="#myModal" value="编辑"
                                                               onclick="Value('<%=dishes.get(i).getDishid()%>','<%=dishes.get(i).getDishname()%>','<%=dishes.get(i).getDescrp()%>','<%=dishes.get(i).getPrice()%>','<%=dishes.get(i).getImag()%>','<%=dishes.get(i).getDishmaterial()%>')">
                                                        <a href="DishControl?action=delete&dishid=<%=dishes.get(i).getDishid()%>"><input type="button" class="btn btn-danger" value="删除"></a>
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
                                                               href="MenuManage.jsp?&pageNo=<%=pageModel.getTop()%>"
                                                               title="首页">|&lt;&lt; </a>&nbsp;
                                                        </li>
                                                        <li class="page-item">
                                                            <a id="btnPreviousPage" class="page-link"
                                                               href="MenuManage.jsp?&pageNo=<%=pageModel.getPrev()%>"
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
                                                               href="MenuManage.jsp?&pageNo=<%=pageModel.getNext()%>"
                                                               title="下页" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a id="btnBottomPage" class="page-link"
                                                               href="MenuManage.jsp?&pageNo=<%=pageModel.getBottom()%>"
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

<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    菜品编辑
                </h4>
            </div>
            <form name="editForm" action="DishControl" enctype="multipart/form-data" method="get">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="dishid">菜品编号</label>
                        <input type="text" id="dishid" name="dishid" class="form-control" placeholder="菜品编号" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="dishname">菜品名称</label>
                        <input type="text" id="dishname" name="dishname" class="form-control" placeholder="菜品名称" >
                    </div>
                    <div class="form-group">
                        <label for="dishdescrp">菜品描述</label>
                        <input type="text" id="dishdescrp" name="dishdescrp" class="form-control" placeholder="菜品描述" >
                    </div>
                    <div class="form-group">
                        <label for="dishprice">菜品价格</label>
                        <input type="text" id="dishprice" name="dishprice" class="form-control" placeholder="菜品价格" >
                    </div>
                    <div class="form-group">
                        <label for="dishimag">菜品图片相对路径</label>
                        <input type="text" id="dishimag" name="dishimag" class="form-control" placeholder="菜品图片" >
                    </div>
                    <div class="form-group">
                        <label for="image">菜品图片上传</label>
                        <input type="file" name="file1" size="40" id="image" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="material">原料</label>
                        <input type="text" id="material" name="material" class="form-control" placeholder="原料" >
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="hidden" name="action" id="action" value="modify">
                     <input type="submit" class="btn btn-primary">
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
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
