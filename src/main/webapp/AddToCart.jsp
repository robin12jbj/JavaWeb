<%@ page import="cugb.javaee.bean.Cart" %>
<%@ page import="cugb.javaee.bean.CartItem" %>
<%@ page import="cugb.javaee.biz.IDishService" %>
<%@ page import="cugb.javaee.util.DAOFactory" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
</head>
<body>
<%
    int dishid=Integer.parseInt(request.getParameter("dishid"));
    int quanity=Integer.parseInt(request.getParameter("quantity"));
    //HttpSession session = request.getSession();
    //判断购物车是否有dishid对应的，若有则在原来的基础上添加数量
    //若无，则将该Cart添加到session中
    Cart myCart=(Cart)(session.getAttribute("menus"));//我的购物车
    Set myset=myCart.getMenus().keySet();
    Object[] myobj=myset.toArray();

    CartItem myCartItem=(CartItem)(myCart.getMenus().get(dishid));
    IDishService dishService=(IDishService) DAOFactory.newInstance("IDishService");
    ArrayList<Dish> dishArrayList= dishService.findDishesBy(dishid);
    Dish myDish= (Dish) dishArrayList.get(0);
    if (myCartItem!=null){
        myCartItem.setQuantity(myCartItem.getQuantity()+quanity);
        System.out.println("购物车里该菜品为空 "+myDish.getDishname()+" 编号 "+myDish.getDishid()+" "+ myCartItem.getQuantity()+"份");
    }else{
        myCartItem=new CartItem(myDish,quanity);
        myCart.getMenus().put(dishid,myCartItem);
        System.out.println("购物车里之前已经有该菜品 "+myDish.getDishname()+" 编号 "+myDish.getDishid()+" "+ myCartItem.getQuantity()+"份");
    }

    Map cartMenus=myCart.getMenus();
    Set cartitems=cartMenus.keySet();
    Object[] dishes=cartitems.toArray();
    System.out.println("购物车共"+(dishes.length)+"项菜品");
    int i=0;
    while (i<dishes.length){
        myCartItem = (CartItem)cartMenus.get(dishes[i]);
           response.getWriter().println(myCartItem.getDish().getDishname()+myCartItem.getQuantity()+" 份");
        i++;
    }


%>
<header class="container">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="font-size: large" href="#">网上订餐系统</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="login.html">网站首页</a></li>
                    <li><a href="about.html">关于我们</a></li>
                    <li><a href="help.html">订餐帮助</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container" style="padding-left: 15px">
    <table class="table-hover">
        <thead>
            <td></td>
            <td></td>
            <td></td>
        </thead>
        <tr>

        </tr>
    </table>
</div>

<div class="container">
    <hr>
    <footer>
        <p class="text-center">&copy; 2021 JavaWeb</p>
    </footer>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>
