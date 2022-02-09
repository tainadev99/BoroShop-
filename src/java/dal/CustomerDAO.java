/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author Admin
 */
public class CustomerDAO extends DBContext {
      public boolean insertCustomer(String username, String password, String fullname, String dob, String phone, boolean gender,String address) {            
          String sql="INSERT INTO [dbo].[Customer]\n" +
"           ([username]\n" +
"           ,[password]\n" +
"           ,[fullname]\n" +
"           ,[dob]\n" +
"           ,[phone]\n" +
"           ,[gender]\n" +
"           ,[address]\n" +
"           ,[createdate]\n" +
"           ,[status]\n" +
"           ,[wallet])\n" +
"     VALUES\n" +
"           (?,?,?,?,?,?,?,getDATE(),1,0)";
       PreparedStatement st;
       try {
           st=connection.prepareStatement(sql);
           st.setString(1,username);
           st.setString(2, password);
           st.setString(3, fullname);
           st.setString(4, dob);
           st.setString(5, phone);
           st.setBoolean(6, gender);
           st.setString(7, address);
           st.executeUpdate();
       } catch (SQLException ex) {
           
           Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
        return true;}
      public ArrayList<Customer> getAll(){
          ArrayList<Customer> list = new ArrayList<>();
          String sql="SELECT [cid]\n" +
"      ,[username]\n" +
"      ,[password]\n" +
"      ,[fullname]\n" +
"      ,[phone]\n" +
"      ,[dob]\n" +
"      ,[gender]\n" +
"      ,[address]\n" +
"      ,[createdate]\n" +
"      ,[status]\n" +
"      ,[wallet]\n" +
"  FROM [BoroShop_Web].[dbo].[Customer] where status=1";
          try {
              PreparedStatement st= connection.prepareStatement(sql);
              ResultSet rs = st.executeQuery();
              while(rs.next()){
                  Customer c = new Customer();
                  c.setId(rs.getInt("cid"));
                  c.setUsername(rs.getString("username"));
                  c.setPassword(rs.getString("password"));
                  c.setFullname(rs.getString("fullname"));
                  c.setPhone(rs.getString("phone"));
                  c.setDob(rs.getDate("dob"));
                  c.setGender(rs.getBoolean("gender"));
                  c.setAddress(rs.getString("address"));
                  c.setCreateDate(rs.getDate("createdate"));
                  c.setWallet(rs.getFloat("wallet"));
                  c.setStatus(true);
                  list.add(c);
              }
          } catch (SQLException ex) {
              Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
          }
          
          return list;
      }
      public Customer getCustomerByid(int id){
          Customer c= new Customer();
          CommentDAO cdao= new CommentDAO();
          String sql="SELECT  [cid]\n" +
"      ,[username]\n" +
"      ,[password]\n" +
"      ,[fullname]\n" +
"      ,[phone]\n" +
"      ,[dob]\n" +
"      ,[gender]\n" +
"      ,[address]\n" +
"      ,[createdate]\n" +
"      ,[status]\n" +
"      ,[wallet]\n" +
"  FROM [BoroShop_Web].[dbo].[Customer] where status =1 and id=?";
           try {
              PreparedStatement st= connection.prepareStatement(sql);
              st.setInt(1, id);
              ResultSet rs = st.executeQuery();
              while(rs.next()){
                  c = new Customer();
                  c.setId(id);
                  c.setUsername(rs.getString("username"));
                  c.setPassword(rs.getString("password"));
                  c.setFullname(rs.getString("fullname"));
                  c.setPhone(rs.getString("phone"));
                  c.setDob(rs.getDate("dob"));
                  c.setGender(rs.getBoolean("gender"));
                  c.setAddress(rs.getString("address"));
                  c.setCreateDate(rs.getDate("createdate"));
                  c.setWallet(rs.getFloat("wallet"));
                  c.setStatus(true);
                  c.setListComment(cdao.getbyCustomer(c));
              }
          } catch (SQLException ex) {
              Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
          }
          
          return c;
      }
      public String getNameCustomerById(int id){
        String name="";
        String sql="SELECT \n" +
"      [username]\n" +
"\n" +
"  FROM [BoroShop_Web].[dbo].[Customer]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                name=rs.getString("username");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }
}
