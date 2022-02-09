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
import model.Sale;

/**
 *
 * @author Admin
 */
public class SaleDAO extends DBContext {
    public Sale getSalebyID(int id){
        Sale s = new Sale();
        String sql="SELECT  [id]\n" +
"      ,[name]\n" +
"      ,[value]\n" +
"  FROM [BoroShop_Web].[dbo].[Sale] where id=?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setValue(rs.getFloat("value"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
    public boolean insertSale(String name, float value){
        String sql="INSERT INTO [dbo].[Sale]\n" +
"           ([name]\n" +
"           ,[value])\n" +
"     VALUES\n" +
"           (?,?)";
       PreparedStatement st;
       try {
           st=connection.prepareStatement(sql);
           st.setString(1, name);
           st.setFloat(2, value);
           st.executeUpdate();
       } catch (SQLException ex) {
           
           Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
        return true;
    }
    public ArrayList<Sale> getAll(){
        ArrayList<Sale> list = new ArrayList<>();
        String sql="SELECT  [id]\n" +
"      ,[name]\n" +
"      ,[value]\n" +
"  FROM [BoroShop_Web].[dbo].[Sale]";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Sale s = new Sale();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setValue(rs.getFloat("value"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return list;
    }
}
