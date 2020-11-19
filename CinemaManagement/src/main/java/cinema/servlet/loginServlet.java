package cinema.servlet;

import cinema.bean.User;
import cinema.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/applyLogin")
public class loginServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        User user = new User();
        String id = req.getParameter("name");
        String password = req.getParameter("pw");
        user.setId(id);
        user.setPassword(password);
        boolean flag = new UserDao().checkValid(user);
        if (flag){
            resp.sendRedirect(req.getContextPath()+"/info.jsp?username="+user.getId());
        }
        else{
            req.setAttribute("message", "账密错误，请重新登录<br>");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
