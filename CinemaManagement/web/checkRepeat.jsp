<%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/16
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" import="cinema.dao.UserDao" %>

<%
    String name = request.getParameter("name");
    if(new UserDao().checkValid(name)) {
        out.print("<font color='red'>已经存在</font>");
    }
    else {
        out.print("<font color='green'>可以使用</font>");
    }

%>

