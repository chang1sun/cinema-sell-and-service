package cinema.bean;

import java.util.Date;

public class Movie {
    private String name;
    private Date releaseTime;
    private Date stopTime;
    private String director;
    private int num;
    public Movie(){}

    public String getName(){
        return name;
    }
    public Date getReleaseTime(){
        return releaseTime;
    }
    public Date getStopTime(){
        return stopTime;
    }
    public String getDirector(){
        if (director!=null){
        return director;}
        else{
            return "未知";
        }
    }

    public int getNum() { return num; }
    public void setName(String name){
        this.name = name;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public void setStopTime(Date stopTime) {
        this.stopTime = stopTime;
    }

    public void setNum(int num) { this.num = num; }
}
