package cinema.bean;

public class Ticket {
    private String id;
    private String userName;
    private int timeTableId;
    private int seatId;
    private boolean status;

    public Ticket(){}

    public String getId() {
        return id;
    }

    public int getTimeTableId() {
        return timeTableId;
    }

    public int getSeatId() {
        return seatId;
    }

    public String getUserName() {
        return userName;
    }

    public boolean getStatus() {
        return status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setTimeTableId(int timeTableId) {
        this.timeTableId = timeTableId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
