/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class ShopController extends BaseRequiredAuthenticationControllerUser {

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
        CategoryDAO cdao = new CategoryDAO();
        ArrayList<Category> listcate = cdao.All();
        BrandDAO bdao= new BrandDAO();
        ArrayList<Brand> listbrand = bdao.getAll();
        ProductDAO prodao= new ProductDAO();
        String cate=request.getParameter("cate");
        String brand=request.getParameter("brand");
        String subcate=request.getParameter("subcate");
        String desc=request.getParameter("desc");
        String asc=request.getParameter("asc");
        String sale=request.getParameter("sale");
        String name=request.getParameter("name");
        String sort=request.getParameter("sort");
        if(sort!=null){
        if(sort.equals("1")) desc="1";
        if(sort.equals("2")) asc="1";
        if(sort.equals("3")) sale="1";}
        ArrayList<Product> listall = prodao.searchAll(brand, cate, subcate, sale, desc, asc,name);
        ArrayList<Product> list= new ArrayList<>();
        String raw_pageindex = request.getParameter("page");
        if(raw_pageindex == null)
            raw_pageindex = "1";
        int pageindex = Integer.parseInt(raw_pageindex);
        int pagesize=9;
        int count=listall.size();
        int pagecount = (count%pagesize==0)?count/pagesize:count/pagesize + 1;
       
        for(int i=0;i<listall.size();i++){
            int index=i+1;
            if(index<=pageindex*pagesize&&index>((pageindex-1))*pagesize){
                list.add(listall.get(i));
            }
        }
        String catename="";
        if(cate!=null&&!cate.trim().equals("")){
            catename=cdao.getCate(Integer.parseInt(cate)).getName();
        }
        String empty=null;
        if(list.size()!=0){
            empty="asbc";
        }
        request.setAttribute("isempty", empty);
        request.setAttribute("name", name);
        request.setAttribute("catename", catename);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("cateid", cate);
        request.setAttribute("brand", brand);
        request.setAttribute("subcate", subcate);
        request.setAttribute("desc", desc);
        request.setAttribute("asc", asc);
        request.setAttribute("sale", sale);
        request.setAttribute("listcate", listcate);
        request.setAttribute("listbrand", listbrand);
        request.setAttribute("list", list);
        request.getRequestDispatcher("raw_views/shop.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAO cdao = new CategoryDAO();
        ArrayList<Category> listcate = cdao.All();
        BrandDAO bdao= new BrandDAO();
        ArrayList<Brand> listbrand = bdao.getAll();
        ProductDAO prodao= new ProductDAO();
        String cate=request.getParameter("cate");
        String brand=request.getParameter("brand");
        String subcate=request.getParameter("subcate");
        String desc=request.getParameter("desc");
        String asc=request.getParameter("asc");
        String sale=request.getParameter("sale");
        String name=request.getParameter("name");
        ArrayList<Product> listall = prodao.searchAll(brand, cate, subcate, sale, desc, asc,name);
        ArrayList<Product> list= new ArrayList<>();
        String raw_pageindex = request.getParameter("page");
        int pagesize=9;
        if(raw_pageindex == null)
            raw_pageindex = "1";
        int pageindex = Integer.parseInt(raw_pageindex);
        int count=listall.size();
        int pagecount = (count%pagesize==0)?count/pagesize:count/pagesize + 1;
       
        for(int i=0;i<listall.size();i++){
            int index=i+1;
            if(index<=pageindex*pagesize&&index>((pageindex-1))*pagesize){
                list.add(listall.get(i));
            }
        }
        String catename="";
        if(cate!=null&&!cate.trim().equals("")){
            catename=cdao.getCate(Integer.parseInt(cate)).getName();
        }
        String empty=null;
        if(list.size()==0){
            empty="asbc";
        }
        request.setAttribute("isempty", empty);
        request.setAttribute("name", name);
        request.setAttribute("catename", catename);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("cateid", cate);
        request.setAttribute("brand", brand);
        request.setAttribute("subcate", subcate);
        request.setAttribute("desc", desc);
        request.setAttribute("asc", asc);
        request.setAttribute("sale", sale);
        request.setAttribute("listcate", listcate);
        request.setAttribute("listbrand", listbrand);
        request.setAttribute("list", list);
        request.getRequestDispatcher("raw_views/shop.jsp").forward(request, response);
    }

}
