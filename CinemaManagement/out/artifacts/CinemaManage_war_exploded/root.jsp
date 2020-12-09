<%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/12/1
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8" language="java" import="cinema.bean.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cinema.bean.MovieHall" %>
<%@ page import="cinema.dao.UserDao" %>

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
    <script type="text/javascript">
        <%if(request.getParameter("message")!=null){ %>
            alert("<%=request.getParameter("message")%>")
        <% } %>
    </script>
    <script type="text/javascript">
        function checkValid(){
            const name = document.getElementById("inputName").value;
            const url = "http://localhost:8080/CinemaManage_war_exploded/checkRepeat.jsp?name="+name;
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("nameError").innerHTML = xmlhttp.responseText;
                }
                else{
                    document.getElementById("nameError").innerText = "连接失败";
                }
            }
            xmlhttp.open("GET",url,true);   //设置访问的页面
            xmlhttp.send();  //执行访问
        }
    </script>
    <script type="text/javascript">
        function anotherCheck(){
            document.getElementById("done").setAttribute("class", "show");
            document.getElementById("donesubmit").setAttribute("class", "btn btn-default");
        }
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
                            String username = (String)session.getAttribute("username");
                            if(!username.equals("root")){
                                out.println("Hello, "+ session.getAttribute("username"));}
                            else{out.println("影院管理面板");}
                        %>
                    </h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li class="active"><a href="<%=request.getContextPath()%>/index.jsp">主页</a></li>
                            <li><a href="<%=request.getContextPath()%>/index.jsp">我的</a></li>
                            <%--                            <li><a href="#">Contact</a></li>--%>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="cover">
                <h1 class="cover-heading">影院在线订票系统</h1>
                <div align="center">
                    <p class="lead">欢迎！打工人</p>
                    <p class="lead">
                        <a href="" class="btn btn-lg btn-default">选择以下条目管理影院</a>
                    <div class="list-group">
                        <a id="manage" href="<%=request.getContextPath()%>/listCinema" class="list-group-item list-group-item-info">管理影院档期</a>
                        <a id="blacklist" href="<%=request.getContextPath()%>/root.jsp?link=blacklist" class="list-group-item list-group-item-warning">黑名单管理</a>
                        <a id="die" class="list-group-item list-group-item-danger" onclick="anotherCheck()">删库跑路</a>
                        <span id="done" class="hide">此操作不可逆，确认要继续吗？</span>
                        <a href="" id="donesubmit" class="btn btn-default hide">选择</a>
                    </div>
                    </p>
                </div>
                <div class="cover-container" style="align-content: center">
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
                    <%if (request.getParameter("link")!=null && request.getParameter("link").equals("blacklist")){ %>
                    <%ArrayList<User> users = new UserDao().getAllUser();%>
                    <%if(users!=null){ %>
                    <table class="table">
                        <thead><tr><th>用户名</th><th>密码</th></tr></thead>
                        <tbody>
                        <%
                            for (User user: users) { %>
                            <tr>
                                <td><%=user.getId()%></td>
                                <td><%=user.getPassword()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <form class="form-group" action="<%=request.getContextPath()%>/banUser" method="post">
                        <label for="inputName" class="label-danger">用户名</label>
                        <input class="form-control" type="text" name="inputName" id="inputName" placeholder="在此输入拉黑用户的用户名" onkeyup="checkValid()">
                        <span id="nameError" class="help-block"></span>
                        <button class="form-control" type="submit">确认拉黑</button>
                    </form>
                    <% } %>
                    <div><h2>暂无已注册用户</h2></div>
                    <% } %>
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

