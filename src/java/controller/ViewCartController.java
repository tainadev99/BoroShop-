/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import dal.SizeDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.Order_line;

/**
 *
 * @author Admin
 */
public class ViewCartController extends BaseRequiredAuthenticationControllerUser {




    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("customer")==null) {
            response.sendRedirect("login");
        }
        else{ 
        Order o = (Order)request.getSession().getAttribute("cart");
        request.setAttribute("cart", o);
        request.getRequestDispatcher("raw_views/viewcart.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Order o = (Order)request.getSession().getAttribute("cart");
        OrderDAO odao=new OrderDAO();
        SizeDAO sizedao= new SizeDAO();
        String action=request.getParameter("action");
        if(action.equals("continue")){
            response.sendRedirect("shop");
        }
        if(action.contains("delete")){
            int lineid=Integer.parseInt(action.substring(7,action.length()));
            for (int i=0;i<o.getLines().size();i++) {
                if(o.getLines().get(i).getId()==lineid){
                    odao.DeleteCart(o.getLines().get(i));
                    o.getLines().remove(i);
                }
            }
            System.out.println("abcxyz "+lineid);
            for (Order_line line : o.getLines()) {
                odao.updateCart(line);
            }
            request.getSession().setAttribute("cart", o);
            response.sendRedirect("viewcart");
        }
        if(action.equals("update")){
            int message=0;
            for (Order_line line : o.getLines()) {
                int quantity=Integer.parseInt(request.getParameter("quantity_"+line.getId()));
                if(quantity>sizedao.getaSizeByProduct(line.getProduct().getPid(), line.getProduct().getSizeid()).getQuantity()){
                    message=1;
                    break;
                }
                line.setQuantity(quantity);
                odao.updateCart(line);
            }
            
             
            request.setAttribute("message", message);
            request.getSession().setAttribute("cart", o);
            response.sendRedirect("viewcart");
        }
        if(action.equals("checkout")){
            response.sendRedirect("checkout");
        }
    }

}
