package cugb.javaee.action;

import cugb.javaee.dao.DishDAOMySQLImpl;
import cugb.javaee.dao.IDishDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
@WebServlet("/DishAdd")
public class DishAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String myfilename=request.getParameter("myfilename");
        //System.out.println("添加菜品");
        //图片上传

        IDishDAO DishDAO=new DishDAOMySQLImpl();
        int dishid=DishDAO.getTotalDishRecords()+1;
        String dishname=request.getParameter("dishname");
        double dishprice=Double.parseDouble(request.getParameter("price"));
        String dishdescrp=request.getParameter("desc");
        String myfilename=request.getParameter("myfilename");
        String material=request.getParameter("material");
        BigDecimal price=new BigDecimal(dishprice);
        System.out.println("新的菜品信息如下:");
        System.out.println(dishid);
        System.out.println(dishname);
        System.out.println(dishprice);
        System.out.println(dishdescrp);
        System.out.println(myfilename);
        System.out.println(material);
        //测试成功
        DishDAO.insertDish( dishid, dishname,dishprice,dishdescrp,myfilename,material);
        response.sendRedirect("MenuManage.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
