/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.Size;

/**
 *
 * @author Admin
 */
public class DeleteProductController extends BaseRequiredAuthenticationControllerAdmin{

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String raw_pid=request.getParameter("pid");
        if(raw_pid!=null){
            int pid=Integer.parseInt(raw_pid);
            ProductDAO pdao= new ProductDAO();
            Product product= pdao.getProductbyID(pid);
           product.setStatus(false);
           pdao.updateProduct(product);
           response.sendRedirect("admin-list-product");
        }
        
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
    
}
