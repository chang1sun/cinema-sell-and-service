package cinema.servlet;

import cinema.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/banUser")
public class banUser extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("inputName");
        res.setCharacterEncoding("UTF-8");
        if (username != null && username.equals("root")){
            res.sendRedirect(req.getContextPath()+"/root.jsp?message=Access Denied!");
            return;
        }
        if (new UserDao().deleteUser(username)){
            res.sendRedirect(req.getContextPath()+"/root.jsp?message=Ok");
        }
    }
}
