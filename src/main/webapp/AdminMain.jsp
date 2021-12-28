<%@ page import="cugb.javaee.dao.IDishDAO" %>
<%@ page import="cugb.javaee.dao.DishDAOMySQLImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员主界面</title>
</head>
<body>
用户管理
菜品管理
<a href="UserManage.jsp" target="detail">用户管理</a>
<a href="MenuManage.jsp" target="detail">菜品管理</a>
<iframe width="800" height="600" name="detail">
</iframe>

</body>
</html>
