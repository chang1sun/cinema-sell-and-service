package cinema.servlet;

import cinema.bean.Timetable;
import cinema.dao.MovieHallDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/redirectTimetable")
public class redirectTimetableServlet extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.setAttribute("movieHall", new MovieHallDao().getMovieHallByName(request.getParameter("mhName")));
        ArrayList<Timetable> timetables = new MovieHallDao().getAllTimetable(request.getParameter("mhName"));
        session.setAttribute("timetables", timetables);
        response.sendRedirect(request.getContextPath()+"/showTimetable.jsp");
    }
}
