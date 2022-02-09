/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Admin;

/**
 *
 * @author Admin
 */
public class LoginAdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       if(isAuthenticated(request))
        response.sendRedirect("admin-manage");
       else{
           request.getRequestDispatcher("raw_views/admin.jsp").forward(request, response);
       }
    }

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
        processRequest(request, response);
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
        request.setAttribute("message", null);
        String admin_user = request.getParameter("admin-user").trim();
        String admin_pass = request.getParameter("admin-password");
        AdminDAO admindao = new AdminDAO();
        int check=0;
        ArrayList<Admin> list = admindao.getAll();
        for (Admin admin : list) {
            if (admin_user.trim().equals(admin.getUsername()) 
                    && admin_pass.equals(admin.getPassword())) {
                check=1;
                Admin a = new Admin();
                a.setUsername(admin_user);
                a.setPassword(admin_pass);
                request.getSession().setAttribute("admin",a );
                break;
            }
        }
        if(check==1){
            response.sendRedirect("admin-manage");
        }
        else{
            String message="Sai tài khoản hoặc mật khẩu";
            request.setAttribute("message", message);
            request.getRequestDispatcher("raw_views/admin.jsp").forward(request, response);
        }

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
}
