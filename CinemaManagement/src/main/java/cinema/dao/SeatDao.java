package cinema.dao;

import cinema.bean.Movie;
import cinema.bean.MovieHall;
import cinema.bean.Timetable;

import java.sql.*;
import java.util.ArrayList;

public class SeatDao {
    public SeatDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cinema?characterEncoding=UTF-8&serverTimezone=GMT%2B8", "root", "058918");
    }

    public boolean CheckAvailable(String mhName, String row, String col) {
        try (Connection c = getConnection()) {
            String sql = "select * from Seat where MH_ID = ? and Row_NO = ? and Column_NO = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, mhName);
            ps.setString(2, row);
            ps.setString(3, col);
            ResultSet rs = ps.executeQuery();
            return !rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String[] getReserved(Timetable tt){
        try (Connection c = getConnection()) {
            ArrayList<String> res = new ArrayList<>();
            String sql = "select Row_NO, Column_NO from seat where MH_ID = ? and SP_ID = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, tt.getMhName());
            ps.setString(2, tt.getId());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String row = rs.getString(1);
                String col = rs.getString(2);
                res.add(String.format("%s_%s", row, col));
            }
            return res.toArray(new String[0]);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public boolean resetReserved(Timetable tt) {
        if (tt == null) {
            return true;
        }
        if (new TicketDao().deleteTicket(tt)) {
            try (Connection c = getConnection()) {
                String sql = "delete from seat where SP_ID = ?";
                PreparedStatement ps = c.prepareStatement(sql);
                ps.setString(1, tt.getId());
                ps.execute();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
        }
        return false;
    }
}
