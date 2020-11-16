package cinema.bean;

import java.util.Date;

public class Movie {
    private int id;
    private String name;
    private String releaseTime;
    private Date stopTime;
    private Date director;

    public Movie(){}

    public int getId(){
        return id;
    }
    public void setId(){
        this.id = id;
    }
    public String getName(){
        return name;
    }
    public String getReleaseTime(){
        return releaseTime;
    }
    public Date getStopTime(){
        return stopTime;
    }
    public Date getDirector(){
        return director;
    }
    public void setName(){
        this.name = name;
    }
    public void setReleaseTime(){
        this.releaseTime = releaseTime;
    }
    public void setStopTime(){
        this.stopTime = stopTime;
    }
    public void setDirector(){
        this.director = director;
    }
}
