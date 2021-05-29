/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Districts;
import entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author vishal
 */
public class UserDao {
    public boolean retType = false;
    public boolean flag = false;
    private Connection con;
    public UserDao(Connection con)
    {
        this.con = con;
    }
    public boolean saveUser(User user)
    {
        try{
            System.out.println(user.getBlood());
            System.out.println(user.getName());
            System.out.println(user.getEmail());
            System.out.println(user.getMobile());
            System.out.println(user.getDistrict());
            System.out.println(user.getState());
            
            if(user.getDistrict()!="" && user.getName()!="" && user.getBlood()!="" && user.getEmail()!="" && user.getMobile()!="" && user.getState()!="")
            {
                flag = check(user.getState(),user.getDistrict());
                if(flag)
                {
            String query = "insert into userDetails(userName,email,mobile,district,state,blood) values(?,?,?,?,?,?)";
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            System.out.println(user.getDistrict());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getMobile());
            pstmt.setString(4, user.getDistrict());
            pstmt.setString(5, user.getState());
            pstmt.setString(6, user.getBlood());
            pstmt.executeUpdate();
            retType = true;
                }
            }
        }
        catch(Exception e)
        {
            
        }
        return retType;
    }
    public boolean check(String state,String district)
    {
        boolean flag = false;
        try
        {
        String query = "select * from districts where state=? and district = ?";
        PreparedStatement pstmt = this.con.prepareStatement(query);
        pstmt.setString(1,state.trim());
        pstmt.setString(2,district.trim());
        ResultSet rs = pstmt.executeQuery();
        while(rs.next())
        {
            flag = true;
        }

        
        }
        catch(Exception e)
        {
            
        }
        return flag;
    }
    public LinkedList<User> searchUser(User user)
    {
        System.out.print("1");
        LinkedList<User> ret = new LinkedList<>();
        try{
            String query = "select * from userDetails where district=? and blood=? and state = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(2, user.getBlood());
            pstmt.setString(1, user.getDistrict());
            pstmt.setString(3, " "+user.getState());
            ResultSet rst = pstmt.executeQuery();
            while (rst.next()) {
                String name = rst.getString("userName");
                String email = rst.getString("email");
                String mobile = rst.getString("mobile");
                String district = rst.getString("district");
                String state = rst.getString("state");
                String blood = rst.getString("blood");
                User u = new User(name,email,mobile,district,state,blood);
                ret.add(u);
                
            }
            
        }
        catch(SQLException e)
        {
        }
        return ret;
    }
    public LinkedList<Districts> searchDist(Districts dist)
    {
        LinkedList<Districts> ret = new LinkedList<>();
        try {
            String state = dist.getName();
            String query = "select * from districts where state=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, dist.getName());
            ResultSet rst = pstmt.executeQuery();
            
            while(rst.next())
            {
                
                String district = rst.getString("district");
                Districts d = new Districts(district);
                ret.add(d);
            }
        } catch (Exception e) {
        }
        return ret;
    }
    
}
