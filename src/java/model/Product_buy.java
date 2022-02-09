/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dal.SizeDAO;

/**
 *
 * @author Admin
 */
public class Product_buy {
    SizeDAO sdao= new SizeDAO();
    private int pid;
    private int sizeid;
    private Product intfo;
    private Size size = sdao.getSizeByID(sizeid);

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getSizeid() {
        return sizeid;
    }

    public void setSizeid(int sizeid) {
        this.sizeid = sizeid;
    }

    public Product getIntfo() {
        return intfo;
    }

    public void setIntfo(Product intfo) {
        this.intfo = intfo;
    }

    public Size getSize() {
        return sdao.getSizeByID(sizeid);
    }

    public void setSize(Size size) {
        this.size = size;
    }


    
}
