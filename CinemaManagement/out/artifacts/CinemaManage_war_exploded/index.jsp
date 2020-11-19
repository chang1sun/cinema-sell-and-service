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
    <meta charset="UTF-8">
    <title>EX2</title>
    <script type="text/javascript" src="reg_js.js"></script>
    <link rel="stylesheet" href="reg_css.css" type="text/css">
</head>
<body>
<h2 class = "title" align="center">用户登录</h2>
<form method = "post" name="form1" action="<%=request.getContextPath()%>/applyLogin">
    <table class="default" align="center">
        <tr><td>
            <%
            if(request.getAttribute("message")!= null){
                out.print(request.getAttribute("message"));
            }
        %>
        </td></tr>
        <tr><td class="item">用户名</td><td><input type="text" name="name"></td></tr>
        <tr><td class="item">密码</td><td><input type="password" name="pw"></td></tr>
        <tr><td colspan="2" align="center">
            <input type="submit" value="登录" class="btn" align="center"></td></tr>
        <tr><td align="center">
            <a href="register.jsp">没有账号？点击注册！</a>
        </td></tr>
    </table>

</form>
</body>
</html>


