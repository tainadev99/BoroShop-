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
import model.SubCategory;

/**
 *
 * @author Admin
 */
public class SubcategoryDAO extends DBContext{
         public boolean insertSubCategory(String name,int cateid){
       String sql="INSERT INTO [dbo].[SubCategory]\n" +
"           ([name]\n" +
"           ,[cateid],[status])\n" +
"     VALUES\n" +
"           (?,?,1)";
       PreparedStatement st;
       try {
           st=connection.prepareStatement(sql);
           st.setString(1, name);
           st.setInt(2, cateid);
           st.executeUpdate();
       } catch (SQLException ex) {
           
           Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
        return true;
    }
         public SubCategory getSubcatebyID(int id){
             CategoryDAO cdao= new CategoryDAO();
             SubCategory s = new SubCategory();
             String sql="SELECT  [id]\n" +
"      ,[name]\n" +
"      ,[cateid]\n" +
"      ,[status]\n" +
"  FROM [BoroShop_Web].[dbo].[SubCategory] where status=1 and id=?" ;
             try {
                 PreparedStatement st= connection.prepareStatement(sql);
                 st.setInt(1,id );
                 ResultSet rs = st.executeQuery();
                 while(rs.next()){
                     s.setId(rs.getInt("id"));
                     s.setName(rs.getString("name"));
                     s.setCateid(rs.getInt("cateid"));
                     s.setCategory(cdao.getCate(id));
                     s.setStatus(true);
                 }
             } catch (SQLException ex) {
                 Logger.getLogger(SubcategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
             return s;
         }
         public ArrayList<SubCategory> getAll(int cateid){
        ArrayList<SubCategory> list = new ArrayList<>();
        String sql="SELECT  [id]\n" +
"      ,[name]\n" +
"      ,[cateid]\n" +
"      ,[status]\n" +
"  FROM [BoroShop_Web].[dbo].[SubCategory] where cateid=? and status=1";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, cateid);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                SubCategory s = new SubCategory();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setStatus(true);
                s.setCateid(cateid);
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return list;
    }
}
