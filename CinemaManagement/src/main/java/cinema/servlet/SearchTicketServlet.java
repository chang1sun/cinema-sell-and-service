package cinema.servlet;

import cinema.bean.Ticket;
import cinema.dao.TicketDao;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLEditorKit;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/SearchTicketServlet")
public class SearchTicketServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");
        String method = req.getParameter("way");
        HttpSession session = req.getSession(true);
        ArrayList<String[]> arr = new ArrayList<>();
        switch (method) {
            case "1" -> arr = new TicketDao().SelectAll((String) session.getAttribute("username"));
            case "2" -> arr = new TicketDao().selectTicket_ID((String) session.getAttribute("username"), req.getParameter("data"));
            case "3" -> arr = new TicketDao().selectMH((String) session.getAttribute("username"), req.getParameter("data"));
            case "4" -> arr = new TicketDao().selectMovie((String) session.getAttribute("username"), req.getParameter("data"));
            case "5" -> arr = new TicketDao().select24hours((String) session.getAttribute("username"));
        }
        session.setAttribute("tickets", arr);
        req.setAttribute("order", true);
        req.getRequestDispatcher("profile.jsp").forward(req,res);
    }
}
