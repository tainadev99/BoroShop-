/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.Order_line;
import model.Product_buy;

/**
 *
 * @author Admin
 */
public class AddtocartController extends BaseRequiredAuthenticationControllerUser {

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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("customer")==null) {
            response.sendRedirect("login");
        }
        else{
        int pid = Integer.parseInt(request.getParameter("pid"));
        int sizeid = Integer.parseInt(request.getParameter("size"));
        Order o = (Order) (request.getSession().getAttribute("cart"));
            System.out.println(o.getCustomer().getUsername());
        OrderDAO odao = new OrderDAO();
        ProductDAO pdao = new ProductDAO();
        Product_buy pbuy = new Product_buy();
        pbuy.setPid(pid);
        pbuy.setSizeid(sizeid);
        pbuy.setIntfo(pdao.getProductbyID(pid));
        boolean isExisting = false;
        if (o.getSize() > 0) {
            for (Order_line line : o.getLines()) {
                if (line.getProduct().getPid() == pbuy.getPid() && line.getProduct().getSizeid() == pbuy.getSizeid()) {
                    line.setQuantity(line.getQuantity() + 1);
                    odao.updateCart(line);
                    isExisting = true;
                    break;
                }
            }
        }
        if (!isExisting) {
            Order_line line = new Order_line();
            line.setOrder(o);
            line.setProduct(pbuy);
            line.setQuantity(1);
            line.setPrice(pbuy.getIntfo().getPrice());
            o.getLines().add(line);
            odao.insertCart(line);
        }
            

        request.getSession().setAttribute("cart", o);
        response.sendRedirect("product?pid=" + pid);

    }}

}
