package cugb.javaee.bean;

public class Order {
    private int orderid;
    private int userid;
    private String state;
    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }



    public int getOrderid() {
        return orderid;
    }

    public int getUserid() {
        return userid;
    }

    public String getState() {
        return state;
    }
}
