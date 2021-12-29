package cugb.javaee.action;

import cugb.javaee.bean.Dish;
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

@WebServlet("/DishControl")
public class DishControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("action").equals("delete")){
            //删除菜品操作
            int dishid=Integer.parseInt(request.getParameter("dishid"));
            IDishDAO iDishDAO=new DishDAOMySQLImpl();
            iDishDAO.deleteDish(dishid);
            RequestDispatcher rd = request.getRequestDispatcher("/MenuManage.jsp");
            rd.forward(request, response);

        }else if(request.getParameter("action").equals("modify")){
            //编辑菜品操作
            int dishid=Integer.parseInt(request.getParameter("dishid"));
            String dishname=request.getParameter("dishname");
            String dishdescrp=request.getParameter("dishdescrp");
            double dishprice=Double.parseDouble(request.getParameter("dishprice"));
            String dishimag=request.getParameter("dishimag");
            String material=request.getParameter("material");
            IDishDAO iDishDAO=new DishDAOMySQLImpl();

            iDishDAO.updateDish(dishid,dishname,dishdescrp,dishprice,dishimag,material);
            RequestDispatcher rd = request.getRequestDispatcher("/MenuManage.jsp?");
            rd.forward(request, response);

        }else if (request.getParameter("action").equals("add")){
            //添加菜品操作
            int dishid=Integer.parseInt(request.getParameter("dishid"));
            String dishname=request.getParameter("dishname");
            String dishdescrp=request.getParameter("dishdescrp");
            double dishprice=Double.parseDouble(request.getParameter("dishprice"));
            BigDecimal price=new BigDecimal(dishprice);
            String dishimag=request.getParameter("dishimag");
            String material=request.getParameter("material");
//            Dish dish = new Dish(dishid,dishname,price,dishdescrp,dishimag,material);
            IDishDAO dishDAO=new DishDAOMySQLImpl();
            dishDAO.insertDish(dishid,dishname,dishprice,dishdescrp,dishimag,material);//插入菜品完成
            RequestDispatcher rd = request.getRequestDispatcher("/MenuManage.jsp?");
            rd.forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doGet(request,response);
    }
}
