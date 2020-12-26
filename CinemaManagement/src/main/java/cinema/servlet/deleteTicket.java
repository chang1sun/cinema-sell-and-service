package cinema.servlet;

import cinema.dao.TicketDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/deleteTicket")
public class deleteTicket extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("inputId");
        if (new TicketDao().deleteTicket(id)){
            request.setAttribute("message", "取消订单成功！");
        }
        else {
            request.setAttribute("message", "取消失败，检查您的输入");
        }
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
