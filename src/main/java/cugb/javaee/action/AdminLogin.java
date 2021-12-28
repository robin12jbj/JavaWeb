package cugb.javaee.action;

import cugb.javaee.bean.Admin;
import cugb.javaee.bean.Dish;
import cugb.javaee.bean.PageModel;
import cugb.javaee.biz.IDishService;
import cugb.javaee.dao.IAdminDAO;
import cugb.javaee.util.DAOFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AdminLogin")
public class AdminLogin extends baseControl {
    public AdminLogin() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo = 1;
        String adminname = request.getParameter("loginName");
        String password = request.getParameter("loginPass");
        Admin admin = new Admin();
        admin.setAdminName(adminname);
        admin.setPwd(password);
        IAdminDAO adminDAO = (IAdminDAO) DAOFactory.newInstance("IAdminDAO");
        if (adminDAO.findAdminBy(admin).size() > 0) {
            //管理员账号存在
            //登录管理员主界面
            pageList(request, response, pageNo);


        }




    }
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request,response);
    }

    private void pageList(HttpServletRequest request, HttpServletResponse response, int pageNo)
            throws ServletException, IOException {
        IDishService dishserv = (IDishService) DAOFactory.newInstance("IDishService");
        ArrayList<Dish> dishlist = dishserv.findDish4PageList(pageNo, 6);//获得菜品的数组
        int totalRecords = dishserv.getTotalRecords();//获取总共菜品数量
        PageModel<Dish> pageModel = new PageModel<Dish>(totalRecords, pageNo, 6, dishlist);//构造PageModel<Dish>
        request.setAttribute("pageModel", pageModel);
        // 跳转到show.jsp页面
        RequestDispatcher rd = request.getRequestDispatcher("/AdminMain.jsp");
        rd.forward(request, response);
    }
}

