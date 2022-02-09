/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDAO;
import dal.SizeDAO;
import dal.SubcategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

/**
 *
 * @author Admin
 */
public class InsertSizeController extends BaseRequiredAuthenticationControllerAdmin {


    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAO cdao= new CategoryDAO();
        ArrayList<Category> list = cdao.All();
        request.setAttribute("data", list);
        request.getRequestDispatcher("raw_views/admin-insert-size.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         int cateid= Integer.parseInt(request.getParameter("category"));
        String name=request.getParameter("name");
        SizeDAO sdao= new SizeDAO();
        if(sdao.insertSize(cateid, name)){
            response.sendRedirect("admin-insert-size");
        }
        else{
            response.getWriter().print("Fail");
        }
    }

}
