package cinema.dao;

import cinema.bean.*;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class TicketDao {
    public TicketDao(){
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

    public boolean deleteTicket(Timetable tt){
        try (Connection c = getConnection()) {
            String sql = "delete from ticket where SP_ID = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, tt.getId());
            ps.execute();
            return true;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public boolean addTicket(String username, String mhName, String row, String col, String spId){
        try (Connection c = getConnection();) {
            Seat seat = new Seat();
            seat.setRowNo(row);
            seat.setColNo(col);
            seat.setMovieHallId(mhName);
            String sql = "insert into seat values (?,?,?,?,?)";
            String sql1 = "select Seat_ID from seat where Row_NO=? and Column_NO=? and MH_ID=?";
            PreparedStatement ps = c.prepareStatement(sql);
            PreparedStatement ps1 = c.prepareStatement(sql1);
            ps.setString(1, String.format("%s%s%s%s", spId.charAt(8), spId.charAt(9), row, col));
            ps.setString(2, row);
            ps.setString(3, col);
            ps.setString(4, mhName);
            ps.setString(5, spId);
            ps1.setString(1, row);
            ps1.setString(2, col);
            ps1.setString(3, mhName);
            ps.execute();
            ResultSet rs = ps1.executeQuery();
            if (rs.next()){
                seat.setId(rs.getString(1));
                String sql2 = "insert into ticket values (?,?,?,?)";
                PreparedStatement ps2 = c.prepareStatement(sql2);
                ps2.setString(1, String.format("%s%s", seat.getId(), DateTimeFormatter.ofPattern("hhmmss").format(LocalDateTime.now())));
                ps2.setString(2,username);
                ps2.setString(3, spId);
                ps2.setString(4, seat.getId());
                ps2.execute();
                return true;
            }
            else{
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean createView(){
        try(Connection conn=getConnection()){
            String sql = "drop view if exists select_view";
            String sql1 = "create view select_view(Ticket_ID,Row_NO,Column_NO,MH_ID,Show_Time,End_Time,Movie_ID,User_ID) " +
                    "AS " +
                    "select Ticket_ID,Row_NO,Column_NO,seat.MH_ID,Show_Time,End_Time,Movie_ID,ticket.User_ID " +
                    "from ticket,seat,m_user,time_table " +
                    "where ticket.User_ID=m_user.User_ID and " +
                    "ticket.SP_ID=time_table.SP_ID and " +
                    "ticket.Seat_ID=seat.Seat_ID";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.execute();
            ps = conn.prepareStatement(sql1);
            ps.execute();
            return true;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<String[]> SelectAll(String User_ID){
        try(Connection conn=getConnection()){
            createView();
            String sql="select Ticket_ID,Row_NO,Column_NO,MH_ID,Show_Time,End_Time from select_view " +
                    "where User_ID = ?";
            System.out.println(User_ID);
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, User_ID);
            ResultSet rs = ps.executeQuery();
            ArrayList<String[]> arr = new ArrayList<>();
            while (rs.next()){
                String[] res = new String[6];
                res[0] = String.valueOf(rs.getString(1));
                res[1] = String.valueOf(rs.getString(2));
                res[2] = String.valueOf(rs.getString(3));
                res[3] = String.valueOf(rs.getString(4));
                res[4] = String.valueOf(rs.getString(5));
                res[5] = String.valueOf(rs.getString(6));
                arr.add(res);
            }
            return arr;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<String[]> selectTicket_ID(String User_ID,String ticket_ID){
        try(Connection conn=getConnection()){
            createView();
            String sql="select Ticket_ID,Row_NO,Column_NO,MH_ID,Show_Time,End_Time from select_view " +
                    "where User_ID=? AND Ticket_ID=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,User_ID);
            ps.setString(2,ticket_ID);
            ResultSet rs=ps.executeQuery();
            ArrayList<String[]> arr = new ArrayList<>();
            while (rs.next()){
                String[] res = new String[6];
                res[0] = String.valueOf(rs.getString(1));
                res[1] = String.valueOf(rs.getString(2));
                res[2] = String.valueOf(rs.getString(3));
                res[3] = String.valueOf(rs.getString(4));
                res[4] = String.valueOf(rs.getString(5));
                res[5] = String.valueOf(rs.getString(6));
                arr.add(res);
            }
            return arr;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<String[]> selectMH(String User_ID,String MH_ID){
        try(Connection conn=getConnection()){
            createView();
            String sql="select Ticket_ID,Row_NO,Column_NO,MH_ID,Show_Time,End_Time from select_view " +
                    "where User_ID=? AND MH_ID=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,User_ID);
            ps.setString(2,MH_ID);
            ResultSet rs=ps.executeQuery();
            ArrayList<String[]> arr = new ArrayList<>();
            while (rs.next()){
                String[] res = new String[6];
                res[0] = String.valueOf(rs.getString(1));
                res[1] = String.valueOf(rs.getString(2));
                res[2] = String.valueOf(rs.getString(3));
                res[3] = String.valueOf(rs.getString(4));
                res[4] = String.valueOf(rs.getString(5));
                res[5] = String.valueOf(rs.getString(6));
                arr.add(res);
            }
            return arr;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<String[]> selectMovie(String User_ID,String movie_ID){
        try(Connection conn=getConnection()){
            createView();
            String sql="select Ticket_ID,Row_NO,Column_NO,MH_ID,Show_Time,End_Time from select_view " +
                    "where User_ID=? AND Movie_ID=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,User_ID);
            ps.setString(2,movie_ID);
            ResultSet rs=ps.executeQuery();
            ArrayList<String[]> arr = new ArrayList<>();
            while (rs.next()){
                String[] res = new String[6];
                res[0] = String.valueOf(rs.getString(1));
                res[1] = String.valueOf(rs.getString(2));
                res[2] = String.valueOf(rs.getString(3));
                res[3] = String.valueOf(rs.getString(4));
                res[4] = String.valueOf(rs.getString(5));
                res[5] = String.valueOf(rs.getString(6));
                arr.add(res);
            }
            return arr;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<String[]> select24hours(String User_ID){
        try(Connection conn=getConnection()){
            createView();
            String sql="select Ticket_ID,Row_NO,Column_NO,MH_ID,Show_Time,End_Time from select_view " +
                    "where User_ID=? and to_days(Show_Time)<=to_days(now())";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, User_ID);
            ResultSet rs=ps.executeQuery();
            ArrayList<String[]> arr = new ArrayList<>();
            while (rs.next()){
                String[] res = new String[6];
                res[0] = String.valueOf(rs.getString(1));
                res[1] = String.valueOf(rs.getString(2));
                res[2] = String.valueOf(rs.getString(3));
                res[3] = String.valueOf(rs.getString(4));
                res[4] = String.valueOf(rs.getString(5));
                res[5] = String.valueOf(rs.getString(6));
                arr.add(res);
            }
            return arr;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

}
