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
public class AddProductController extends BaseRequiredAuthenticationControllerAdmin {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String raw_pid=request.getParameter("pid");
        if(raw_pid!=null){
            int pid=Integer.parseInt(raw_pid);
            ProductDAO pdao= new ProductDAO();
            Product product= pdao.getProductbyID(pid);
            ArrayList<Size> listSize= product.getListSize();
//            for (Size size : listSize) {
//                System.out.println(size.getName());
//            }
            request.setAttribute("listsize", listSize);
            request.setAttribute("product", product);
            request.getRequestDispatcher("raw_views/admin-add-product.jsp").forward(request, response);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int pid=Integer.parseInt(request.getParameter("pid"));
        ProductDAO pdao= new ProductDAO();
        Product product= pdao.getProductbyID(pid);
        int sum=0;
        for(int i=0;i<product.getListSize().size();i++){
            int quantity=Integer.parseInt(request.getParameter(product.getListSize().get(i).getId()+""));
            product.getListSize().get(i).setQuantity(quantity);
            sum+=quantity;
            
        }
        if(sum>0)
                product.setIsOutOfStock(false);
            else{
                product.setIsOutOfStock(true);
            }
            System.out.println(product.isIsOutOfStock());
//        System.out.println(sum);
        if(pdao.addQuantity(product)){
            pdao.UpdateStock(product);
            response.sendRedirect("admin-list-product");
        }
        response.getWriter().print("Fail");
        
    }

}
