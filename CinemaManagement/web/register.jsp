<%@ page contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EX2</title>
    <script type="text/javascript" src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        function checkRepeat() {
            const name = document.forms["form1"].name.value;
            // alert(name);
            const url = "http://localhost:8080/CinemaManage_war_exploded/checkRepeat.jsp?name="+name;
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("nameError").innerText = xmlhttp.responseText;
                }
                else{
                    document.getElementById("nameError").innerText = "连接失败";
                }
            }
            xmlhttp.open("GET",url,true);   //设置访问的页面
            xmlhttp.send();  //执行访问
        }

        function checkPasswordValid(){
            if $()
        }
    </script>
    <link rel="stylesheet" href="reg_css.css" type="text/css">
</head>
<body>
<h2 class = "title" align="center">用户注册</h2>
<form method = "post" name="form1" action="applyRegister">
    <table class="default" align="center">
        <tr><td class="item">姓名</td><td>
            <input id="b1" type="text" name="name" onkeyup="checkRepeat()">
            <div id="nameError" style="display:inline;color:#ff0000;"></div>
        </td></tr>
        <tr><td class="item">密码</td><td>
            <input type="password" name="pw">
            <div id="passwordError" style="display:inline;color:red;"></div>
        </td></tr>
        <tr><td class="item">确认密码</td><td>
            <input type="password" name="pw2">
            <div id="relpasswordError" style="display:inline;color:red;"></div>
        </td></tr>
        <tr><td colspan="2" align="center">
            <input type="submit" value="注册" class="btn" align="center"></td></tr>
        <tr><td align="center">
            <a href="index.jsp">已有账号？点击登录！</a>
        </td></tr>
    </table>
<script type="text/javascript">

</script>
</form>
</body>
</html>