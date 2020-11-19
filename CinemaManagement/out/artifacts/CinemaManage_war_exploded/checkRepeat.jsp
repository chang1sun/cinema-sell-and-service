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
    if (new UserDao().checkValid(name)) {
        out.println("可以使用");
    }
    else {
        out.println("已经存在");
    }
%>
