/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Order {
    private int id;
    private Date createdate;
    private Date shipdate;
    private boolean status;
    private String shipnote;
    private String address;
    private Customer customer;
    private ArrayList<Order_line> lines = new ArrayList<>();
    private int size= lines.size();
    private float total= getTotal();
    
    public float getTotal()
    {
        float sum = 0;
        for (Order_line line : lines) {
            sum += line.getTotal();
        }
        return sum;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getShipdate() {
        return shipdate;
    }

    public void setShipdate(Date shipdate) {
        this.shipdate = shipdate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getShipnote() {
        return shipnote;
    }

    public void setShipnote(String shipnote) {
        this.shipnote = shipnote;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }



    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public ArrayList<Order_line> getLines() {
        return lines;
    }

    public void setLines(ArrayList<Order_line> lines) {
        this.lines = lines;
    }

    public int getSize() {
        return lines.size();
    }

    public void setSize(int size) {
        this.size = size;
    }
    
}
