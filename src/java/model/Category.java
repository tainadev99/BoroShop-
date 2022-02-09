/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dal.SubcategoryDAO;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Category {
    SubcategoryDAO sdao= new SubcategoryDAO();
    private int id;
    private String name;
    private boolean status;
    private ArrayList<SubCategory> listSub=sdao.getAll(id) ;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public ArrayList<SubCategory> getListSub() {
        return sdao.getAll(id);
    }

    public void setListSub(ArrayList<SubCategory> listSub) {
        this.listSub = listSub;
    }


    
}
