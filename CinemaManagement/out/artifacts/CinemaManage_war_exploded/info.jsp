<%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/17
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>
    <% out.println("Hello, "+request.getParameter("username"));%>
</h1>
</body>
</html>
