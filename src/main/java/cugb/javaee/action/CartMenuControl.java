package cugb.javaee.action;

import cugb.javaee.bean.Cart;
import cugb.javaee.bean.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/CartMenuControl")
public class CartMenuControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int dishid=Integer.parseInt(request.getParameter("dishid"));
        int quanity=Integer.parseInt(request.getParameter("quanity"));
        HttpSession session=request.getSession();
        //通过dishid来更改购物车中该项的数量
        //key->value 通过dishid来删除hashmap中的某一项
        Cart myCart=(Cart)(session.getAttribute("menus"));//我的购物车
        CartItem item = (CartItem) myCart.getMenus().get(dishid);
        item.setQuantity(quanity);
        //重定向至购物车界面
        response.sendRedirect("/AddToCart.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
