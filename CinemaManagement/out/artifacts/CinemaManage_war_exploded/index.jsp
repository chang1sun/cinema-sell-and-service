<%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/14
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EX2</title>
    <script type="text/javascript" src="reg_js.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="login_css.css">
    <script type="text/javascript" src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

    <form method="post" class="form-signin" action="<%=request.getContextPath()%>/applyLogin">
        <h2 class="form-signin-heading">登录</h2>
        <div>
            <%
                if(request.getAttribute("message")!= null){
                    out.print(request.getAttribute("message"));
                }
                if(request.getParameter("message")!=null){
                    out.print(request.getParameter("message"));
                }
            %>
        </div>
        <label for="inputEmail" class="sr-only">用户名</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="pw" id="inputPassword" class="form-control" placeholder="密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    <div align="center"><a href="register.jsp">没有账号？点击注册！</a></div>
    </form>
</div> <!-- /container -->
</body>
</html>

<%--<body>--%>
<%--<h2 class = "title" align="center">用户登录</h2>--%>
<%--<form method = "post" name="form1" action="<%=request.getContextPath()%>/applyLogin">--%>
<%--    <table class="default" align="center">--%>
<%--        <tr><td>--%>
<%--            <%--%>
<%--            if(request.getAttribute("message")!= null){--%>
<%--                out.print(request.getAttribute("message"));--%>
<%--            }--%>
<%--        %>--%>
<%--        </td></tr>--%>
<%--        <tr><td class="item">用户名</td><td><input type="text" name="name"></td></tr>--%>
<%--        <tr><td class="item">密码</td><td><input type="password" name="pw"></td></tr>--%>
<%--        <tr><td colspan="2" align="center">--%>
<%--            <input type="submit" value="登录" class="btn" align="center"></td></tr>--%>
<%--        <tr><td align="center">--%>
<%--            <a href="register.jsp">没有账号？点击注册！</a>--%>
<%--        </td></tr>--%>
<%--    </table>--%>

<%--</form>--%>
<%--</body>--%>
<%--</html>--%>


