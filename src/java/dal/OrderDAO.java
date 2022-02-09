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
import model.Customer;
import model.Order;
import model.Order_line;
import model.Product;
import model.Product_buy;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext{
    public Order getCart(Customer c){
        Order order = new Order();
        order.setCustomer(c);
        ProductDAO pdao = new ProductDAO();
        ArrayList<Order_line> list = new ArrayList<>();
        String sql="SELECT  [id]\n" +
"      ,[cid]\n" +
"      ,[pid]\n" +
"      ,[sizeid]\n" +
"      ,[quantity]\n" +
"  FROM [BoroShop_Web].[dbo].[Customer_cart] where cid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            ResultSet rs= st.executeQuery();
            while(rs.next()){
                Order_line orderline= new Order_line();
                orderline.setOrder(order);
                orderline.setId(rs.getInt("id"));
                Product_buy pb = new Product_buy();
                pb.setIntfo(pdao.getProductbyID(rs.getInt("pid")));
                pb.setPid(rs.getInt("pid"));
                pb.setSizeid(rs.getInt("sizeid"));
                orderline.setProduct(pb);
                orderline.setPrice(orderline.getProduct().getIntfo().getPrice());
                orderline.setQuantity(rs.getInt("quantity"));
                list.add(orderline);
            }
            order.setLines(list);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }
    public boolean UpdateOrderLine(int cid, int pid,int size, int quantity){
        ProductDAO pdao= new ProductDAO();
        Product p = pdao.getProductbyID(pid);
        for(int i=0;i<p.getListSize().size();i++){
            if(size==p.getListSize().get(i).getId()){
                if(quantity>p.getListSize().get(i).getQuantity())
                    return false;
            }
        }
        String sql="UPDATE [dbo].[Customer_cart]\n" +
"   SET \n" +
"      [quantity] = ?\n" +
" WHERE where pid=? and cid=? and sizeid=?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, cid);
            st.setInt(3, quantity);
            st.executeUpdate();
        } catch (SQLException ex) {
            
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return true;
    }
    public boolean DeleteCart(Order_line o){
        String sql="DELETE FROM [dbo].[Customer_cart]\n" +
"      WHERE id=?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, o.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return true;
    }
    public boolean insertCart(Order_line o){
        String sql="INSERT INTO [dbo].[Customer_cart]\n" +
"           ([cid]\n" +
"           ,[pid]\n" +
"           ,[sizeid]\n" +
"           ,[quantity])\n" +
"     VALUES\n" +
"           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getOrder().getCustomer().getId());
            st.setInt(2, o.getProduct().getPid());
            st.setInt(3, o.getProduct().getSizeid());
            st.setInt(4, o.getQuantity());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
            
        }
        return true;
    }
       public boolean updateCart(Order_line o){
        String sql="UPDATE [dbo].[Customer_cart]\n" +
"   SET \n" +
"      [quantity] = ?\n" +
" WHERE  pid=? and cid=? and sizeid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(3, o.getOrder().getCustomer().getId());
            st.setInt(2, o.getProduct().getPid());
            st.setInt(4, o.getProduct().getSizeid());
            st.setInt(1, o.getQuantity());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
            
        }
        return true;
    }
       public int insert(Order order)
    {
        ProductDAO pdao= new ProductDAO();
        int result = 0;
        
        try {
            connection.setAutoCommit(false);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            //insert order
            String sql_insert_order = "INSERT INTO [dbo].[Order]\n" +
"           ([cid]\n" +
"           ,[createdate]\n" +
"           ,[shipdate]\n" +
"           ,[status]\n" +
"           ,[total]\n" +
"           ,[ShipNote]\n" +
"           ,[address])\n" +
"     VALUES\n" +
"           (?,getDATE(),null,0,?,?,?)";
            PreparedStatement ps_insert_order = 
                    connection.prepareStatement(sql_insert_order);
            ps_insert_order.setInt(1, order.getCustomer().getId());
            ps_insert_order.setFloat(2, order.getTotal());
            ps_insert_order.setString(3, order.getShipnote());
            ps_insert_order.setString(4, order.getAddress());
            ps_insert_order.executeUpdate();
            //get order id
            String sql_select_orderid = "SELECT @@IDENTITY as oid";
            PreparedStatement ps_select_orderid = 
                    connection.prepareStatement(sql_select_orderid);
            ResultSet rs = ps_select_orderid.executeQuery();
            if(rs.next())
                order.setId(rs.getInt("oid"));
            
            //insert orderlines
            String sql_insert_lines = "INSERT INTO [dbo].[Order_Detail]\n" +
"           ([oid]\n" +
"           ,[pid]\n" +
"           ,[sizeid]\n" +
"           ,[quantity])\n" +
"     VALUES\n" +
"           (?,?,?,?)";
            for (Order_line line : order.getLines()) {
                PreparedStatement ps_insert_line = 
                        connection.prepareStatement(sql_insert_lines);
                ps_insert_line.setInt(1, order.getId());
                ps_insert_line.setInt(2, line.getProduct().getPid());
                ps_insert_line.setInt(3, line.getProduct().getSizeid());
                ps_insert_line.setInt(4, line.getQuantity());
                ps_insert_line.executeUpdate();
            }
            String sql_delete_orderline="DELETE FROM [dbo].[Customer_cart]\n" +
"      WHERE id=?";
            for (Order_line line : order.getLines()) {
                PreparedStatement stdelete= connection.prepareStatement(sql_delete_orderline);
                stdelete.setInt(1, line.getId());
                stdelete.executeUpdate();
                if(!pdao.updateQuantity(line.getProduct().getPid(), line.getProduct().getSizeid(), line.getQuantity())){
                    result=1;
                }
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            result = 1;
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        try {
            connection.setAutoCommit(true);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
       public ArrayList<Order> getAllbyCustomer(Customer c){
           ArrayList<Order> list = new ArrayList<>();
           String sql="SELECT  [id]\n" +
"      ,[cid]\n" +
"      ,[createdate]\n" +
"      ,[shipdate]\n" +
"      ,[status]\n" +
"      ,[total]\n" +
"      ,[ShipNote]\n" +
"      ,[address]\n" +
"  FROM [BoroShop_Web].[dbo].[Order] where cid=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setCreatedate(rs.getDate("createdate"));
                o.setCustomer(c);
                o.setShipnote(rs.getString("ShipNote"));
                o.setStatus(rs.getBoolean("status"));
                o.setAddress(rs.getString("address"));
                o.setLines(getAllLine(o));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
           
           return list;
       }
       public ArrayList<Order_line> getAllLine(Order o){
           ProductDAO pdao = new ProductDAO();
           ArrayList<Order_line> list = new ArrayList<>();
           String sql="SELECT  [id]\n" +
"      ,[oid]\n" +
"      ,[pid]\n" +
"      ,[sizeid]\n" +
"      ,[quantity]\n" +
"  FROM [BoroShop_Web].[dbo].[Order_Detail] where oid=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, o.getId());
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Order_line line = new Order_line();
                line.setId(rs.getInt("id"));
                line.setOrder(o);
                Product_buy pb = new Product_buy();
                pb.setIntfo(pdao.getProductbyID(rs.getInt("pid")));
                pb.setPid(rs.getInt("pid"));
                pb.setSizeid(rs.getInt("sizeid"));
                line.setQuantity(rs.getInt("quantity"));
                line.setProduct(pb);
                list.add(line);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
           return list;
       }
}
