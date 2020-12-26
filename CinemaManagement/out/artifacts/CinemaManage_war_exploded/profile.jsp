<%@ page import="cinema.bean.MovieHall" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/22
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="listCinema_css.css" rel="stylesheet">
    <script type="text/javascript">
        function showOrHide() {
            const way = document.getElementById("condition").value;
            if (way == '0'){
                document.getElementById("inputData").setAttribute("disabled", "disabled");
                document.getElementById("but").setAttribute("disabled", "disabled");
            }
            if (way == "1" || way == "5"){
                document.getElementById("inputData").setAttribute("disabled", "disabled");
                document.getElementById("but").removeAttribute("disabled");
            }
            else{
                document.getElementById("inputData").removeAttribute("disabled");
                document.getElementById("but").removeAttribute("disabled");
            }
        }
    </script>
    <script type="text/javascript">
        <%if(request.getParameter("message")!=null){ %>
            alert("<%=request.getParameter("message")%>");
        <% }else if(request.getAttribute("message")!=null){ %>
            alert("<%=request.getAttribute("message")%>");
        <%} %>
    </script>
</head>

<body>

<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="cover-container">
            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">
                        <%
                            out.println("当前登录用户： "+session.getAttribute("username"));
                        %>
                    </h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li><a href="<%=request.getContextPath()%>/home.jsp">主页</a></li>
                            <li  class="active"><a href="#">我的</a></li>
<%--                            <li><a href="#">Contact</a></li>--%>
                        </ul>
                    </nav>
                </div>
            </div>
            <%if(request.getAttribute("order")!=null){ %>
            <div class="cover">
                <div align="center">
                    <%ArrayList<String[]> tickets = (ArrayList<String[]>)session.getAttribute("tickets");%>
                    <%if (tickets.isEmpty()){out.println("<div><h2>无订单信息！</h2></div>");}else{%>
                    <div class="cover-container">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>行</th>
                            <th>列</th>
                            <th>影厅ID</th>
                            <th>开始时间</th>
                            <th>散场时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (String[] ticket: tickets) { %>
                        <tr>
                            <td><%=ticket[0]%></td>
                            <td><%=ticket[1]%></td>
                            <td><%=ticket[2]%></td>
                            <td><%=ticket[3]%></td>
                            <td><%=ticket[4]%></td>
                            <td><%=ticket[5]%></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                    </div>
                    <div class="cover-container">
                    <h4>如需退票请输入下方表单并提交</h4>
                    <form class="form-group" action="<%=request.getContextPath()%>/deleteTicket" method="post">
                        <label for="inputTicketId" class="sr-only">退票</label>
                        <input class="form-control text-success" id="inputTicketId" name="inputId" placeholder="请输入ID~">
                        <button class="form-control btn-default" type="submit">确认提交</button>
                    </form>
                    </div>
                    <%}%>
                </div>
            </div>
            <% }else{ %>
            <div class="cover">
                <h1 class="cover-heading">您好! <%=session.getAttribute("username")%></h1>
                <div align="center">
                    <p class="lead">若要查询您的订单，请按如下表单输入</p>
                    <p class="lead">
                    <form class="navbar-form navbar-left" role="search" method="post" action="<%=request.getContextPath()%>/SearchTicketServlet">
                        <div class="form-group">
                            <input id="inputData" name="data" type="text" class="form-control" placeholder="输入查询依据的信息..." required  autofocus disabled>
                            <select id="condition" name="way" class="form-control" onchange="showOrHide()">
                                <option value="0">-选择查询方式-</option>
                                <option value="1">查询所有订单</option>
                                <option value="2">通过订单号查询订单</option>
                                <option value="3">通过影院查询订单</option>
                                <option value="4">通过电影名称查询订单</option>
                                <option value="5">查询即将开始场订单(24小时内)</option>
                            </select>
                            <button type="submit" id="but" class="form-control btn btn-lg btn-default" disabled>查询订单</button>
                        </div>
                    </form>

                    </p>
                </div>

            </div>
            <% } %>
        </div>

    </div>

</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script>window.jQuery || document.write('<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"><\/script>')</script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>

