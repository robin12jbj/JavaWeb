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
</body>
</html>
