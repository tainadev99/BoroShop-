/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class test extends DBContext {
    public  String username(){
        String sql="SELECT [id]\n" +
"      ,[username]\n" +
"      ,[password]\n" +
"  FROM [dbo].[account]";
        String s="";
        PreparedStatement st ;
        try {
            st = connection.prepareCall(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                s=rs.getString("username");
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
