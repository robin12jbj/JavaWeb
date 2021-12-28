<%@ page import="cugb.javaee.dao.IDishDAO" %>
<%@ page import="cugb.javaee.dao.DishDAOMySQLImpl" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 麦克华斯基
  Date: 2021/12/28
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品管理</title>
</head>
<body>
<tr>
    <th>菜品编号</th>
    <th>菜品名称</th>
    <th>菜品描述</th>
    <th>菜品价格</th>
    <th>菜品图片</th>
    <th>操作</th>
</tr>
<%
    IDishDAO dishDAO=new DishDAOMySQLImpl();
    ArrayList<Dish> dishes= dishDAO.findDishes();//返回所有Dish信息
    int size=dishes.size();
    int i=0;
    while(i<size)
    {
%>
<tr>
    <td><%=dishes.get(i).getDishid()%></td>
    <td><%=dishes.get(i).getDishname()%></td>
    <td><%=dishes.get(i).getDescrp()%></td>
    <td><%=dishes.get(i).getPrice()%></td>
    <td><img src="<%=dishes.get(i).getImag()%>"></td>
    <td><input type="button" value="编辑" >
        <input type="button" value="删除">
    </td>
</tr>
<%
    }
%>
</body>
</html>
