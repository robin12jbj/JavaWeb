package cugb.javaee.action;
import cugb.javaee.dao.IUsersDAO;
import cugb.javaee.dao.OrderDAO;
import cugb.javaee.dao.UsersDAOMySQLImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //用户注册servlet
      int userid=Integer.parseInt(request.getParameter("newuserid"));
      String username=request.getParameter("newusername");
      String password=request.getParameter("newuserpassword");
      IUsersDAO iUsersDAO=new UsersDAOMySQLImpl();
      int res=iUsersDAO.insertUser(userid,username,password);
      if(res==0){
          //插入失败
          //重定向回登录页面
          PrintWriter tip=response.getWriter();
          tip.println("<script language=javascript>alert('Sorry!Register again!');window.location.href='UserRegister.html'</script>");

      }else{
          //进入用户登录界面
          PrintWriter tip=response.getWriter();
          tip.println("<script language=javascript>alert('Success!');window.location.href='login.html'</script>");
      }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}
