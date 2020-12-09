package cinema.servlet;

import cinema.dao.TruncateDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class truncateServlet extends HttpServlet {
     public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
         response.setCharacterEncoding("UTF-8");
         if (new TruncateDao().truncateDatabase()){
             response.sendRedirect(request.getContextPath()+"/root.jsp?message=清空表操作成功！");
         }
     }
}
