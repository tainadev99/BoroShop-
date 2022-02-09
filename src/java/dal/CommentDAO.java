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
import model.Comment;
import model.Customer;
import model.Product;

/**
 *
 * @author Admin
 */
public class CommentDAO extends DBContext{
    public ArrayList<Comment> getAll(){
        ArrayList<Comment> list = new ArrayList<>();
        String sql="SELECT  [id]\n" +
"      ,[cid]\n" +
"      ,[pid]\n" +
"      ,[content]\n" +
"      ,[createdate]\n" +
"  FROM [BoroShop_Web].[dbo].[comment]";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Comment m= new Comment();
                m.setId(rs.getInt("id"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public ArrayList<Comment> getbyProduct(Product p){
        CustomerDAO cdao= new CustomerDAO();
         ArrayList<Comment> list = new ArrayList<>();
        String sql="SELECT  [id]\n" +
"      ,[cid]\n" +
"      ,[pid]\n" +
"      ,[content]\n" +
"      ,[createdate]\n" +
"      ,[status]\n" +
"  FROM [BoroShop_Web].[dbo].[comment] where status =1 and pid=?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, p.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Comment m= new Comment();
                m.setId(rs.getInt("id"));
                m.setCid(rs.getInt("cid"));
                m.setPid(rs.getInt("pid"));
                m.setPname(p.getName());
                m.setStatus(true);
                m.setContent(rs.getString("content"));
                m.setCreateDate(rs.getDate("createdate"));
                m.setCname(cdao.getNameCustomerById(rs.getInt("cid")));
                list.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public ArrayList<Comment> getbyCustomer(Customer c){
        ProductDAO pdao= new ProductDAO();
         ArrayList<Comment> list = new ArrayList<>();
        String sql="SELECT  [id]\n" +
"      ,[cid]\n" +
"      ,[pid]\n" +
"      ,[content]\n" +
"      ,[createdate]\n" +
"      ,[status]\n" +
"  FROM [BoroShop_Web].[dbo].[comment] where status =1 and cid=?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Comment m= new Comment();
                m.setId(rs.getInt("id"));
                m.setCid(rs.getInt("cid"));
                m.setPid(rs.getInt("pid"));
                m.setCname(c.getUsername());
                m.setStatus(true);
                m.setContent(rs.getString("content"));
                m.setCreateDate(rs.getDate("createdate"));
                m.setPname(pdao.getNameProductById(rs.getInt("pid")));
                list.add(m);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
