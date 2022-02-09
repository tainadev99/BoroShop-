/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import dal.SaleDAO;
import java.util.ArrayList;
import model.Product;
import model.Sale;

/**
 *
 * @author Admin
 */
public class newclass {
    public static void main(String[] args){
        ProductDAO prodao = new  ProductDAO();
        ArrayList<Product> listall = prodao.searchAll(null, "2", null, "2", "1", null,null);
        for (Product product : listall) {
            System.out.println(product.getName());
        }
    }
}
