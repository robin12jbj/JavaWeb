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

import cugb.javaee.bean.Dish;
import cugb.javaee.bean.PageModel;
import cugb.javaee.biz.IDishService;
import cugb.javaee.biz.IUserService;
import cugb.javaee.util.DAOFactory;

import cugb.javaee.bean.Users;
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
			if (userserv.validateUser(loginuser)) {
				int pageNo = 1;
				pageList(request, response, pageNo);
			} else {
				request.getRequestDispatcher("/login.html").forward(request, response);
			}
		} else if (action.equals("pagelist")) {//分页显示
			HttpSession session = request.getSession();
			IUserService userserv = (IUserService) DAOFactory.newInstance("IUserService");
				int pageNo = Integer.parseInt(request.getParameter("pageNo"));
				pageList(request, response, pageNo);
		}
		
	}

	private void pageList(HttpServletRequest request, HttpServletResponse response, int pageNo)
			throws ServletException, IOException {
		IDishService dishserv = (IDishService) DAOFactory.newInstance("IDishService");
		ArrayList<Dish> dishlist = dishserv.findDish4PageList(pageNo, 6);
		logger.debug(dishlist);
		int totalRecords = dishserv.getTotalRecords();
		logger.debug(totalRecords);
		PageModel<Dish> pageModel = new PageModel<Dish>(totalRecords, pageNo, 6, dishlist);
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
