<%@ page contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>EX2</title>

    <link rel="stylesheet" href="login_css.css" type="text/css">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">

    <script type="text/javascript" src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function checkValid(){
                const name = document.getElementById("inputEmail").value;
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
        function checkBeforeSubmit(){
            var flag = true;
            if (document.getElementById("inputPassword").value.length < 6){
                flag = false;
                alert("密码长度需至少为6！");
            }
            else if(document.getElementById("checkPassword").value.equals(document.getElementById("inputPassword").value)){
                flag = false;
                alert("两次密码输入不一致！");
            }
            return flag;
        }
    </script>
</head>
<body>
<div class="container">

    <form method="post" class="form-signin" action="<%=request.getContextPath()%>/applyRegister" onsubmit="return checkBeforeSubmit()">
        <h2 class="form-signin-heading">注册</h2>
        <label for="inputEmail" class="sr-only">用户名</label>
        <input type="text" onkeyup="checkValid()" name="username" id="inputEmail" class="form-control" placeholder="用户名" required autofocus>
        <span id="nameError" class="help-block"></span>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="pw" id="inputPassword" class="form-control" placeholder="密码" required>
        <span id="helpBlock" class="help-block">The length of password should be at least 6</span>
        <label for="checkPassword" class="sr-only">确认密码</label>
        <input type="password" name="pw2" id="checkPassword" class="form-control" placeholder="确认密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
    </form>
    <div align="center"><a href="index.jsp">已有账号？点击登录！</a><div>

    </div> <!-- /container -->
</body>
</html>

<%--<body>--%>
<%--<h2 class = "title" align="center">用户注册</h2>--%>
<%--<form method = "post" name="form1" onsubmit="return checkBeforeSubmit()" action="applyRegister">--%>
<%--    <table class="default" align="center">--%>
<%--        <tr><td class="item">姓名</td><td>--%>
<%--            <input id="b1" type="text" name="name" onkeyup="checkRepeat()">--%>
<%--            <div id="nameError" style="display:inline;color:#ff0000;"></div>--%>
<%--        </td></tr>--%>
<%--        <tr><td class="item">密码</td><td>--%>
<%--            <input type="password" name="pw">--%>
<%--            <div id="passwordError" style="display:inline;color:red;"></div>--%>
<%--        </td></tr>--%>
<%--        <tr><td class="item">确认密码</td><td>--%>
<%--            <input type="password" name="pw2">--%>
<%--            <div id="relpasswordError" style="display:inline;color:red;"></div>--%>
<%--        </td></tr>--%>
<%--        <tr><td colspan="2" align="center">--%>
<%--            <input type="submit" value="注册" class="btn" align="center"></td></tr>--%>
<%--        <tr><td align="center">--%>
<%--            <a href="index.jsp">已有账号？点击登录！</a>--%>
<%--        </td></tr>--%>
<%--    </table>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>