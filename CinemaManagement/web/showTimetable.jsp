<%@ page import="cinema.bean.Timetable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cinema.bean.MovieHall" %>
<%@ page import="cinema.dao.MovieHallDao" %>
<%@ page import="cinema.dao.MovieDao" %>
<%@ page import="cinema.bean.Movie" %><%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/20
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% ArrayList<Timetable> timetables = (ArrayList<Timetable>)session.getAttribute("timetables");%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%= session.getAttribute("mhName")%></title>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="listCinema_css.css" rel="stylesheet">
    <script type="text/javascript">
        <%if(request.getAttribute("message")!=null){ %>
            alert("<%=request.getAttribute("message")%>>")
        <%} %>
    </script>
</head>
<body>
<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="cover-container">
                    <div class="masthead clearfix">
                        <div class="inner">
                            <h3 id="forUser" class="masthead-brand">
                                <%
                                    out.println("Hello, "+ session.getAttribute("username"));
                                %>
                            </h3>
                            <nav>
                                <ul class="nav masthead-nav">
                                    <%if(!session.getAttribute("username").equals("root")){%>
                                    <li class="active"><a href="home.jsp">主页</a></li>
                                    <li><a href="profile.jsp">我的</a></li>
                                    <%}else{%>
                                    <li class="active"><a href="root.jsp">管理面板</a></li>
                                    <%}%>
                                </ul>
                            </nav>
                        </div>
                    </div>
            <div class="container-fluid">
                <div class="row">
                    <div>
                    <div class="panel-heading"><h2><%=(MovieHall)session.getAttribute("movieHall")%>影厅</h2></div>
                    <div class="panel-body">
                        <% if(!session.getAttribute("username").equals("root")){
                            out.print("<p><h4>在以下的放映表中，选择您感兴趣的电影及排期！</h4></p>");
                        }
                        else{
                            out.print("<p><h4>调整档期</h4></p>");
                        }
                        %>


                    </div>
                    <%if (timetables!=null){ %>
                    <!-- Table -->
                    <table class="table" id="table1">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>影片</th>
                            <th>开始（上映）时间</th>
                            <th>结束（散场）时间</th>
                            <th>售价</th>
                            <th>总计影片场次</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Timetable tt: timetables) {
                                Movie movie =  new MovieDao().getNameByTimetable(tt.getId());
                                out.println("<tr>");
                                out.println(String.format("<th scope=\"row\">%s</th>", tt.getId()));
                                out.println(String.format("<td><a href=\"seatSelect?mName=%s&timetableId=%s\">%s(导演：%s)</td>", tt.getMName(),tt.getId(), tt.getMName(), movie.getDirector()));
                                out.println(String.format("<td>%s</td>", new SimpleDateFormat("MM-dd HH:mm").format(tt.getShowTime())));
                                out.println(String.format("<td>%s</td>", new SimpleDateFormat("MM-dd HH:mm").format(tt.getEndTime())));
                                out.println(String.format("<td>%f</td>", tt.getPrice()));
                                out.println(String.format("<td>%d</td>", movie.getNum()));
                                out.println("</tr>");
                            }%>
                        </tbody>
                    </table>
                    <% }else{ %>
                        <h2>该影厅暂无档期！</h2>
                    <% } %>
                    </div>
                </div>
            </div>
        </div>
        <% if(session.getAttribute("username").equals("root")){ %>
        <div id="rootOnly" class="cover-container">
            <div class="col-xs-6">
            <p>
            <form class="form-group" action="<%=request.getContextPath()%>/modifyTimeTable" method="post">
                <label class="sr-only" for="inputMName">影片名称</label>
                <input width="50" id="inputMName" name="inputMName" class="form-control" type="text" placeholder="影片名称" required autofocus>
                <span class="help-block">日期格式：yyyy-mm-dd hh:mm:ss</span>
                <label class="sr-only" for="inputStartTime">开始时间</label>
                <input width="50" id="inputStartTime" name="inputStartTime" class="form-control" type="text" placeholder="开始时间" required>
                <label class="sr-only" for="inputEndTime">结束时间</label>
                <input width="50" id="inputEndTime" name="inputEndTime" class="form-control" type="text" placeholder="结束时间" required>
                <label class="sr-only" for="inputEndTime">价格</label>
                <input width="50" id="inputPrice" name="inputPrice" class="form-control" type="text" placeholder="价格" required>
                <button class="form-control btn-info" type="submit">添加</button>
            </form>
            </p>
            </div>
            <div class="col-xs-6">
            <p>
            <h3>
                或者您想删除某个档期...
            </h3>
            <form class="form-group" action="<%=request.getContextPath()%>/modifyTimeTable" method="post">
                <label for="inputID" class="sr-only">ID</label>
                <input id="inputID" name="inputId" class="form-control" type="text" placeholder="档期的ID" required>
                <label>
                    <input class="form-control" type="checkbox" name="box" value="1">
                    我只是想清空该档期的数据而已
                </label>
                <button class="form-control btn-danger" type="submit">提交</button>
            </form>
            </p>
        </div>
        </div>
        <%}%>
    </div>
</div>
<script>window.jQuery || document.write('<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"><\/script>')</script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
