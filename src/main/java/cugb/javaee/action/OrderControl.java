package cugb.javaee.action;

import cugb.javaee.dao.IUsersDAO;
import cugb.javaee.dao.OrderDAO;
import cugb.javaee.dao.UsersDAOMySQLImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/OrderControl")
public class OrderControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//订单发货处理，重定向回去
    int orderid=Integer.parseInt(request.getParameter("orderid"));
        OrderDAO orderDAO=new OrderDAO();
        orderDAO.updateOrder(orderid);
        response.sendRedirect("OrderManage.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
