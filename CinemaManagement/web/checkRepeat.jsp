<%@ page import="cinema.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/18
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    if(name==null){
        out.print("<font color='red'>不能为空</font>");
    }
    if (!new UserDao().checkNameRepeat(name)) {
        out.println("<font color='red'>已经存在</font>");
    }
    else {
        out.println("<font color='green'>可以使用</font>");
    }
%>
