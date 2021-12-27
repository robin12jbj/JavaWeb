package cugb.javaee.action;

import cugb.javaee.bean.Cart;
import cugb.javaee.bean.CartItem;
import cugb.javaee.bean.Dish;
import cugb.javaee.biz.IDishService;
import cugb.javaee.util.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class AddToDB extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
        HttpSession session=request.getSession();
        Cart myCart=(Cart)session.getAttribute("menus");
        myCart.getMenus().forEach((key, value) -> {
           CartItem item =  (CartItem)value;
           Dish dish = item.getDish();
           int id=dish.getDishid();
           //获取订单编号
            //将cartitem内容添加到订单详情表
            //用户账号，订单号，菜品编号，菜品名称，菜品数量
        });


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
        doGet(request,response);
    }
}
