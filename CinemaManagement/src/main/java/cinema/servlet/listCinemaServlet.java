package cinema.servlet;

import cinema.bean.Movie;
import cinema.bean.MovieHall;
import cinema.bean.User;
import cinema.dao.MovieHallDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/listCinema")
public class listCinemaServlet extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<MovieHall> cinemaSet = new MovieHallDao().listMovieHall();
        request.setAttribute("cinemaSet", cinemaSet);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
