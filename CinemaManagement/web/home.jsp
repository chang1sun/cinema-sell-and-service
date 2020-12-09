<%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/20
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" import="cinema.bean.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cinema.bean.MovieHall" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

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
                            out.println("Hello, "+ session.getAttribute("username"));
                        %>
                    </h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li class="active"><a href="<%=request.getContextPath()%>/home.jsp">主页</a></li>
                            <li><a href="<%=request.getContextPath()%>/profile.jsp">我的</a></li>
<%--                            <li><a href="#">Contact</a></li>--%>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="cover">
                <h1 class="cover-heading">影院在线订票系统</h1>
                <div align="center">
                    <p class="lead">欢迎使用在线影院订票系统，选择一个影院展示放映表以继续！</p>
                    <p class="lead">
                    <a href="<%=request.getContextPath()%>/listCinema" class="btn btn-lg btn-default">开始选择影院</a>
                        <div align="center">
                            <%if (request.getAttribute("cinemaSet")!=null){
                                ArrayList<MovieHall> cinemaSet = (ArrayList<MovieHall>)request.getAttribute("cinemaSet");
                                out.println("<div class=\"list-group\">");
                                for (MovieHall mh : cinemaSet) {
                                    out.println("<a href=\"redirectTimetable?mhName="+mh.getName()+"\" class=\"list-group-item\">");
                                    out.println("<h4 class=\"list-group-item-heading\">"+mh.getName()+"</h4>");
                                    out.println(String.format("<p class=\"list-group-item-text\">影院地址：%s (%dx%d)</p>",mh.getAddress(), mh.getRow(),mh.getCol()));
                                    out.println("</a>");
                                }
                                out.println("</div>");
                            }
                            %>
                        </div>
                    </form>
                    </p>
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
