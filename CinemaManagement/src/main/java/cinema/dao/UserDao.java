package cinema.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import cinema.bean.User;

public class UserDao {

    public UserDao(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException{
        return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cinema?characterEncoding=UTF-8", "root", "058918");
    }

    public boolean checkValid(User user){
        try (Connection c = getConnection();){
            String sql = "select * from m_user where User_ID = ? and Password = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, user.getId());
            ps.setString(2,user.getPassword());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { return true;}
            else {return false;}
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkValid(String name){
        try (Connection c = getConnection();){
            String sql = "select * from m_user where User_ID = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { return false;}
            else {return true;}
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return true;
    }

    public boolean addUser(User user){
        try(Connection c = getConnection();){
            String sql = "insert into m_user values(?, ?)";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, user.getId());
            ps.setString(2, user.getPassword());
            ps.execute();
            return true;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(String id, String pw){
        try(Connection c = getConnection();){
            String sql = "update m_user set Password = ? where User_ID = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, pw);
            ps.setString(2, id);
            ps.execute();
            return true;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

}
