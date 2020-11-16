package cinema.bean;

import javax.print.DocFlavor;

public class MovieHall {
    private int id;
    private String address;
    private String name;
    private int col;
    private int row;

    public MovieHall(){}

    public int getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public String getAddress(){
        return address;
    }
    public int getCol(){
        return col;
    }
    public int getRow(){
        return row;
    }
    public void setId(int id){
        this.id = id;
    }
    public void setAddress(String addr){
        this.address = addr;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setCol(int col){
        this.col = col;
    }
    public void setRow(int row){
        this.row = row;
    }
}
