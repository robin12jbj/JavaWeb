<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>网上订餐系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link rel="stylesheet" href="./css/styles.css" type="text/css" />
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
			<!--左侧图片-->
			<TD width=15% background="images/002.gif">
				<TABLE cellSpacing=0 cellPadding=0 width=100% border=0>
					<TBODY>
					<TR>
						<TD><IMG height=234 src="images/left_top.jpg" width=100%></TD>
					</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
					<TR>
						<TD align=middle height=30><FONT color=#000000> <SCRIPT
								language=javascript src="images/DateTime2.js"></SCRIPT> <SCRIPT
								language=javascript>tick('cn');</SCRIPT> </FONT></TD>
					</TR>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
					<TR>
						<TD>　</TD>
					</TR>
					<TR>
						<TD background="images/003.gif" height=4></TD>
					</TR>
					<TR>
						<TD>　</TD>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TBODY>
					<TR>
						<TD>　</TD>
					</TR>
					<TR>
						<TD background="images/003.gif" height=4></TD>
					</TR>
					<TR>
						<TD align=middle>
							<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
								<TR>
									<TD>　</TD>
								</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					</TBODY>
				</TABLE>
			</TD>

			<!--右侧-->
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
					</TBODY>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width="96%" align=center border=0>
					<TBODY>
					<TR valign="top">
						<TD>
							<%--下面为菜品展示功能--%>
							<TABLE cellSpacing=0 cellPadding=0 width="96%" align=center
								   border=0>
								<TBODY>
								<TR>
									<TD>

										<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center
											   bgColor=#c0c0c0 border=0>
											<TBODY>
											<TR bgColor=#dadada>

												<TD width="100%" align="right"><a href="#"> <img
														src="images/lcart_cn.gif" border=0 width="97" height="30"></a></TD>
											</TR>
											</TBODY>
										</TABLE> <BR>
										<TABLE cellSpacing=2 cellPadding=1 width="100%" align=center
											   border=0>
											<TBODY>
											<TR>
												<TD>

													<div class="container">
														<div class="panel panel-primary">
															<div class="panel-body">
																<div class="row">

																	<div class="col-md-3">
																		<div class="thumbnail">
																			<img class="img-circle" src="images/500008.jpg" alt="dishname">
																			<p style="text-align: center">dishname</p>
																			<p style="text-align: center">现价: price</p>
																			<p style="text-align: center">desc</p>
																			<p style="text-align: center">
																				<a href="dishdetails.jsp?dishid=currentdish.dishid"><img src="images/detail_cn.gif" width="60" height="20"></a>
																			</p>
																		</div>
																	</div>

																</div>
															</div>
														</div>
													</div>

													<TABLE height="100%" cellSpacing=1 cellPadding=2 border=0>
														<TBODY>
														<c:forEach var="currentdish"
																   items="${requestScope.pageModel.list}"
																   varStatus="status">
															<c:if test="${status.index%2==0}">
																<TR>
															</c:if>
															<TD vAlign=top width=90 height=90><A href="dishdetails.jsp?dishid=${currentdish.dishid}"
																								 target=_blank><IMG height=80 alt=点击图片查看内容
																													src="${currentdish.imag}" width=80 border=0></A></TD>
															<TD vAlign=top>
																<TABLE cellSpacing=1 cellPadding=0 width="100%"
																	   align=center border=0>
																	<TBODY>
																	<TR>
																		<TD><A href="dishdetails.jsp?dishid=${currentdish.dishid}" target=_blank><STRONG>${currentdish.dishname}</STRONG></A></TD>
																	</TR>
																	<TR>
																		<TD height=21><FONT color=#ff0000>现价：${currentdish.price}元</FONT><BR>
																			<a href="dishdetails.jsp?dishid=${currentdish.dishid}">美味可口</a>！</TD>
																	</TR>
																	</TBODY>
																</TABLE>
															</TD>
															<c:if test="${(status.index+1)%2==0}">
																</TR>
															</c:if>
														</c:forEach>
														<TR>
															<TD height=28>编号: </TD>
															<TD>
																<TABLE cellSpacing=1 cellPadding=0 width=145 border=0>
																	<TBODY>
																	<TR>
																		<TD align="middle" width="70"><a href="#">
																			<img src="images/buy_cn.gif" border="0"
																				 longdesc="shoppingCart.html" width="60"
																				 height="20">
																		</a></TD>
																		<TD align=middle width=70><A href=#
																									 target=_blank> <IMG src="images/detail_cn.gif"
																														 border=0 width="60" height="20"></A></TD>
																	</TR>
																	</TBODY>
																</TABLE>
															</TD>
														</TR>
														</TBODY>
													</TABLE>
										</TABLE>
							</TABLE>

							<%--下面为分页功能--%>
							<table width="95%" height="30" border="0" align="center"
								   cellpadding="0" cellspacing="0">
								<tr>
									<td height="2">
										<div align="left">
											<font color="#000000">&nbsp;共&nbsp${requestScope.pageModel.totalPages}&nbsp页</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<font color="#000000">当前第</font>&nbsp <font color="#000000">${requestScope.pageModel.pageNo}</font>&nbsp
											<font color="#000000">页</font>
										</div>
									</td>
									<td>
										<div align="right">
											<a name="btnTopPage" id="btnTopPage"
											   href="logincheck?action=pagelist&pageNo=${requestScope.pageModel.top}"
											   title="首页">|&lt;&lt; </a>&nbsp;
											<a name="btnPreviousPage"
											   id="btnPreviousPage"
											   href="logincheck?action=pagelist&pageNo=${requestScope.pageModel.prev}"
											   title="上页"> &lt; </a>&nbsp;
											<a name="btnNextPage"
											   id="btnNextPage"
											   href="logincheck?action=pagelist&pageNo=${requestScope.pageModel.next}"
											   title="下页"> &gt; </a>&nbsp;
											<a name="btnBottomPage"
											   id="btnBottomPage"
											   href="logincheck?action=pagelist&pageNo=${requestScope.pageModel.bottom}"
											   title="尾页"> &gt;&gt;|</a>

										</div>
									</td>
								</tr>
							</table>
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