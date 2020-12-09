package cinema.bean;

import jdk.jshell.spi.ExecutionControl;

public class User {
    private String id;
    private String password;
    public User(){}
    public User(String id, String pw){
        this.id = id;
        this.password = pw;
    }
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

    @Override
    public String toString() {
        return id;
    }
}
