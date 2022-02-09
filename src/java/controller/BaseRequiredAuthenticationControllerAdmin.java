/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AdminDAO;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Admin;
import model.Customer;

/**
 *
 * @author Admin
 */
public abstract class BaseRequiredAuthenticationControllerAdmin extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        int check=0;
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        AdminDAO admindao= new AdminDAO();
        ArrayList<Admin> admins = admindao.getAll();
        if (admin != null) {
            for (Admin account1 : admins) {
                if (account1.getUsername().equals(admin.getUsername()) && account1.getPassword().equals(admin.getPassword())) {
                    check=1;
                    return true;
                }
            }
        }
        if(check==0){
            request.getSession().setAttribute("admin", null);
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
//        if (isAuthenticated(request)) {
//            processGet(request, response);
//        } else {
//            response.getWriter().print("Access denied");
//        }
        processGet(request, response);

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
        processPost(request, response);
//        if (isAuthenticated(request)) {
//            processPost(request, response);
//        } else {
//            response.getWriter().print("Access denied");
//        }
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
