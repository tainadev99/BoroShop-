/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SaleDAO;
import dal.SizeDAO;
import dal.SubcategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.PImage;
import model.Product;
import model.Sale;
import model.SubCategory;

/**
 *
 * @author Admin
 */
public class UpdateProductController extends BaseRequiredAuthenticationControllerAdmin {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String raw_pid=request.getParameter("pid");;
        CategoryDAO cdao = new CategoryDAO();
        ArrayList<Category> listcate = cdao.All();
        BrandDAO bdao= new BrandDAO();
        ArrayList<Brand> listbrand = bdao.getAll();
        SaleDAO sdao= new SaleDAO();
        ArrayList<Sale> listsale= sdao.getAll();
        SubcategoryDAO subdao= new SubcategoryDAO();
        
        request.setAttribute("listsale", listsale);
        request.setAttribute("listcate", listcate);
        request.setAttribute("listbrand", listbrand);
        if(raw_pid!=null){
            int pid=Integer.parseInt(raw_pid);
            ProductDAO pdao= new ProductDAO();
            Product product= pdao.getProductbyID(pid);
            ArrayList<SubCategory> listsub= product.getSubcateid().getCategory().getListSub();
            request.setAttribute("listsub", listsub);
            request.setAttribute("idcate", product.getSubcateid().getCategory().getId());
            request.setAttribute("raw_subcate", product.getSubcateid().getId());
            request.setAttribute("pid", product.getId());
            request.setAttribute("product", product);
            request.getRequestDispatcher("raw_views/admin-update-product.jsp").forward(request, response);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int pid=Integer.parseInt(request.getParameter("pid"));
        String name= request.getParameter("name");
        String brandid= request.getParameter("brand");
        String cateid= request.getParameter("cateid");
        String subcateid= request.getParameter("subcateid");
        String short_des= request.getParameter("short_desctiption");
        String des= request.getParameter("description");
        String sale= request.getParameter("sale");
        String mainimg= request.getParameter("mainimg");
        String[] otherimg= request.getParameterValues("otherimg");
        String action= request.getParameter("action");
        String isHot=request.getParameter("isHot");
        String price=request.getParameter("price");
        CategoryDAO cdao = new CategoryDAO();
        ArrayList<Category> listcate = cdao.All();
        BrandDAO bdao= new BrandDAO();
        ArrayList<Brand> listbrand = bdao.getAll();
        SaleDAO sdao= new SaleDAO();
        ArrayList<Sale> listsale= sdao.getAll();
        SubcategoryDAO subdao= new SubcategoryDAO();
        SizeDAO sizedao = new SizeDAO();
        ArrayList<SubCategory> listsub= subdao.getAll(Integer.parseInt(cateid));
        request.setAttribute("listsale", listsale);
        request.setAttribute("listcate", listcate);
        request.setAttribute("listbrand", listbrand);
        request.setAttribute("listsub", listsub);
        request.setAttribute("name", name);
        request.setAttribute("brand", brandid);
        request.setAttribute("price", price);
        request.setAttribute("isHot", isHot);
        request.setAttribute("description", des);
        request.setAttribute("short_desctiption", short_des);
        request.setAttribute("sale", sale);
        ProductDAO prodao= new ProductDAO();
        Product p = prodao.getProductbyID(pid);
        p.setPrice(Float.parseFloat(price));
        p.setName(name);
        p.setBrandid(bdao.getBrandbyID(Integer.parseInt(brandid)));
        p.setDescript(des);
        p.setShort_description(short_des);
        p.setImage(mainimg);
        p.setIsHot(isHot!=null);
        p.setSale(sdao.getSalebyID(Integer.parseInt(sale)));
        p.setIsSale(p.getSale().getValue()!=0);
        p.setSubcateid(subdao.getSubcatebyID(Integer.parseInt(subcateid)));
        p.setListSize(sizedao.getSizeByCateID(p));
//        for(int i=0;i<p.getListSize().size();i++){
//            System.out.println(p.getListSize().get(i).getName());
//        }
       
            PImage pimage = new PImage();
            if(otherimg.length>=3){
            pimage.setImg1(otherimg[0]);
            pimage.setImg2(otherimg[1]);
            pimage.setImg3(otherimg[2]);}
            if(otherimg.length==2){
            pimage.setImg1(otherimg[0]);
            pimage.setImg2(otherimg[1]);
            pimage.setImg3(null);}
            if(otherimg.length==1){
            pimage.setImg1(otherimg[0]);
            pimage.setImg2(null);
            pimage.setImg3(null);}
            if(otherimg.length==0){
            pimage.setImg1(null);
            pimage.setImg2(null);
            pimage.setImg3(null);}
            p.setImg(pimage);
//            for(int i=0;i<otherimg.length;i++){
//                response.getWriter().print(otherimg[i]);
//            }
        if(action==null){
            request.setAttribute("listsub", listsub);
            request.setAttribute("idcate", cateid);
            request.setAttribute("pid", p.getId());
            request.setAttribute("product", p);
            request.getRequestDispatcher("raw_views/admin-update-product.jsp").forward(request, response);
        }
        else{
        
        if(prodao.updateProduct(p)){
            response.sendRedirect("admin-list-product");
        }
        else{
            response.getWriter().print("Fail");
        }
    }

}}
