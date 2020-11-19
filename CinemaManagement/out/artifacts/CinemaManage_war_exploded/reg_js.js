
function checkRepeat() {
    var name = document.forms["form1"].name.value;
    // alert(name);
    const url = "http://localhost:8080/CinemaManage_war_exploded/checkRepeat.jsp?name="+name;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById('hint1').innerHTML = xmlhttp.responseText;
        }
        else{
            document.getElementById('hint1').innerHTML = "<style color='red'>连接失败</style>"
        }
    }
    xmlhttp.open("GET",url,true);   //设置访问的页面
    xmlhttp.send();  //执行访问
}
