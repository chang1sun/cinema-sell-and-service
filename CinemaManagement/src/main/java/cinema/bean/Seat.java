package cinema.bean;

public class Seat {
    private int id;
    private int rowNo;
    private int colNo;
    private int movieHallId;

    public Seat(){}

    public int getId(){
        return id;
    }
    public int getRowNo(){
        return rowNo;
    }
    public int getColNo(){
        return colNo;
    }
    public int getMovieHallId(){
        return movieHallId;
    }
    public void setId(int id){
        this.id = id;
    }
    public void setRowNo(int rowNo){
        this.rowNo = rowNo;
    }
    public void setMovieHallId(int movieHallId){
        this.movieHallId = movieHallId;
    }
}
