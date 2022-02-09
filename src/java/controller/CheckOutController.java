/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CustomerDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Order;

/**
 *
 * @author Admin
 */
public class CheckOutController extends BaseRequiredAuthenticationControllerUser {

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
        if (request.getSession().getAttribute("customer")==null) {
            response.sendRedirect("login");
        }
        else{
            request.getRequestDispatcher("raw_views/checkout.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
       Order o = (Order)request.getSession().getAttribute("cart");
       CustomerDAO cusdao= new CustomerDAO();
       Customer cus= (Customer)request.getSession().getAttribute("customer");
       OrderDAO odao= new OrderDAO();
       String address=request.getParameter("address");
       String ship=request.getParameter("ship");
       o.setAddress(address);
       o.setShipnote(ship);
       if(odao.insert(o)==0){
           
           request.getSession().setAttribute("cart", odao.getCart(cus));
           response.getWriter().print("Success buy");
       }
       else{
           response.getWriter().print("Fail");
       }
    }

}
