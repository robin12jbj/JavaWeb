package cugb.javaee.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cugb.javaee.bean.*;
import cugb.javaee.biz.IDishService;
import cugb.javaee.biz.IUserService;
import cugb.javaee.util.DAOFactory;

import cugb.javaee.dao.*;
import cugb.javaee.util.*;
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
        //传入dishid和数量
        int dishid=Integer.parseInt(request.getParameter("dishid"));
        int quanity=Integer.parseInt(request.getParameter("quanity"));
        HttpSession session = request.getSession();
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
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
        doGet(request,response);
    }
}
