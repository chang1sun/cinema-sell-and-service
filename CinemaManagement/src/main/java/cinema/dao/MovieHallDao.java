package cinema.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import cinema.bean.Movie;
import cinema.bean.MovieHall;
import cinema.bean.Timetable;

import javax.swing.*;


public class MovieHallDao{
    public MovieHallDao(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cinema?characterEncoding=UTF-8&serverTimezone=UTC", "root", "058918");
    }
    public ArrayList<MovieHall> listMovieHall(){

        try(Connection c = getConnection();){
            String sql =  "select MH_Name, Cinema_Address from movie_hall";
            PreparedStatement ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<MovieHall> arr = new ArrayList<>();
            while(rs.next()){
                MovieHall movieHall = new MovieHall(rs.getString(1), rs.getString(2));
                arr.add(movieHall);
            }
            return arr;
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Timetable> getAllTimetable(String mhName){
        try(Connection c = getConnection()){
            String sql = "select * from time_table where MH_ID = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, mhName);
            ResultSet rs = ps.executeQuery();
            ArrayList<Timetable> arr = new ArrayList<>();
            while (rs.next()){
                Timetable tt = new Timetable();
                tt.setId(rs.getInt(1));
                tt.setPrice(rs.getDouble(2));
                tt.setShowTime(rs.getTimestamp(3));
                tt.setEndTime(rs.getTimestamp(4));
                tt.setMhName(rs.getString(5));
                tt.setMName(rs.getString(6));
                arr.add(tt);
            }
            if(!arr.isEmpty()){return arr;}
            else{return null;}
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
