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
public class HomeController extends BaseRequiredAuthenticationControllerUser {

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
        ArrayList<Product> list = prodao.getAll();
        request.setAttribute("listcate", listcate);
        request.setAttribute("listbrand", listbrand);
        request.setAttribute("list", list);
        request.getRequestDispatcher("raw_views/home.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
