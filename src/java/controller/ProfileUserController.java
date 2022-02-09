/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Order;

/**
 *
 * @author Admin
 */
public class ProfileUserController extends BaseRequiredAuthenticationControllerUser {

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
        Customer cus= (Customer)request.getSession().getAttribute("customer");
        System.out.println(cus.getId());
        OrderDAO odao= new OrderDAO();
        ArrayList<Order> o = odao.getAllbyCustomer(cus);
        request.setAttribute("numberorder", o.size());
        request.setAttribute("listOrder", o);
        request.getRequestDispatcher("raw_views/profile.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
