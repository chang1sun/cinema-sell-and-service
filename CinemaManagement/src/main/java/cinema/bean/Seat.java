package cinema.bean;

public class Seat {
    private String id;
    private String row;
    private String col;
    private String movieHallId;

    public Seat(){}

    public String getId(){
        return id;
    }
    public String getRowNo(){
        return row;
    }
    public String getColNo(){
        return col;
    }
    public String getMovieHallId(){
        return movieHallId;
    }
    public void setId(String id){
        this.id = id;
    }
    public void setRowNo(String rowNo){
        this.row = rowNo;
    }
    public void setColNo(String colNo){
        this.col = colNo;
    }
    public void setMovieHallId(String movieHallId){
        this.movieHallId = movieHallId;
    }
}
