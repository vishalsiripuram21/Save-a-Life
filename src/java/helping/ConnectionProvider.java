/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helping;

/**
 *
 * @author vishal
 */
import java.sql.*;
public class ConnectionProvider {
    public static Connection con;
    public static Connection getConnection() {
        try{
        if(con == null)
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-04.cleardb.com/heroku_cb68e33f2f00015","b23519f6d7b1e3","23ca72ed");
            if(con!=null)
            {
                System.out.println("connnection");
            }
            else
            {
                System.out.println("not connected");
            }
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
