<%@ page import="cugb.javaee.dao.IDishDAO" %>
<%@ page import="cugb.javaee.dao.DishDAOMySQLImpl" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.biz.IDishService" %>
<%@ page import="cugb.javaee.util.DAOFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品管理</title>
</head>
<body>
<table>
<tr>
    <th>菜品编号</th>
    <th>菜品名称</th>
    <th>菜品描述</th>
    <th>菜品价格</th>
    <th>菜品图片</th>
    <th>操作</th>
</tr>
<%
    IDishService dishService=(IDishService) DAOFactory.newInstance("IDishService");
    ArrayList<Dish> dishes= dishService.findDishes();
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
    i++;}
%>
</table>
</body>
</html>
