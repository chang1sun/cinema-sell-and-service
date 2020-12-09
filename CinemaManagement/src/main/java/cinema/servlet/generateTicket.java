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
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.security.cert.CollectionCertStoreParameters;
import java.util.List;
import java.util.Map;


@WebServlet("/generateTicket")
public class generateTicket extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Gson gson = new Gson();
        System.out.println(request.getParameter("Seats"));
        List<Map<String, String>> list = gson.fromJson(request.getParameter("Seats"), new TypeToken<List<Map<String, String>>>() {
        }.getType());
        HttpSession session = request.getSession(true);
        session.setAttribute("orders", list);
    }
}