package cinema.bean;

import javax.print.DocFlavor;

public class MovieHall {
    private String address;
    private String name;
    private int col;
    private int row;

    public MovieHall(){}
    public MovieHall(String name, String address){
        this.name = name;
        this.address = address;
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
