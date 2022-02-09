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

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    public boolean insertProduct(Product p) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([name]\n"
                + "           ,[short_description]\n"
                + "           ,[description]\n"
                + "           ,[price]\n"
                + "           ,[sale]\n"
                + "           ,[subcateid]\n"
                + "           ,[brandid]\n"
                + "           ,[status]\n"
                + "           ,[image]\n"
                + "           ,[isHot]\n"
                + "           ,[createdate]\n"
                + "           ,[isOutOfStock],[isSale])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,1,?,?,getDATE(),1,?)";
        PreparedStatement st;
        try {
            connection.setAutoCommit(false);
            st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getShort_description());
            st.setString(3, p.getDescript());
            st.setFloat(4, p.getPrice());
            st.setInt(5, p.getSale().getId());
            st.setInt(6, p.getSubcateid().getId());
            st.setInt(7, p.getBrandid().getId());
            st.setString(8, p.getImage());
            st.setBoolean(9, p.isIsHot());
            st.setBoolean(10, p.isIsSale());
            st.executeUpdate();
            String sql_select_orderid = "SELECT @@IDENTITY as oid";

            PreparedStatement ps_select_orderid
                    = connection.prepareStatement(sql_select_orderid);
            ResultSet rs = ps_select_orderid.executeQuery();
            if (rs.next()) {
                p.setId(rs.getInt("oid"));
            }
            PreparedStatement st1;
            String sql1 = "INSERT INTO [dbo].[size_product]\n"
                    + "           ([pid]\n"
                    + "           ,[sizeid],[quantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,0)";
            for (int i = 0; i < p.getListSize().size(); i++) {
                st1 = connection.prepareStatement(sql1);
                st1.setInt(1, p.getId());
                st1.setInt(2, p.getListSize().get(i).getId());
                st1.executeUpdate();
            }
            String sql2 = "INSERT INTO [dbo].[Image]\n"
                    + "           ([pid]\n"
                    + "           ,[img1]\n"
                    + "           ,[img2]\n"
                    + "           ,[img3])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, p.getId());
            st2.setString(2, p.getImg().getImg1());
            st2.setString(3, p.getImg().getImg2());
            st2.setString(4, p.getImg().getImg3());
            st2.executeUpdate();

            connection.commit();
            connection.setAutoCommit(true);

        } catch (SQLException ex) {
            try {
                connection.rollback();
                connection.setAutoCommit(true);
            } catch (SQLException ex1) {

                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    public ArrayList<Product> getAll() {
        ArrayList<Product> list = new ArrayList<>();
        SubcategoryDAO subdao = new SubcategoryDAO();
        BrandDAO brandao = new BrandDAO();
        SizeDAO sizedao = new SizeDAO();
        SaleDAO saledao = new SaleDAO();
        PImageDAO imgdao = new PImageDAO();
        CommentDAO comdao= new CommentDAO();
        
        String sql = "SELECT  [id]\n" +
"      ,[name]\n" +
"      ,[short_description]\n" +
"      ,[description]\n" +
"      ,[price]\n" +
"      ,[sale]\n" +
"      ,[subcateid]\n" +
"      ,[brandid]\n" +
"      ,[status]\n" +
"      ,[image]\n" +
"      ,[isHot]\n" +
"      ,[createdate]\n" +
"      ,[isOutofStock]\n" +
"      ,[isSale]\n" +
"  FROM [BoroShop_Web].[dbo].[Product] where status=1 order by id";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setShort_description(rs.getString("short_description"));
                p.setDescript(rs.getString("description"));
                p.setPrice(rs.getFloat("price"));
                p.setStatus(rs.getBoolean("status"));
                p.setImage(rs.getString("image"));
                p.setIsHot(rs.getBoolean("isHot"));
                p.setCreateDate(rs.getDate("createdate"));
                p.setIsOutOfStock(rs.getBoolean("isOutofStock"));
                p.setIsSale(rs.getBoolean("isSale"));
                p.setSale(saledao.getSalebyID(rs.getInt("sale")));
                p.setSubcateid(subdao.getSubcatebyID(rs.getInt("subcateid")));
                p.setBrandid(brandao.getBrandbyID(rs.getInt("brandid")));
                p.setImg(imgdao.getImagebyProductId(p.getId()));
                p.setListComment(comdao.getbyProduct(p));
                p.setListSize(sizedao.getSizeByCateID(p));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public ArrayList<Product> searchAll(String brand, String cate, String subcate, String sale, String desc, String asc, String name ) {
        ArrayList<Product> list = new ArrayList<>();
        SubcategoryDAO subdao = new SubcategoryDAO();
        BrandDAO brandao = new BrandDAO();
        SizeDAO sizedao = new SizeDAO();
        SaleDAO saledao = new SaleDAO();
        PImageDAO imgdao = new PImageDAO();
        CommentDAO comdao= new CommentDAO();
        
        String sql = "SELECT [Product].[id]\n" +
"      ,[Product].[name]\n" +
"      ,[Product].[short_description]\n" +
"      ,[Product].[description]\n" +
"      ,[Product].[price]\n" +
"      ,[Product].[sale]\n" +
"      ,[Product].[subcateid]\n" +
"      ,[Product].[brandid]\n" +
"      ,[Product].[status]\n" +
"      ,[Product].[image]\n" +
"      ,[Product].[isHot]\n" +
"      ,[Product].[createdate]\n" +
"      ,[Product].[isOutofStock]\n" +
"      ,[Product].[isSale]\n" +
"	  ,SubCategory.cateid as cateid\n" +
"  FROM [BoroShop_Web].[dbo].[Product],SubCategory where Product.status=1 and SubCategory.id=Product.subcateid and isOutofStock=0  ";
        int i=0;
        int ibrand=0,icate=0,isubcate=0,isale=0,idesc=0,iasc=0,iname=0;
        PreparedStatement st;
        try {
            if(brand!=null&&!brand.trim().equals("")){
                sql+=" and brandid=? ";
                ibrand=++i;
            }
            if(cate!=null&&!cate.trim().equals("")){
                sql+=" and cateid=? ";
                icate=++i;
            }
            if(subcate!=null&&!subcate.trim().equals("")){
                sql+=" and [Product].[subcateid]=?";
                isubcate=++i;
            }
            if(name!=null&&!name.trim().equals("")){
                sql+=" and [Product].[name]like ?";
                iname=++i;
            }
            if(sale!=null&&!sale.trim().equals("")){
                sql+=" and sale!=10";
            }
            if(desc!= null&&!desc.trim().equals("")){
                sql+=" order by price desc";
            }
            if(asc!= null&&!asc.trim().equals("")){
                sql+=" order by price asc";
            }
            st = connection.prepareStatement(sql);
            if(brand!=null&&!brand.trim().equals("")){
                int brandid=Integer.parseInt(brand);
                st.setInt(ibrand, brandid);
            }
            if(cate!=null&&!cate.trim().equals("")){
                int cateid=Integer.parseInt(cate);
                st.setInt(icate, cateid);
            }
            if(subcate!=null&&!subcate.trim().equals("")){
                int subcateid=Integer.parseInt(subcate);
                st.setInt(isubcate, subcateid);
            }
            if(name!=null&&!name.trim().equals("")){
                st.setString(iname, "%"+name+"%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setShort_description(rs.getString("short_description"));
                p.setDescript(rs.getString("description"));
                p.setPrice(rs.getFloat("price"));
                p.setStatus(rs.getBoolean("status"));
                p.setImage(rs.getString("image"));
                p.setIsHot(rs.getBoolean("isHot"));
                p.setCreateDate(rs.getDate("createdate"));
                p.setIsOutOfStock(rs.getBoolean("isOutofStock"));
                p.setIsSale(rs.getBoolean("isSale"));
                p.setSale(saledao.getSalebyID(rs.getInt("sale")));
                p.setSubcateid(subdao.getSubcatebyID(rs.getInt("subcateid")));
                p.setBrandid(brandao.getBrandbyID(rs.getInt("brandid")));
                p.setImg(imgdao.getImagebyProductId(p.getId()));
                p.setListComment(comdao.getbyProduct(p));
                p.setListSize(sizedao.getSizeByCateID(p));
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;}
    public Product getProductbyID(int id) {
        SubcategoryDAO subdao = new SubcategoryDAO();
        BrandDAO brandao = new BrandDAO();
        SizeDAO sizedao = new SizeDAO();
        SaleDAO saledao = new SaleDAO();
        PImageDAO imgdao = new PImageDAO();
        CommentDAO comdao= new CommentDAO();
        Product p = new Product();
        String sql = "SELECT  [id]\n"
                + "      ,[name]\n"
                + "      ,[short_description]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[sale]\n"
                + "      ,[subcateid]\n"
                + "      ,[brandid]\n"
                + "      ,[status]\n"
                + "      ,[image]\n"
                + "      ,[isHot]\n"
                + "      ,[createdate]\n"
                + "      ,[isOutofStock]\n"
                + "      ,[isSale]\n"
                + "  FROM [BoroShop_Web].[dbo].[Product] where id=? and status=1  ";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setShort_description(rs.getString("short_description"));
                p.setDescript(rs.getString("description"));
                p.setPrice(rs.getFloat("price"));
                p.setStatus(rs.getBoolean("status"));
                p.setImage(rs.getString("image"));
                p.setIsHot(rs.getBoolean("isHot"));
                p.setCreateDate(rs.getDate("createdate"));
                p.setIsOutOfStock(rs.getBoolean("isOutofStock"));
                p.setIsSale(rs.getBoolean("isSale"));
                p.setSale(saledao.getSalebyID(rs.getInt("sale")));
                p.setSubcateid(subdao.getSubcatebyID(rs.getInt("subcateid")));
                 p.setBrandid(brandao.getBrandbyID(rs.getInt("brandid")));
                p.setImg(imgdao.getImagebyProductId(id));
                p.setListComment(comdao.getbyProduct(p));
                p.setListSize(sizedao.getSizeByProduct(p));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public boolean updateProduct(Product p) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [name] = ?\n"
                + "      ,[short_description] =?\n"
                + "      ,[description] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[sale] = ?\n"
                + "      ,[subcateid] = ?\n"
                + "      ,[brandid] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[isHot] = ?\n"
                + "      ,[isSale] = ?\n"
                 + "      ,[isOutofStock] = ?\n"
                 + "      ,[status] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st =connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2,p.getShort_description() );
            st.setString(3, p.getDescript());
            st.setFloat(4, p.getPrice());
            st.setInt(5, p.getSale().getId());
            st.setInt(6, p.getSubcateid().getId());
            st.setInt(7, p.getBrandid().getId());
            st.setString(8, p.getImage());
            st.setBoolean(9, p.isIsHot());
            st.setBoolean(10, p.isIsSale());
            st.setBoolean(11, p.isIsOutOfStock());
            st.setBoolean(12, p.isStatus());
            st.setInt(13, p.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return true;
    }
    public boolean addQuantity(Product p){
        String sql="UPDATE [dbo].[size_product]\n" +
"   SET \n" +
"	[quantity] = ?\n" +
" WHERE pid=? and sizeid=?";
        try {
            connection.setAutoCommit(false);
            for(int i=0;i<p.getListSize().size();i++){
                PreparedStatement st= connection.prepareStatement(sql);
                st.setInt(2, p.getId());
                st.setInt(3, p.getListSize().get(i).getId());
                st.setInt(1, p.getListSize().get(i).getQuantity());
                st.executeUpdate();
            }
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException ex) {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex1) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
        
    }
    public boolean UpdateStock(Product p){
        String sql="UPDATE [dbo].[Product]\n" +
"   SET \n" +
"\n" +
"      [isOutofStock] = ?\n" +
"\n" +
" WHERE id=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(2, p.getId());
            st.setBoolean(1, p.isIsOutOfStock());
            st.executeUpdate();
        } catch (SQLException ex) {
            
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
        
    }
    public boolean deleteProduct(Product p){
         String sql="UPDATE [dbo].[Product]\n" +
"   SET \n" +
"      [status] = ?\n" +
"\n" +
" WHERE id=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(2, p.getId());
            st.setBoolean(1, p.isStatus());
            st.executeUpdate();
        } catch (SQLException ex) {
            
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    public String getNameProductById(int id){
        String name="";
        String sql="SELECT \n" +
"      [name]\n" +
"\n" +
"  FROM [BoroShop_Web].[dbo].[Product] where status=1 and id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                name=rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }
    public boolean insertSize(Product p){
        PreparedStatement st1;
            String sql1 = "INSERT INTO [dbo].[size_product]\n"
                    + "           ([pid]\n"
                    + "           ,[sizeid],[quantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,0)";
            for (int i = 0; i < p.getListSize().size(); i++) {
            try {
                st1 = connection.prepareStatement(sql1);
                st1.setInt(1, p.getId());
                st1.setInt(2, p.getListSize().get(i).getId());
                st1.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            }
            }
            return true;
    }
    public boolean updateQuantity(int pid, int sizeid, int quantity){
        String sql="UPDATE [dbo].[size_product]\n" +
"   SET \n" +
"	[quantity] = ?\n" +
" WHERE pid=? and sizeid=?";
        try {
            connection.setAutoCommit(false);
            
                PreparedStatement st= connection.prepareStatement(sql);
                int quantity_real=getQuantity(pid, sizeid)-quantity;
                st.setInt(2, pid);
                st.setInt(3, sizeid);
                st.setInt(1, quantity_real);
                st.executeUpdate();
            
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException ex) {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex1) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
        
    }
    public int getQuantity(int pid, int sizeid){
        int quantity=0;
        String sql="select quantity from size_product where pid=? and sizeid=?";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, sizeid);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                quantity=rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quantity;
    }
}
