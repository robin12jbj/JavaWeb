<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加菜品信息详情</title>
</head>
<body>
<%
    String myfilename= request.getParameter("myfilename");
    response.getWriter().println("图片名称"+myfilename);

%>
<form action="DishAdd">
<input type="text" name="dishname" placeholder="菜品名称">
<input type="text" name="price" placeholder="菜品价格">
<input type="text" name="desc" placeholder="菜品描述">
<input type="text" name="material" placeholder="菜品原料">
    <input type="text" name="myfilename" value="<%=myfilename%>">
    <input type="submit" value="添加菜品">
</form>
</body>
</html>
