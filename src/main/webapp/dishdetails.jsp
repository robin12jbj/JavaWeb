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
    <TITLE>我学我会网上订餐系统</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <link rel="stylesheet" href="./css/styles.css" type="text/css" />
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
<table cellSpacing=0 cellPadding=0 width=776 align=center border=0>
    <tr>
        <td width="220" rowspan="3">　</td>
        <td width="556" height="36">　</td>
    </tr>
    <tr>
        <TD
                style="FONT-SIZE: 24pt;  WIDTH: 100%; COLOR: #000000; FONT-FAMILY: arial; POSITION: relative"
                noWrap><B><span class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XXXX</span>
            网上订餐系统</B></TD>
    </tr>
    <tr>
        <td>　</td>
    </tr>
</table>
<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
    <TBODY>
    <TR>
        <TD background="images/001.gif" height=42>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD width=0 height=20></TD>
                    <TD align=middle><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
                            href="#" target=_self><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">网站首页</FONT></A><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
                            href="#" target=_self><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">关于我们</FONT></A><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
                            href="#" target=_self><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">定餐帮助</FONT></A><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
                            href="#" target=_self><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">网上定餐</FONT></A><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT><A
                            href="#" target=_self><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">客服中心</FONT></A><FONT
                            style="FONT-SIZE: 13px; COLOR: #000000">&nbsp;|&nbsp;</FONT></TD>
                </TR>
                </TBODY>
            </TABLE>
        </TD>
    </TR>
    </TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
    <TBODY>
    <TR vAlign=top>
        <TD width=181 background="images/002.gif">
            <TABLE cellSpacing=0 cellPadding=0 width=181 border=0>
                <TBODY>
                <TR>
                    <TD><IMG height=234 src="images/left_top.jpg" width=181></TD>
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
                        <TABLE cellSpacing=0 cellPadding=0 width="94%" border=0>
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
        <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD><IMG height=72 src="images/001.jpg" width=595></TD>
                </TR>
                </TBODY>
            </TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD width="90%">
                        <div class='cnt'><marquee
                                style="FONT-SIZE: 13px; COLOR: #0000FF" scrollamount='5'
                                direction='left'><IMG height=15 src="images/tp009.gif" width=15> 欢迎您使用我学我会网上订餐系统，祝您用餐愉快！</marquee></div>
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
                <TR>
                    <TD>

                        <TABLE cellSpacing=1 cellPadding=1 width="100%" align=center
                               bgColor=#c0c0c0 border=0>
                            <TBODY>
                            <TR bgColor=#dadada>

                                <TD width="100%" align="center">我学我会网上点餐系统用户请直接登录</TD>
                            </TR>
                            </TBODY>
                        </TABLE>
                        <BR>
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
            <!--展示菜品详细信息-->
            <table width="90%" border="0" align="center" cellpadding="0"
                   cellspacing="0">
                <tr>
                    <td width="90" height="90" valign="top"><img
                            src=<%=myDish.getImag()%> border="0" width="80" height="80"></td>
                    <td valign="top">
                        <table width="98%" border="0" cellspacing="1" cellpadding="0"
                               align="center">
                            <tr>
                                <td><strong><%=myDish.getDishname()%></strong></td>
                            </tr>
                            <tr>
                                <td height="21"><br>
                                    <font color="#ff0000">现价：<%=myDish.getPrice()%></font><br>
                                    美味可口！</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="30">编号: <%=myDish.getDishid()%></td>
                    <td>
                        <table width="145" border="0" cellspacing="1" cellpadding="0">
                            <tr>
                                <form action="/AddToCart" method="post">
                                <input type="text" name="quantity" value="1">
                                <input type="hidden" name="dishid" value=<%=myDish.getDishid()%>
                                <td align="center" width="70">
                                    <input type="submit"  style="background-image:url('/images/buy_cn.gif')">

                                </td>
                                </form>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <P align=center><STRONG><FONT size=4>详细资料</FONT></STRONG></P>
            <HR align=center width="100%" color=#000000 noShade SIZE=1>

            <P align=center><IMG
                    style="BORDER-LEFT-COLOR: #000000; BORDER-BOTTOM-COLOR: #000000; WIDTH: 232px; BORDER-TOP-COLOR: #000000; POSITION: static; HEIGHT: 172px; BORDER-RIGHT-COLOR: #000000; align: center"
                    height=294 alt="" hspace=0 src=<%=myDish.getImag()%> width=350
                    border=0></P>
            <P align=center><FONT size=3><%=myDish.getDescrp()%></FONT></P>
            <br>
        </td>
    </tr>
</table>


<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
    <TBODY>
    <TR>
        <TD background="images/005.gif" height=8></TD>
    </TR>
    </TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=776 align=center border=0>
    <TBODY>
    <TR>
        <TD bgColor=#eeeeee>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD align=middle><BR>
                        <P align=center><FONT color=#000000>Copyright &copy;
                            2010&nbsp;&nbsp;&nbsp;&nbsp; XXXX有限公司所有</FONT></P>
                        <P align=center>　</P>
                        <BR>
                        <BR>
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
        </TD>
    </TR>
    </TBODY>
</TABLE>
</BODY>
</HTML>