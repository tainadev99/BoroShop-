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
import model.Product;
import model.Size;



/**
 *
 * @author Admin
 */
public class SizeDAO extends DBContext {
    public boolean insertSize(int cateid, String name){
               String sql="INSERT INTO [dbo].[Size]\n" +
"           ([size],[categoryid],[status])\n" +
"     VALUES\n" +
"           (?,?,1)";
       PreparedStatement st;
       try {
           st=connection.prepareStatement(sql);
           st.setInt(2, cateid);
           st.setString(1, name);
           st.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
        return true;
    }
    public ArrayList<Size> getSizeByCateID(Product p){
        ArrayList<Size> list = new ArrayList<>();
        String sql="SELECT   Size.[id]\n" +
"      ,Size.[size]\n" +
"      ,Size.[categoryid]\n" +
"  FROM [BoroShop_Web].[dbo].[Size] where categoryid=? and status=1 order by size ";
        PreparedStatement st;
        try {
            st=connection.prepareStatement(sql);
            st.setInt(1,p.getSubcateid().getCateid());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Size s = new Size();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("size"));
                s.setCateid(rs.getInt("categoryid"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     public ArrayList<Size> getSizeByProduct(Product p){
        ArrayList<Size> list = new ArrayList<>();
        String sql="SELECT  [pid]\n" +
"      ,[sizeid]\n" +
"      ,[quantity]\n, size, categoryid" +
"  FROM [BoroShop_Web].[dbo].[size_product], [dbo].Size where size_product.sizeid=Size.id and pid=?  order by size ";
        PreparedStatement st;
        try {
            st=connection.prepareStatement(sql);
            st.setInt(1,p.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Size s = new Size();
                s.setId(rs.getInt("sizeid"));
                s.setName(rs.getString("size"));
                s.setCateid(rs.getInt("categoryid"));
                s.setQuantity(rs.getInt("quantity"));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
      public Size getSizeByID(int id){
        Size size = new Size();
        String sql="SELECT   Size.[id]\n" +
"      ,Size.[size]\n" +
"      ,Size.[categoryid]\n" +
"  FROM [BoroShop_Web].[dbo].[Size] where id=? ";
        PreparedStatement st;
        try {
            st=connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                
                size.setId(rs.getInt("id"));
                size.setName(rs.getString("size"));
                size.setCateid(rs.getInt("categoryid"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(SizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return size;
    }
      public Size getaSizeByProduct(int pid, int sizeid){
        Size s = new Size();
        String sql="SELECT  [pid]\n" +
"      ,[sizeid]\n" +
"      ,[quantity]\n" +
"  FROM [BoroShop_Web].[dbo].[size_product] where pid=? and sizeid=?";
        PreparedStatement st;
        try {
            st=connection.prepareStatement(sql);
            st.setInt(1,pid);
            st.setInt(2, sizeid);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                 s = new Size();
                s.setId(rs.getInt("sizeid"));
                s.setQuantity(rs.getInt("quantity"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SizeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }
}
