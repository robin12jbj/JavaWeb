<%@ page import="cugb.javaee.dao.OrderInfoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cugb.javaee.dao.OrderDAO" %>
<%@ page import="cugb.javaee.bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
</head>
<body>
<%--用户订单表--%>
<%--订单编号，用户编号，订单状态--%>
<%
    int pageNo=1;
    if(request.getParameter("pageNo")!=null){
        pageNo=Integer.parseInt(request.getParameter("pageNo"));
    }

    OrderDAO orderDAO=new OrderDAO();
    int userid = ((Users)session.getAttribute("user")).getUserid();
    System.out.println("userid="+userid);
    ArrayList<Order> orderArrayList=orderDAO.findOrdersByUserId(userid);//我的订单表
    int size=orderArrayList.size();
    PageModel<Order> pageModel=new PageModel<>(size,pageNo,6,orderArrayList);

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
                    <li><a href="logincheck?action=pagelist&pageNo=1">网站首页</a></li>
                    <li><a href="about.html">关于我们</a></li>
                    <li><a href="help.html">订餐帮助</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container" style="padding-left: 15px">
    <table class="table table-striped">
        <thead>
        <td>订单编号</td>
        <td>用户编号</td>
        <td>送餐状态</td>
        <td>操作</td>
        </thead>
        <tbody>
        <%
            int i=0;
            while(i<pageModel.getList().size()){
                Order orderitem=pageModel.getList().get(i);
        %>
        <tr>
            <td><%=orderitem.getOrderid()%></td>
            <td><%=orderitem.getUserid()%></td>
            <td><%=orderitem.getState()%></td>
            <td class="sorting-1">
                <a href="UserOrderListDetail.jsp?orderid=<%=orderitem.getOrderid()%>">
                <input type="button" class="btn btn-success" name="<%=orderitem.getOrderid()%>" data-toggle="modal" data-target="#myModal" value="查看">
                </a>
            </td>
        </tr>
        <%
                i++;}
        %>
        </tbody>
    </table>

</div>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <%--下面为分页功能--%>
        <TD align="center">
            <nav class="center-block" aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a id="btnTopPage"
                           href="UserOrderList.jsp?pageNo=<%=pageModel.getTop()%>"
                           title="首页">|&lt;&lt; </a>&nbsp;
                    </li>
                    <li>
                        <a id="btnPreviousPage"
                           href="UserOrderList.jsp?pageNo=<%=pageModel.getPrev()%>"
                           title="上页" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                    </li>
                    <%
                        int j=0;
                        while(j<pageModel.getTotalPages()){

                    %>
                    <li <% if(pageModel.getPageNo()==j+1){ %> class="active" <%} %> ><a><%=j+1%></a></li>
                    <%
                            j++;
                        }
                    %>

                    <li>
                        <a id="btnNextPage"
                           href="UserOrderList.jsp?pageNo=<%=pageModel.getNext()%>"
                           title="下页" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
                    </li>
                    <li>
                        <a id="btnBottomPage"
                           href="UserOrderList.jsp?pageNo=<%=pageModel.getBottom()%>"
                           title="尾页"> &gt;&gt;|</a>
                    </li>
                </ul>
            </nav>
        </TD>
    </TR>
    </TBODY>
</TABLE>
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
