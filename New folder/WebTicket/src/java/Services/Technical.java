package Services;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author shimaa
 */
public class Technical {

    private int TechId;
    private String Tname;
    private String email;
    private String CP;
    private String UserName;
    private String Password;
    private String Status;
    private String Vendor;
    private String Phone1;
    private String Phone2;
    private String Street;
    private String City;
    

    public String getCP() {
        return CP;
    }

    public String getCity() {
        return City;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return Password;
    }

    public String getPhone1() {
        return Phone1;
    }

    public String getPhone2() {
        return Phone2;
    }

    public String getStatus() {
        return Status;
    }

    public String getStreet() {
        return Street;
    }

    public int getTechId() {
        return TechId;
    }

    public String getTname() {
        return Tname;
    }

    public String getUserName() {
        return UserName;
    }

    public String getVendor() {
        return Vendor;
    }

    public void setCP(String CP) {
        this.CP = CP;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setPhone1(String Phone1) {
        this.Phone1 = Phone1;
    }

    public void setPhone2(String Phone2) {
        this.Phone2 = Phone2;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setTname(String Tname) {
        this.Tname = Tname;
    }

    public void setStreet(String Street) {
        this.Street = Street;
    }

    public void setTechId(int techId) {
        this.TechId = techId;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public void setVendor(String Vendor) {
        this.Vendor = Vendor;
    }

}
