package cinema.servlet;

import cinema.bean.Movie;
import cinema.bean.MovieHall;
import cinema.dao.MovieHallDao;
import org.w3c.dom.html.HTMLTableCaptionElement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.concurrent.TimeoutException;

@WebServlet("/seatSelect")
public class seatSelect extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession(true);
        String timetableId = request.getParameter("timetableId");
        String mName = request.getParameter("mName");
        session.setAttribute("mName", mName);
        session.setAttribute("timetable", new MovieHallDao().getTimetableById(timetableId));
        response.sendRedirect(request.getContextPath()+"/seatSelection_backup.jsp");
    }
}
