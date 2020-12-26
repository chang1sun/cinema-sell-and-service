package cinema.dao;

import cinema.bean.Movie;

import java.sql.*;

public class MovieDao {
    public MovieDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cinema?characterEncoding=UTF-8&serverTimezone=GMT%2B8", "root", "058918");
    }

    public boolean addMovie(String mName){
        try (Connection c = getConnection()) {
            String sql1 = "select * from movie where Movie_ID = ?";
            String sql = "insert into movie values (?,null,null,null,0)";
            PreparedStatement ps = c.prepareStatement(sql1);
            ps.setString(1, mName);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){ return true;}
            ps = c.prepareStatement(sql);
            ps.setString(1, mName);
            ps.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Movie getNameByTimetable(String tt_id){
        try (Connection c = getConnection()) {
            Movie movie = new Movie();
            String sql = "select m.Movie_ID, m.Diertor, m.num from time_table join movie m on time_table.Movie_ID = m.Movie_ID where SP_ID=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, tt_id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                movie.setName(rs.getString(1));
                movie.setDirector(rs.getString(2));
                movie.setNum(rs.getInt(3));
            }
            return movie;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
