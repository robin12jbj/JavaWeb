<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>网上订餐系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<SCRIPT language=JavaScript type=text/JavaScript>
</SCRIPT>
</HEAD>
<%--此处为菜品的展示页面--%>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<header class="container">
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="font-size: large" href="#">网上订餐系统</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="login.html">网站首页</a></li>
					<li><a href="about.html">关于我们</a></li>
					<li><a href="help.html">订餐帮助</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>

<div class="container" style="padding-left: 15px">
	<TABLE  cellSpacing=0 cellPadding=0 width=100% border=0>
		<TBODY>
		<TR>
			<TD style="padding-left: 10%;padding-right: 10%">
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
					<TR>
						<TD><IMG height="98" src="images/001.jpg" width=100%></TD>
					</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
					<TR>
						<TD width="100%">
							<div class='cnt'><marquee
									style="FONT-SIZE: 16px; COLOR: #0000FF" scrollamount='5'
									direction='left'><IMG height=15 src="images/tp009.gif" width=15> 欢迎您使用网上订餐系统，祝您用餐愉快！</marquee></div>
							&nbsp;&nbsp;</TD>
					</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
					<TR>
						<TD align=right background="images/004.gif" height=19></TD>
					</TR>
					<TR  bgColor=#dadada>
						<TD width="100%" style="padding-right: 10%"><a href="AddToCart.jsp"> <img
								src="images/lcart_cn.gif" border=0 width="97" height="30"></a></TD>
					</TR>
					<TR>
						<%--下面为菜品展示功能--%>
						<TD>
							<div class="panel panel-primary">
								<div class="panel-body">
									<div class="row">
										<c:forEach var="currentdish"
												   items="${requestScope.pageModel.list}"
												   varStatus="status">
											<div class="col-lg-4">
												<div class="thumbnail">
													<img style="padding:5px" src="${currentdish.imag}" alt="${currentdish.dishname}" height="75px">
													<p style="text-align: center">${currentdish.dishname}</p>
													<p style="text-align: center">现价: ${currentdish.price}元</p>
													<p style="text-align: center">${currentdish.descrp}</p>
													<p style="text-align: center"  style="padding-bottom: 10px;">
														<a href="dishdetails.jsp?dishid=${currentdish.dishid}"><img src="images/detail_cn.gif" width="60" height="20"></a>
													</p>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</TD>
					</TR>
					<TR>
						<%--下面为分页功能--%>
                        <TD align="center">
                        <nav class="center-block" aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a id="btnTopPage"
                                       href="logincheck?action=pagelist&pageNo=${requestScope.pageModel.top}"
                                       title="首页">|&lt;&lt; </a>&nbsp;
                                </li>
                                <li>
                                    <a id="btnPreviousPage"
                                       href="logincheck?action=pagelist&pageNo=${requestScope.pageModel.prev}"
                                       title="上页" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                                </li>
								<li <c:if test="${requestScope.pageModel.pageNo == 1}"> class="active" </c:if> ><a>1</a></li>
								<li <c:if test="${requestScope.pageModel.pageNo == 2}"> class="active" </c:if> ><a>2</a></li>
                                <li <c:if test="${requestScope.pageModel.pageNo == 3}"> class="active" </c:if> ><a>3</a></li>
                                <li>
                                    <a id="btnNextPage"
                                       href="logincheck?action=pagelist&pageNo=${requestScope.pageModel.next}"
                                       title="下页" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
                                </li>
                                <li>
                                    <a id="btnBottomPage"
                                       href="logincheck?action=pagelist&pageNo=${requestScope.pageModel.bottom}"
                                       title="尾页"> &gt;&gt;|</a>
                                </li>
                            </ul>
                        </nav>
                        </TD>
					</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
		</TBODY>
	</TABLE>
</div>


<div class="container">
	<hr>
	<footer>
		<p class="text-center">&copy; 2021 JavaWeb</p>
	</footer>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</body>
</html>