package cinema.dao;
import java.nio.channels.ScatteringByteChannel;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.List;


import cinema.bean.Movie;
import cinema.bean.MovieHall;
import cinema.bean.Timetable;

import javax.servlet.jsp.el.ScopedAttributeELResolver;
import javax.swing.*;


public class MovieHallDao {
    public MovieHallDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cinema?characterEncoding=UTF-8&serverTimezone=UTC", "root", "058918");
    }

    public MovieHall getMovieHallByName(String mhName) {
        try (Connection c = getConnection();) {
            String sql = "select * from movie_hall where MH_Name = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, mhName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                MovieHall movieHall = new MovieHall(mhName, rs.getString(2));
                movieHall.setRow(rs.getInt(3));
                movieHall.setCol(rs.getInt(4));
                return movieHall;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public ArrayList<MovieHall> listMovieHall() {

        try (Connection c = getConnection()) {
            String sql = "select * from movie_hall";
            PreparedStatement ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<MovieHall> arr = new ArrayList<>();
            while (rs.next()) {
                MovieHall movieHall = new MovieHall(rs.getString(1), rs.getString(2));
                movieHall.setRow(rs.getInt(3));
                movieHall.setCol(rs.getInt(4));
                arr.add(movieHall);
            }
            return arr;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Timetable> getAllTimetable(String mhName) {
        try (Connection c = getConnection()) {
            String sql = "select * from time_table where MH_ID = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, mhName);
            ResultSet rs = ps.executeQuery();
            ArrayList<Timetable> arr = new ArrayList<>();
            while (rs.next()) {
                Timetable tt = new Timetable();
                tt.setId(rs.getString(1));
                tt.setPrice(rs.getDouble(2));
                tt.setShowTime(rs.getTimestamp(3));
                tt.setEndTime(rs.getTimestamp(4));
                tt.setMName(rs.getString(5));
                tt.setMhName(rs.getString(6));
                arr.add(tt);
            }
            if (!arr.isEmpty()) {
                return arr;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Timetable getTimetableById(String id) {
        try (Connection c = getConnection()) {
            String sql = "select * from time_table where SP_ID = ?";
            Timetable timetable = new Timetable();
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                timetable.setId(id);
                timetable.setPrice(rs.getDouble(2));
                timetable.setShowTime(rs.getTimestamp(3));
                timetable.setEndTime(rs.getTimestamp(4));
                timetable.setMName(rs.getString(5));
                timetable.setMhName(rs.getString(6));
                return timetable;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteTimetableById(String id){
        try (Connection c = getConnection()) {
            String sql = "delete from time_table where SP_ID = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, id);
            ps.execute();
            return new SeatDao().resetReserved(getTimetableById(id));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addTimetable(Timetable tt){
        try (Connection c = getConnection()) {
            String sql = "insert into time_table values (?,?,?,?,?,?)";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, String.format("%s", DateTimeFormatter.ofPattern("MMddhhmmss").format(LocalDateTime.now())));
            ps.setDouble(2, tt.getPrice());
            ps.setTimestamp(3, tt.getShowTime());
            ps.setTimestamp(4, tt.getEndTime());
            ps.setString(5, tt.getMName());
            ps.setString(6, tt.getMhName());
            ps.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}