<%@ page import="cinema.bean.MovieHall" %>
<%@ page import="cinema.bean.Movie" %>
<%@ page
        import="cinema.bean.Timetable" %>
<%@ page import="java.text.SimpleDateFormat" %><%-- Created by IntelliJ IDEA. User: mechrevo Date: 2020/11/21 Time: 14:07 To change this template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% MovieHall movieHall = (MovieHall) session.getAttribute("movieHall");%>
<% Timetable timetable = (Timetable) session.getAttribute("timetable");%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Choose your seat</title>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="listCinema_css.css" rel="stylesheet">
    <script type="text/javascript">
        function checkAvailable(){
            const row = document.getElementById("row").value;
            const col = document.getElementById("col").value;
            const url = "http://localhost:8080/CinemaManage_war_exploded/checkAvailable.jsp?row="+row+"&col="+col;
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("nameRepeat").innerHTML = xmlhttp.responseText;
                }
                else{
                    document.getElementById("nameRepeat").innerText = "连接失败";
                }
            }
            xmlhttp.open("GET",url,true);   //设置访问的页面
            xmlhttp.send();  //执行访问
        }
    </script>
</head>
<body>
<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="cover-container">
            <div class="masthead clearfix">
                <div class="inner"><h3
                        class="masthead-brand"><% out.println("Hello, " + session.getAttribute("username"));%></h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#">Features</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="booking_area">
                <p><h2 id="mhname"><%=session.getAttribute("movieHall").toString()%></h2></p>
                <p>名称：<span><%=timetable.getMName()%></span></p>
                <p>时间：<span><%=String.format("%s—%s", new SimpleDateFormat("HH:mm").format(timetable.getShowTime()), new SimpleDateFormat("HH:mm").format(timetable.getEndTime()))%></span></p>
                    <form id="form1" class="form-group" method="post" action= "<%=request.getContextPath()%>/addTicket">
                        <input type="text" class="text-info" placeholder="<%=session.getAttribute("username")%>" readonly>
                        <input type="text" class="text-success" placeholder="<%=session.getAttribute("movieHall").toString()%>" readonly>
                        <input name="row" type="text" class="form-control" placeholder="选择行" required>
                        <input type="text" name="col" class="form-control" placeholder="选择列" onkeyup="checkAvailable()" required>
                        <span id="nameRepeat" class="help-block"></span>
                        <input type="submit" class="form-control" value="确定订票">
                    </form>
                    <div id="legend"></div>
                </div>
            </div>
        </div>
    </div>



<script>window.jQuery || document.write('<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"><\/script>')</script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/jquery.seat-charts.min.js"></script>
</body>
</html>
