<%@ page import="cugb.javaee.bean.Cart" %>
<%@ page import="cugb.javaee.bean.CartItem" %>
<%@ page import="cugb.javaee.biz.IDishService" %>
<%@ page import="cugb.javaee.util.DAOFactory" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="cugb.javaee.bean.PageModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script>
        function Value(dishname,quanity,price,dishid) {
            $("#dishname").val(dishname);
            $("#quanity").val(quanity);
            $("#price").val(price);
            $("#dishid").val(dishid);

        }
    </script>
</head>
<body>
<%--购物车页面--%>
<%
    int pageNo=1;
    if (request.getParameter("dishid")!=null){
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
    }
    if(request.getParameter("pageNo")!=null){
        pageNo=Integer.parseInt(request.getParameter("pageNo"));
    }


    Cart myCart=(Cart)(session.getAttribute("menus"));//我的购物车
    Map cartMenus=myCart.getMenus();
    Set cartitems=cartMenus.keySet();
    Object[] keys=cartitems.toArray();//得到hashmap的key转换过来的数组
    ArrayList<CartItem> mycartitemlist=new ArrayList<>();
    int j=0;
    while (j<cartitems.size()){
        mycartitemlist.add((CartItem) cartMenus.get(keys[j]));
        j++;//将购物车的hashmap中的value添加到arraylist中
    }
    Object[] dishes=cartitems.toArray();

    PageModel<CartItem> pageModel=new PageModel<>(mycartitemlist.size(),1,6,mycartitemlist);//将list添加入pageModel中
    if(dishes.length==0){
        PrintWriter tip=response.getWriter();
        tip.println("<script language=javascript>alert('购物车为空！');window.location.href='logincheck?action=pagelist&pageNo=1'</script>");
    }
    CartItem myCartItem=(CartItem)(myCart.getMenus().get(dishes[0]));
    System.out.println("购物车共"+(dishes.length)+"项菜品");
    CartItem cartItem=pageModel.getList().get(0);
    System.out.println(cartItem.getDish().getDishname());
    double totalPrice=0;

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
                    <li><a href="logincheck?action=pagelist&pageNo=1">网站首页</a></li>
                    <li><a href="about.html">关于我们</a></li>
                    <li><a href="help.html">订餐帮助</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container" style="padding-left: 15px">
    <table class="table table-striped">
        <thead>
            <td>菜品名称</td>
            <td>菜品单价</td>
            <td>数量</td>
            <td>总价</td>
        </thead>
        <tbody>
        <%
            System.out.println("购物车共有"+pageModel.getList().size()+"项");
            int i=0;
        while(i<pageModel.getTotalRecords()){
            myCartItem = pageModel.getList().get(i);
            System.out.println("该菜品数量为："+myCartItem.getQuantity());
            BigDecimal num=BigDecimal.valueOf(myCartItem.getQuantity());
            String price=new DecimalFormat("0.00").format(myCartItem.getDish().getPrice().multiply(num));
            double Price=Double.parseDouble(price);
            totalPrice+=Price;
        %>
        <tr>
            <td><%=myCartItem.getDish().getDishname()%></td>
            <td><%=myCartItem.getDish().getPrice()%></td>
            <td><%=myCartItem.getQuantity()%></td>
            <td><%=(price)%></td>
            <td class="sorting-1">
                <nav class="center-block"><input type="button" style="text-align: center" class="btn btn-info" data-toggle="modal" data-target="#myModal" value="编辑"
                 onclick="Value('<%=myCartItem.getDish().getDishname()%>','<%=myCartItem.getQuantity()%>','<%=price%>','<%=myCartItem.getDish().getDishid()%>')"></nav>
                <a href="ModifyCart?dishid=<%=myCartItem.getDish().getDishid()%>"><input type="button" value="删除" onclick="alert('删除成功!')"></a>
            </td>
        </tr>
        <%
            i++;}
        %>
        </tbody>
        <%
            String totalPricestr=new DecimalFormat("0.00").format(totalPrice);
        %>
    </table>
    <nav aria-label="...">
        <ul class="pager">
            <li class="previous"><p align="center">总价：<%=totalPricestr%></p></li>
            <li class="next">
                <form action="successpay.jsp">

                    <input type="submit" class="btn btn-default" value="结算" onclick="alert('支付成功')">
                </form>
            </li>
        </ul>
    </nav>
</div>
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    订单编辑
                </h4>
            </div>
            <form name="editForm" action="CartMenuControl">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="dishname">菜品名称</label>
                        <input type="text" id="dishname" name="dishname" class="form-control" placeholder="菜品名称" readonly="readonly" >
                    </div>
                    <div class="form-group">
                        <label for="quanity">菜品数量</label>
                        <input type="text" id="quanity" name="quanity" class="form-control" placeholder="菜品数量" >
                    </div>
                    <div class="form-group">
                        <label for="price">菜品总价</label>
                        <input type="text" id="price" name="price" class="form-control" placeholder="菜品总价" readonly="readonly" >
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="hidden" name="dishid" id="dishid" placeholder="菜品编号">
                    <input type="submit" class="btn btn-primary">
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
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
