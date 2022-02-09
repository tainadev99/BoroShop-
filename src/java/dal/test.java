/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.Category;
import model.Customer;
import model.Order;
import model.SubCategory;

/**
 *
 * @author Admin
 */
public class test {
    public static void main(String[] args){
        CustomerDAO cdao = new CustomerDAO();
        ArrayList<Customer> clist = cdao.getAll();
        for (Customer customer : clist) {
            System.out.println(customer.getId());
        }
    }
}
