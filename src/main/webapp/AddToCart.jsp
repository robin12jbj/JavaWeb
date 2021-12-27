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
    <title>添加到购物车</title>
</head>
<body>
<%
    int dishid=Integer.parseInt(request.getParameter("dishid"));
    int quanity=Integer.parseInt(request.getParameter("quantity"));
    System.out.println(dishid);System.out.println(quanity);
    //HttpSession session = request.getSession();
    //判断购物车是否有dishid对应的，若有则在原来的基础上添加数量
    //若无，则将该Cart添加到session中
    Cart myCart=(Cart)(session.getAttribute("menus"));
    CartItem myCartItem=(CartItem)(myCart.getMenus().get(dishid));
    if (myCartItem!=null){
        myCartItem.setQuantity(myCartItem.getQuantity()+quanity);
    }else{
        IDishService dishService=(IDishService) DAOFactory.newInstance("IDishService");
        ArrayList<Dish> dishArrayList= dishService.findDishesBy(dishid);
        Dish myDish= (Dish) dishArrayList.get(0);
        myCartItem=new CartItem(myDish,quanity);
        myCart.getMenus().put(dishid,myCartItem);
        System.out.println("到达AddToCart");
    }
    Map cartMenus=myCart.getMenus();
    Set cartitems=cartMenus.keySet();
    Object[] dishes=cartitems.toArray();
    int i=0;
    while (i<dishes.length){
        CartItem myCartItem2=(CartItem)(cartMenus.get(dishes[i]));
        response.getWriter().println(myCartItem.getDish().getDishname()+":"+myCartItem.getQuantity()+"份"+"\n");
    }


%>
</body>
</html>
