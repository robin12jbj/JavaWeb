<%@ page import="cugb.javaee.dao.IUsersDAO" %>
<%@ page import="cugb.javaee.dao.UsersDAOMySQLImpl" %>
<%@ page import="cugb.javaee.bean.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.biz.IUserService" %>
<%@ page import="cugb.javaee.util.DAOFactory" %>
<%@ page import="cugb.javaee.bean.PageModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

</head>
<body>
<%
    int pageNo=1;
    if(request.getParameter("pageNo")!=null)
    {
        //传递了pageNo参数，证明管理员不是第一次进入
        pageNo=Integer.parseInt(request.getParameter("pageNo"));
    }
    IUsersDAO userdao = (IUsersDAO) DAOFactory.newInstance("IUsersDAO");
    ArrayList<Users> userlist = userdao.findUsers() ;//获得用户的数组
    System.out.println(userlist.size());
    int totalRecords = userlist.size();//获取总共用户数量
    PageModel<Users> pageModel = new PageModel<Users>(totalRecords, pageNo, 6, userlist);//构造PageModel<Users>
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
                        <a href="MenuManage.jsp" class="nav-link">
                            <p>
                                菜品管理
                            </p>
                        </a>
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
                                                    <th class="sorting sorting_asc" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-sort="ascending" aria-label="用户编号">用户编号</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="用户名称">用户名称</th>
                                                    <th class="sorting" tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="用户密码">用户密码</th>
                                                    <th tabindex="0" aria-controls="table" rowspan="1" colspan="1" aria-label="操作">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        IUsersDAO usersDAO=new UsersDAOMySQLImpl();
                                                        ArrayList<Users> users= usersDAO.findUsers();//返回所有Dish信息
                                                        int size=users.size();
                                                        int i=0;
                                                        while(i<size)
                                                        {
                                                    %>
                                                    <tr class="odd">
                                                        <td><%=users.get(i).getUserid()%></td>
                                                        <td><%=users.get(i).getUsername()%></td>
                                                        <td><%=users.get(i).getPwd()%></td>
                                                        <td class="sorting-1">
                                                            <input type="button" class="btn btn-success" name="<%=users.get(i).getUserid()%>" data-toggle="modal" data-target="#myModal" value="编辑">
                                                            <input type="button" value="删除">
                                                        </td>
                                                    </tr>
                                                    <%
                                                            i++;}
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <TR>
                                            <%--下面为分页功能--%>
                                            <TD align="center">
                                                <nav class="center-block" aria-label="Page navigation">
                                                    <ul class="pagination">
                                                        <li>
                                                            <a id="btnTopPage"
                                                               href="UserManage.jsp?&pageNo=<%=pageModel.getTop()%>"
                                                               title="首页">|&lt;&lt; </a>&nbsp;
                                                        </li>
                                                        <li>
                                                            <a id="btnPreviousPage"
                                                               href="UserManage.jsp?&pageNo=<%=pageModel.getPrev()%>"
                                                               title="上页" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                                                        </li>
                                                        <%
                                                            int j=0;
                                                            while(j<pageModel.getTotalPages()){

                                                        %>
                                                        <li <% if(pageModel.getPageNo()==j+1){ %> class="active" <%} %> ><a><%=j+1%></a></li>
                                                        <%
                                                                j++;
                                                            }
                                                        %>
                                                        <li>
                                                            <a id="btnNextPage"
                                                               href="UserManage.jsp?&pageNo=<%=pageModel.getNext()%>"
                                                               title="下页" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
                                                        </li>
                                                        <li>
                                                            <a id="btnBottomPage"
                                                               href="UserManage.jsp?&pageNo=<%=pageModel.getBottom()%>"
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
                    用户编辑
                </h4>
            </div>
            <form name="editForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="userid">用户编号</label>
                        <input type="text" id="userid" class="form-control" placeholder="用户编号" >
                    </div>
                    <div class="form-group">
                        <label for="username">用户名称</label>
                        <input type="text" id="username" class="form-control" placeholder="用户名称" >
                    </div>
                    <div class="form-group">
                        <label for="userpassword">用户密码</label>
                        <input type="text" id="userpassword" class="form-control" placeholder="用户密码" >
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
