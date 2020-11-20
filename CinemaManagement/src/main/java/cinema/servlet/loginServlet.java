package cinema.servlet;

import cinema.bean.User;
import cinema.dao.UserDao;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

@WebServlet("/applyLogin")
public class loginServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = new User();
        String id = req.getParameter("username");
        String password = req.getParameter("pw");
        user.setId(id);
        user.setPassword(password);
        boolean flag = new UserDao().checkValid(user);
        if (flag){
            HttpSession userSession = req.getSession(true);
            userSession.setAttribute("username", user.getId());
            resp.sendRedirect(req.getContextPath()+"/home.jsp?username="+user.getId());
        }
        else{
            req.setAttribute("message", "账密错误，请重新登录<br>");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
