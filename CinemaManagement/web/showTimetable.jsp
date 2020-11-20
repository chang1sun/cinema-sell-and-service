<%@ page import="cinema.bean.Timetable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/20
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Timetable> timetables = (ArrayList<Timetable>)session.getAttribute("timetables");%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%= session.getAttribute("mhName")%></title>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="panel-heading"><%=session.getAttribute("mhName")%>></div>
<div class="panel-body">
    <p><h4>在以下的放映表中，选择您感兴趣的电影及排期！</h4></p>
</div>
<!-- Table -->
<table class="table table-striped">
    <thead>
    <tr>
        <th>#</th>
        <th>影片</th>
        <th>开始（上映）时间</th>
        <th>结束（散场）时间</th>
        <th>售价</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Timetable tt: timetables) {
            out.println("<tr>");
            out.println(String.format("<th scope=\"row\">%d</th>", tt.getId()));
            out.println(String.format("<td>%s</td>", tt.getMName()));
            out.println(String.format("<td>%s</td>", new SimpleDateFormat("MM-dd HH:mm").format(tt.getShowTime())));
            out.println(String.format("<td>%s</td>", new SimpleDateFormat("MM-dd HH:mm").format(tt.getEndTime())));
            out.println(String.format("<td>%f</td>", tt.getPrice()));
            out.println("</tr>");
        }%>
    </tbody>
</table>
</div>
<script>window.jQuery || document.write('<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"><\/script>')</script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
