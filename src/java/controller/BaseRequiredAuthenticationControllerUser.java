/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

/**
 *
 * @author Admin
 */
public abstract class BaseRequiredAuthenticationControllerUser extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        int check=0;
        Customer customer = (Customer) request.getSession().getAttribute("customer");
        CustomerDAO cusdao= new CustomerDAO();
        ArrayList<Customer> customers = cusdao.getAll();
        if (customer != null) {
            for (Customer account1 : customers) {
                if (account1.getUsername().equals(customer.getUsername()) && account1.getPassword().equals(customer.getPassword())) {
                    check=1;
                    return true;
                }
            }
        }else{
            
            Cookie[] cookie= request.getCookies();
            if(cookie==null)
                check=0;
            String user=null;
                String pass=null;
            for (Cookie cookie1 : cookie) {
                if(cookie1.getName().equals("user"))
                   user= cookie1.getValue();
                if(cookie1.getName().equals("pass"))
                    pass=cookie1.getValue();
                if(user!=null&&pass!=null)
                    break;
            }
            if(user!=null&&pass!=null){
                for (Customer acc : customers) {
                    if(user.equals(acc.getUsername())&&pass.equals(acc.getPassword())){
                        request.getSession().setAttribute("account", acc);
                        return true;
                    }
                }
            }
        
        }
        if(check==0){
            request.getSession().setAttribute("customer", null);
            request.getSession().setAttribute("cart", null);
        }
        return false;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processGet(request,response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    processPost(request,response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
