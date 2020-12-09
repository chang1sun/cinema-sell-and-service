package cinema.servlet;

import cinema.bean.User;
import cinema.dao.UserDao;


import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/applyRegister")
public class addUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String pw = req.getParameter("pw");
        User user = new User();
        user.setId(name);
        user.setPassword(pw);
        UserDao dao = new UserDao();
        boolean flag = dao.addUser(user);
        if(flag){
            resp.sendRedirect(req.getContextPath()+"/index.jsp?message=Registered Successfully!");
        }else {
            req.setAttribute("message", "注册失败!");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }

    }
}
