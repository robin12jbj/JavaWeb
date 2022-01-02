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

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/logincheck")
public class LoginCheck extends baseControl {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("loginctrl")) {//首页登陆
			request.setCharacterEncoding("UTF-8");
			String username = request.getParameter("loginName");
			String password = request.getParameter("loginPass");
			logger.debug(username + "," + password);
			HttpSession session = request.getSession();
			//此处创建的是实现接口的类UserServiceImpl
			IUserService userserv = (IUserService) DAOFactory.newInstance("IUserService");
			Users loginuser = new Users();
			loginuser.setUsername(username);
			loginuser.setPwd(password);

			Cart myCart=(Cart)(session.getAttribute("menus"));
			if (userserv.validateUser(loginuser)) {
				UsersDAOMySQLImpl usersDAOMySQL=new UsersDAOMySQLImpl();
				loginuser=usersDAOMySQL.findUsersBy(loginuser).get(0);
				//获取到含有userid的loginuser
				int pageNo = 1;
				session.setAttribute("user",loginuser);
				session.setAttribute("menus",new Cart());
				pageList(request, response, pageNo);
			} else {
				request.getRequestDispatcher("/login.html").forward(request, response);
			}
		} else if (action.equals("pagelist")) {//分页显示
				int pageNo = Integer.parseInt(request.getParameter("pageNo"));
				//获取页数信息
				pageList(request, response, pageNo);
		}else if(action.equals("admin")){//管理员登录
			int pageNo = 1;
			String adminname = request.getParameter("loginName");
			String password = request.getParameter("loginPass");
			Admin admin=new Admin();
			admin.setAdminName(adminname);
			admin.setPwd(password);
			logger.debug(adminname + "," + password);
			IAdminDAO adminDAO=(IAdminDAO) DAOFactory.newInstance("IAdminDAO");
			if(adminDAO.findAdminBy(admin).size()>0){
				//管理员账号存在
				//登录管理员主界面
				pageList(request, response, pageNo);
				response.sendRedirect("AdminMain.jsp");
			}
		}
		
	}

	private void pageList(HttpServletRequest request, HttpServletResponse response, int pageNo)
			throws ServletException, IOException {
		IDishService dishserv = (IDishService) DAOFactory.newInstance("IDishService");
		ArrayList<Dish> dishlist = dishserv.findDish4PageList(pageNo, 6);//获得菜品的数组
		logger.debug(dishlist);
		int totalRecords = dishserv.getTotalRecords();//获取总共菜品数量
		logger.debug(totalRecords);
		PageModel<Dish> pageModel = new PageModel<Dish>(totalRecords, pageNo, 6, dishlist);//构造PageModel<Dish>
		request.setAttribute("pageModel", pageModel);
		// 跳转到show.jsp页面
		RequestDispatcher rd = request.getRequestDispatcher("/show.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
