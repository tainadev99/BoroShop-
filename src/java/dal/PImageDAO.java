/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PImage;

/**
 *
 * @author Admin
 */
public class PImageDAO  extends DBContext{
    public PImage getImagebyProductId(int id){
        PImage img= new PImage();
                String sql="SELECT  [id]\n" +
"      ,[pid]\n" +
"      ,[img1]\n" +
"      ,[img2]\n" +
"      ,[img3]\n" +
"  FROM [BoroShop_Web].[dbo].[Image] where pid=?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
               img.setId(rs.getInt("id"));
               img.setPid(rs.getInt("pid"));
               img.setImg1(rs.getString("img1"));
               img.setImg2(rs.getString("img2"));
               img.setImg3(rs.getString("img3"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return img;
    }
}
