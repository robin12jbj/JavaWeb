package cugb.javaee.action;

import cugb.javaee.dao.IUsersDAO;
import cugb.javaee.dao.UsersDAOMySQLImpl;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/UserControl")
public class UserControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("here!");
        if(request.getParameter("action")==null){
            System.out.println("无");
        }
        String action=request.getParameter("action");
        System.out.println(action);

        if(request.getParameter("action").equals("delete")){
            //为删除用户操作
            //已实现
            int userid=Integer.parseInt(request.getParameter("userid"));
            IUsersDAO iUsersDAO =new UsersDAOMySQLImpl();
            iUsersDAO.deleteUser(userid);
            RequestDispatcher rd = request.getRequestDispatcher("/UserManage.jsp?");
            rd.forward(request, response);

        }else if(request.getParameter("action").equals("modify")){
            //修改用户信息
            //已实现，模态窗传参实现
            int userid=Integer.parseInt(request.getParameter("userid"));
            System.out.println(userid);//获取成功
            String username=request.getParameter("username");
            String userpassword=request.getParameter("userpassword");
            System.out.println("here!"+userid+username+userpassword);
            //根据userid修改user表信息
            IUsersDAO iUsersDAO=new UsersDAOMySQLImpl();
            iUsersDAO.updateUser(userid,userpassword,username);
            RequestDispatcher rd = request.getRequestDispatcher("/UserManage.jsp?");
            rd.forward(request, response);



        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
