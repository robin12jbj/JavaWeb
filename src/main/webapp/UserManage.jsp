<%@ page import="cugb.javaee.dao.IUsersDAO" %>
<%@ page import="cugb.javaee.dao.UsersDAOMySQLImpl" %>
<%@ page import="cugb.javaee.bean.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
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
    }
%>
</body>
</html>
