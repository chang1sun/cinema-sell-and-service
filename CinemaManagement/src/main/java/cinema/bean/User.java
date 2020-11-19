package cinema.bean;

public class User {
    private String id;
    private String password;

    public String getId(){
        return id;
    }
    public String getPassword() {return password;}
    public void setId(String name){
        this.id = name;
    }
    public void setPassword(String pw){
        this.password = pw;
    }
}
