<%@ page import="cugb.javaee.dao.IUsersDAO" %>
<%@ page import="cugb.javaee.dao.UsersDAOMySQLImpl" %>
<%@ page import="cugb.javaee.bean.Users" %>
<%@ page import="java.util.ArrayList" %>
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
</head>
<body>
<table>
<tr>
    <th>用户编号</th>
    <th>用户姓名</th>
    <th>用户密码</th>
</tr>
<%
    IUsersDAO usersDAO=new UsersDAOMySQLImpl();
    ArrayList<Users> users= usersDAO.findUsers();//返回所有Dish信息
    int size=users.size();
    int i=0;
    while(i<size)
    {
%>
<tr>
    <td><%=users.get(i).getUserid()%></td>
    <td><%=users.get(i).getUsername()%></td>
    <td><%=users.get(i).getPwd()%></td>
</tr>
<%
    i++;}
%>
</table>

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
