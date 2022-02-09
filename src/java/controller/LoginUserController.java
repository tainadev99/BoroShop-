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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Order;

/**
 *
 * @author Admin
 */
public class LoginUserController extends BaseRequiredAuthenticationControllerUser {

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
        if(request.getSession().getAttribute("customer")==null){
            request.getRequestDispatcher("raw_views/login.jsp").forward(request, response);
        }
        else{
            response.sendRedirect("home");
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerDAO dao= new CustomerDAO();
        ArrayList<Customer> list = dao.getAll();
        String user= request.getParameter("username");
        String pass= request.getParameter("password");
        String remember= request.getParameter("remember");
        OrderDAO odao = new OrderDAO();
//        response.getWriter().println(user);
//         response.getWriter().println(pass);
//          response.getWriter().println(remember==null?"abc":"123");
//           response.getWriter().println(list.size());
        for(Customer acc: list){
            if(user.equals(acc.getUsername())&&pass.equals(acc.getPassword())){
                
               request.getSession().setAttribute("customer", acc);
                if(remember!=null){
                    Cookie cUser = new Cookie("user", acc.getUsername());
                    cUser.setMaxAge(12*3600);
                    response.addCookie(cUser);
                    Cookie cPass= new Cookie("pass", acc.getPassword());
                    cPass.setMaxAge(12*3600);
                    response.addCookie(cPass);
                }
                Order o = odao.getCart(acc);
                request.getSession().setAttribute("cart",o);
                response.sendRedirect("home");
                break;
            }
            
               
            
        }
         response.getWriter().print("Login failed");
    }

}
