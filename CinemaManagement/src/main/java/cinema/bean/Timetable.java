package cinema.bean;

import java.sql.Time;
import java.time.format.DateTimeFormatter;
import java.sql.Timestamp;
public class Timetable {

    private String id;
    private String mhName;
    private String mName;
    private double price;
    private Timestamp showTime;
    private Timestamp endTime;

    public Timetable(){}

    public String getId(){
        return id;
    }
    public String getMhName(){
        return mhName;
    }
    public String getMName(){
        return mName;
    }
    public double getPrice(){
        return price;
    }
    public Timestamp getShowTime(){
        return showTime;
    }
    public Timestamp getEndTime(){
        return endTime;
    }
    public void setId(String  id){
        this.id = id;
    }
    public void setMhName(String name){
        this.mhName = name;
    }
    public void setMName(String name){
        this.mName = name;
    }
    public void setShowTime(Timestamp time){
        this.showTime = time;
    }
    public void setEndTime(Timestamp time){
        this.endTime = time;
    }
    public void setPrice(double price){
        this.price = price;
    }
}
