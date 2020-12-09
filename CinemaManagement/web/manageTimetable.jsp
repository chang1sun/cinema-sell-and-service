<%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/12/2
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="cinema.bean.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cinema.bean.MovieHall" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cinema.bean.Timetable" %>
<%@ page import="java.sql.Time" %>
<% ArrayList<Timetable> timetables = (ArrayList<Timetable>) session.getAttribute("timetables");%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Manage</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="listCinema_css.css" rel="stylesheet">
</head>

<body>

<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="cover-container">
            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">
                        <%
                            out.println("Hello, " + session.getAttribute("username"));
                        %>
                    </h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li class="active"><a href="">管理面板</a></li>
                            <li><a href="<%=request.getContextPath()%>/index.jsp">返回登录</a></li>
                            <%--                            <li><a href="#">Contact</a></li>--%>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="cover">
                <h1 class="cover-heading">影院在线订票系统</h1>
                <div class="container">
                    <div align="center">
                        <%
                            for (Timetable tt : timetables) {
                                out.println("<tr>");
                                out.println(String.format("<th scope=\"row\">%s</th>", tt.getId()));
                                out.println(String.format("<td><a href=\"seatSelect?mName=%s&timetableId=%s\">%s</td>", tt.getMName(), tt.getId(), tt.getMName()));
                                out.println(String.format("<td>%s</td>", new SimpleDateFormat("MM-dd HH:mm").format(tt.getShowTime())));
                                out.println(String.format("<td>%s</td>", new SimpleDateFormat("MM-dd HH:mm").format(tt.getEndTime())));
                                out.println(String.format("<td>%f</td>", tt.getPrice()));
                                out.println("</tr>");
                            }%>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="span6">

                        </div>
                        <div class="span6">
                            <form class="form-control" action="<%=request.getContextPath()%>/modifyTimeTable">

                                <button class="form-control btn" value="添加" type="submit"></button>
                            </form>

                        </div>
                    </div>
                </div>

            </div>

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


