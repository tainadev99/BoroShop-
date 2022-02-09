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
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext{
     public boolean insertCategory(String name){
       String sql="INSERT INTO [dbo].[Category]\n" +
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
     public ArrayList<Category> All(){
             ArrayList<Category> s = new ArrayList<>();
             String sql="SELECT  [id]\n" +
"      ,[name]\n" +
"      ,[status]\n" +
"  FROM [BoroShop_Web].[dbo].[Category] where status=1 " ;
             try {
                 PreparedStatement st= connection.prepareStatement(sql);
                 ResultSet rs = st.executeQuery();
                 while(rs.next()){
                     Category c= new Category();
                     c.setId(rs.getInt("id"));
                     c.setName(rs.getString("name"));
                     c.setStatus(true);
                     s.add(c);
                 }
             } catch (SQLException ex) {
                 Logger.getLogger(SubcategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
             return s;
         }
     public Category getCate(int id){
         Category cate = new Category();
         String sql="SELECT Distinct(Category.name) as name, Category.id as id\n" +
"  FROM [BoroShop_Web].[dbo].[Category], SubCategory where Category.id=SubCategory.cateid and SubCategory.id=? and Category.status=1";
          try {
                 PreparedStatement st= connection.prepareStatement(sql);
                 st.setInt(1, id);
                 ResultSet rs = st.executeQuery();
                 while(rs.next()){
                     cate.setId(rs.getInt("id"));
                     cate.setName(rs.getString("name"));
                     cate.setStatus(true);
                 }
             } catch (SQLException ex) {
                 Logger.getLogger(SubcategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
           return cate;
     }
    
}

