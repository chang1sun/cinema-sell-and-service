package cinema.servlet;

import cinema.bean.*;
import cinema.dao.TicketDao;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.security.cert.CollectionCertStoreParameters;
import java.util.List;
import java.util.Map;


@WebServlet("/addTicket")
public class addTicket extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        Ticket ticket = new Ticket();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);

        String username = (String) session.getAttribute("username");
        String mhName = ((MovieHall) session.getAttribute("movieHall")).toString();
        String spId = ((Timetable) session.getAttribute("timetable")).getId();
        Gson gson = new Gson();
        System.out.println(request.getParameter("Seats"));
        List<Map<String,String>> list = (List<Map<String, String>>) session.getAttribute("orders");

        boolean flag = false;
        for(Map<String,String> map : list){
            String row = map.get("row");
            String col = map.get("col");
            flag = new TicketDao().addTicket(username, mhName, row, col, spId);
        }
        if(flag){
            response.sendRedirect(request.getContextPath()+String.format("/profile.jsp?message=%s", URLEncoder.encode("订票成功！", StandardCharsets.UTF_8)));
        }
        else{
            request.setCharacterEncoding("utf-8");
            request.setAttribute("errAlert", "订票失败，请重试");
            request.getRequestDispatcher("seatSelection_backup.jsp").forward(request, response);
        }

    }
}
