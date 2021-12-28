package cugb.javaee.bean;

public class Admin {
    int adminId;
    String adminName;
    String pwd;

    public int getAdminId() {
        return adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public String getPwd() {
        return pwd;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
