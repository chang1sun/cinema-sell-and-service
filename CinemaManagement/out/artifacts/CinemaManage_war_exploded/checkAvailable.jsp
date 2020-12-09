<%@ page import="cinema.bean.Seat" %>
<%@ page import="cinema.dao.SeatDao" %><%--
  Created by IntelliJ IDEA.
  User: mechrevo
  Date: 2020/11/21
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
    <%
        String mhName = session.getAttribute("movieHall").toString();
        String row = request.getParameter("row");
        String col = request.getParameter("col");
        if(new SeatDao().CheckAvailable(mhName, row, col)){
            out.println("<style color=\"green\"><h4>可以预定</h4></style>");
        }
        else{
            out.println("<style color=\"green\"><h4>座位已被预订</h4></style>");
        }
    %>
</body>
</html>
