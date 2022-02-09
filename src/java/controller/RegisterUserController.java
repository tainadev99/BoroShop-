/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

/**
 *
 * @author Admin
 */
public class RegisterUserController extends BaseRequiredAuthenticationControllerUser {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.getRequestDispatcher("raw_views/register.jsp").forward(request, response);
        
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int check=1;
        String user=request.getParameter("username");
        String pass=request.getParameter("password");
        String pass2=request.getParameter("password2");
        String fullname=request.getParameter("fullname");
        String email=request.getParameter("email");
        String dob_raw=request.getParameter("dob").trim();
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String gender_raw=request.getParameter("gender");
        SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd");
        CustomerDAO cusdao= new CustomerDAO();
        ArrayList<Customer> list= cusdao.getAll();
        Date dob= null;
        response.getWriter().print(dob_raw);
//        try {
//            dob= new java.sql.Date(df.parse(dob_raw.trim()).getTime());
//        } catch (ParseException ex) {
//            check=0;
//            Logger.getLogger(RegisterUserController.class.getName()).log(Level.SEVERE, null, ex);
//        }
        boolean gender=true;
        if(gender_raw.equals("1"))
            gender=true;
        if(gender_raw.equals("0"))
            gender=false;
        if(!pass.equals(pass2))
            check=0;
        for (Customer customer : list) {
            if(customer.getUsername().equals(user)){
                check=0;
                break;
            }
        }
        if(check==0||!cusdao.insertCustomer(user, pass, fullname, dob_raw, phone, gender, address)){
            
            response.getWriter().print("Sign up faild"+dob.toString());
        }
        else{
            response.sendRedirect("login");
        }
        
    }

   
}
