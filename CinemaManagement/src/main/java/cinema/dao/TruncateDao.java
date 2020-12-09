package cinema.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TruncateDao {
    public TruncateDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cinema?characterEncoding=UTF-8&serverTimezone=UTC", "root", "058918");
    }

    public boolean truncateDatabase(){
        try(Connection conn= getConnection()){
            String sql_1 = "truncate table ticket";
            String sql_2 = "truncate table seat";
            String sql_3 = "truncate table time_table";
            String sql_4 = "truncate table movie";
            String sql_5 = "truncate table movie_hall";
            String sql_6 = "truncate table m_user";
            PreparedStatement ps = conn.prepareStatement(sql_1);
            ps.execute();
            ps = conn.prepareStatement(sql_2);
            ps.execute();
            ps = conn.prepareStatement(sql_3);
            ps.execute();
            ps = conn.prepareStatement(sql_4);
            ps.execute();
            ps = conn.prepareStatement(sql_5);
            ps.execute();
            ps = conn.prepareStatement(sql_6);
            ps.execute();
            return true;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}
