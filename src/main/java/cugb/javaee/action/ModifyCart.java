package cugb.javaee.action;

import cugb.javaee.bean.Cart;
import cugb.javaee.dao.OrderDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/ModifyCart")
public class ModifyCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //删除用户购物车的信息
        HttpSession session=request.getSession();
        int dishid=Integer.parseInt(request.getParameter("dishid"));
        //通过dishid来删除购物车session中的value
        //key->value 通过dishid来删除hashmap中的某一项
        Cart myCart=(Cart)(session.getAttribute("menus"));//我的购物车
        myCart.getMenus().remove(dishid);//删除该项
        //重定向至购物车界面
        //response.sendRedirect("AddToCart.jsp");
        request.removeAttribute("dishid");
        response.sendRedirect("/AddToCart.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
