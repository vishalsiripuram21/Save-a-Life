/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author vishal
 */
public class User {
    private String userName;
    private String mobile;
    private String email;
    private String district;
    private String state;
    private String blood_group;
    public User(String userName,String mobile,String email,String district,String state,String blood_group)
    {
        this.userName = userName;
        this.email = email;
        this.mobile = mobile;
        this.district = district;
        this.state = state;
        this.blood_group = blood_group;
    }
    public User(String blood_group,String district,String state){
        this.blood_group = blood_group;
        this.district = district;
        this.state = state;
    }
    public User(){}
    public String getName()
    {
        return userName;
    }
    public void setName(String userName)
    {
        this.userName = userName;
    }
     public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
     public String getMobile()
    {
        return mobile;
    }
    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }
     public String getDistrict()
    {
        return district;
    }
    public void setDistrict(String district)
    {
        this.district = district;
    }
    public void setState(String state)
    {
        this.state = state;
    }
    public String getState()
    {
        return this.state;
    }
     public String getBlood()
    {
        return blood_group;
    }
    public void setBlood(String blood_group)
    {
        this.blood_group = blood_group;
    }
}
