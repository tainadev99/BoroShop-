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
import model.Brand;
import model.Sale;

/**
 *
 * @author Admin
 */
public class BrandDAO extends DBContext {
   public boolean insertBrand( String name){
       String sql="INSERT INTO [dbo].[Brand]\n" +
"           ([name],[status])\n" +
"     VALUES\n" +
"           (?,1)";
       PreparedStatement st;
       try {
           st=connection.prepareStatement(sql);
           st.setString(1, name);
           st.executeUpdate();
       } catch (SQLException ex) {
           
           Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
        return true;
    }
    public Brand getBrandbyID(int id){
        Brand d = new Brand();
        String sql="SELECT  [id]\n" +
"      ,[name]\n" +
"      ,[status]\n" +
"  FROM [BoroShop_Web].[dbo].[Brand] where id=? and status=1";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setStatus(true);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }
    public ArrayList<Brand> getAll(){
        ArrayList<Brand> list = new ArrayList<>();
        String sql="SELECT  [id]\n" +
"      ,[name]\n" +
"      ,[status]\n" +
"  FROM [BoroShop_Web].[dbo].[Brand] where status =1";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Brand d = new Brand();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setStatus(true);
                list.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
