<%@ page import="cugb.javaee.dao.IDishDAO" %>
<%@ page import="cugb.javaee.dao.DishDAOMySQLImpl" %>
<%@ page import="cugb.javaee.bean.Dish" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.biz.IDishService" %>
<%@ page import="cugb.javaee.util.DAOFactory" %>
<%@ page import="cugb.javaee.dao.IUsersDAO" %>
<%@ page import="cugb.javaee.dao.UsersDAOMySQLImpl" %>
<%@ page import="cugb.javaee.bean.Users" %>
<%@ page import="cugb.javaee.biz.IUserService" %>
<%@ page import="cugb.javaee.biz.UserServiceImpl" %>
<%@ page import="cugb.javaee.biz.DishServiceImpl" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
    <TITLE>网上订餐系统</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <SCRIPT language=JavaScript type=text/JavaScript>
    </SCRIPT>

</HEAD>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<%
    int dishid=Integer.parseInt(request.getParameter("dishid"));
    IDishService dishService=(IDishService) DAOFactory.newInstance("IDishService");
    ArrayList<Dish> dishArrayList= dishService.findDishesBy(dishid);
    Dish myDish= (Dish) dishArrayList.get(0);
%>
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
                <ul class="nav navbar-right">
                    <li></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container" style="padding-left: 15px">
<TABLE cellSpacing=0 cellPadding=0 width=100% border=0>
    <TBODY>
    <TR vAlign=top>
        <!--左侧-->
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
        <TD style="padding-left: 10%;padding-right: 10%;">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD><IMG height=98 src="images/001.jpg" width="100%"></TD>
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
            <!--展示菜品详细信息-->
            <table width="100%" border="0" align="center" cellpadding="0"
                   cellspacing="0">
                <tr align="center">
                    <td width="120" height="120" valign="top"><img class="img-thumbnail"
                            src=<%=myDish.getImag()%> border="0" width="110" height="110"></td>
                    <td valign="top">
                        <div class="caption">
                            <h4><strong><%=myDish.getDishname()%></strong></h4>
                            <p>现价：<%=myDish.getPrice()%>&nbsp;元</p>
                            <p align="center"></p>
                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <form action="AddToCart" method="get" name="addtocart">
                            <input type="text" name="quantity" value="1">
                            <input type="hidden" name="dishid" value=<%=myDish.getDishid()%>
                                    <td align="center" width="70">
                            <input type="submit"  style="background-image:url('/images/buy_cn.gif')">
                    </form>
                    </td>
                </tr>
            </table>

            <div class="page-header">
                <h3>详细信息</h3>
            </div>
            <P align=center><IMG
                    style="BORDER-LEFT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000; WIDTH: 200px; BORDER-TOP-COLOR: #000000; POSITION: static; HEIGHT: 172px; BORDER-RIGHT-COLOR: #000000; align: center"
                    height=200 alt="" hspace=0 src=<%=myDish.getImag()%> width=350
                    border=0></P>
            <P align=center><FONT size=3><%=myDish.getDescrp()%></FONT></P>
            <P align=center><FONT size=3><%=myDish.getDescrp()%></FONT></P>
            <br>
        </td>
    </tr>
</table>
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
</BODY>
</HTML>