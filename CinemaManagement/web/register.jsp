<%@ page contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EX2</title>
    <script type="text/javascript">
        function check(){
            var pw = document.forms["form1"].pw.value;
            if (pw.length < 6) {
                alert("密码长度需大于6！");
            }
            var pw2 = document.forms["form1"].pw2.value;
            if (pw != pw2){
                alert("密码不一致！");
            }
        }

        function checkRepeat() {
            var name = document.forms["form1"].name.value;
            // alert(name);
            const url = "http://localhost:8080/CinemaManage_war_exploded/checkRepeat.jsp?name="+name;
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById('hint').innerHTML = xmlhttp.responseText;
                }
                else{
                    document.getElementById('hint').innerHTML = "<style color='red'>连接失败</style>"
                }
            }
            xmlhttp.open("GET",url,true);   //设置访问的页面
            xmlhttp.send();  //执行访问
        }
    </script>
    <link rel="stylesheet" href="reg_css.css" type="text/css">
</head>
<body>
<h2 class = "title" align="center">用户注册</h2>
<form method = "post" name="form1" onsubmit="check()">
    <table class="default" align="center">
        <tr><td class="item">姓名</td><td><input id="b1" type="text" name="name" onkeyup="checkRepeat()"></td><td><span id="hint"></span></td></tr>
        <tr><td class="item">密码</td><td><input type="password" name="pw"></td></tr>
        <tr><td class="item">确认密码</td><td><input type="password" name="pw2"></td></tr>

        <tr><td colspan="2" align="center">
            <input type="submit" value="注册" class="btn" align="center"></td></tr>
        <tr><td align="center">
            <a href="index.jsp">已有账号？点击登录！</a>
        </td></tr>
    </table>

</form>
</body>
</html>