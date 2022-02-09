/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

/**
 *
 * @author Admin
 */
public class AdminDAO extends DBContext{
    public boolean insertAdmin(String name,String password){
       String sql="INSERT INTO [dbo].[admin]\n" +
"           ([username]\n" +
"           ,[password],[status])\n" +
"     VALUES\n" +
"           (?,?,1)";
       PreparedStatement st;
       try {
           st=connection.prepareStatement(sql);
           st.setString(1, name);
           st.setString(2, password);
           st.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
        return true;
    }
    public ArrayList<Admin> getAll(){
        ArrayList<Admin> list = new ArrayList<>();
        String sql="SELECT  [username]\n" +
"      ,[password]\n" +
"  FROM [BoroShop_Web].[dbo].[Admin] where status=1";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Admin a = new Admin();
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                list.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
