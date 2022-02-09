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
public class Product {
    private int id;
    private String name;
    private String short_description;
    private String descript;
    private float price;
    private Sale sale;
    private SubCategory subcateid;
    private Brand brandid;
    private boolean status;
    private String image;
    private boolean isHot;
    private Date createDate;
    private boolean isOutOfStock;
    private ArrayList<Size> listSize= new ArrayList<>();
    private ArrayList<Comment> listComment= new ArrayList<>();
    private PImage img;
    private boolean isSale;
    private float realprice;

    public ArrayList<Comment> getListComment() {
        return listComment;
    }

    public void setListComment(ArrayList<Comment> listComment) {
        this.listComment = listComment;
    }

    public boolean isIsSale() {
        return isSale;
    }

    public void setIsSale(boolean isSale) {
        this.isSale = isSale;
    }
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

    public String getShort_description() {
        return short_description;
    }

    public void setShort_description(String short_description) {
        this.short_description = short_description;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }

    public SubCategory getSubcateid() {
        return subcateid;
    }

    public void setSubcateid(SubCategory subcateid) {
        this.subcateid = subcateid;
    }

    public Brand getBrandid() {
        return brandid;
    }

    public void setBrandid(Brand brandid) {
        this.brandid = brandid;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isIsHot() {
        return isHot;
    }

    public void setIsHot(boolean isHot) {
        this.isHot = isHot;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public boolean isIsOutOfStock() {
        return isOutOfStock;
    }

    public void setIsOutOfStock(boolean isOutOfStock) {
        this.isOutOfStock = isOutOfStock;
    }

    public ArrayList<Size> getListSize() {
        return listSize;
    }

    public void setListSize(ArrayList<Size> listSize) {
        this.listSize = listSize;
    }

    public PImage getImg() {
        return img;
    }

    public void setImg(PImage img) {
        this.img = img;
    }

    public float getRealprice() {
      return  Math.round(price-(price*sale.getValue()));
    }

    public void setRealprice(float realprice) {
        this.realprice = realprice;
    }
    
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", short_description=" + short_description + ", descript=" + descript + ", price=" + price + ", sale=" + sale + ", subcateid=" + subcateid + ", brandid=" + brandid + ", status=" + status + ", image=" + image + ", isHot=" + isHot + ", createDate=" + createDate + ", isOutOfStock=" + isOutOfStock + ", listSize=" + listSize + ", listComment=" + listComment + ", img=" + img + ", isSale=" + isSale + '}';
    }
    
}
