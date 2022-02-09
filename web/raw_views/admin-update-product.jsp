<%-- 
    Document   : admin-insert-product
    Created on : Nov 11, 2019, 5:20:40 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    
    <body>
        <c:set scope="request" value="${requestScope.product}" var="p"></c:set>
        ${p.brandid.name}<br>
        ${p.subcateid.name}<br>
        ${p.subcateid.category.name}<br>
        ${p.sale.name}<br>
        <form class="form-horizontal" action="admin-update-product?pid=${p.id}" method="POST" id="form">
<fieldset>
    <input type="hidden" name="pid" value="${p.id}"/>
<!-- Form Name -->
<legend><div class="text-center">PRODUCTS</div></legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>  
  <div class="col-md-4">
      <input id="product_name" name="name" placeholder="PRODUCT NAME" class="form-control input-md" required="" type="text" value="${p.name}">
    
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">PRODUCT PRICE </label>
  <div class="col-md-4">                     
      <input type="number" class="form-control" id="product_name_fr" name="price"value="${p.price}">
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="sub_category">BRAND</label>
  <div class="col-md-4">
      <select id="product_categorie" name="brand" class="form-control" >
        <c:forEach items="${requestScope.listbrand}" var="brand">
            <option value="${brand.id}"${brand.id==p.brandid.id?"selected":""} >${brand.name}</option>
        </c:forEach>
            
    </select>
  </div>
</div>       

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_categorie">PRODUCT CATEGORY</label>
  <div class="col-md-4">
      <select id="product_categorie" name="cateid" class="form-control" onchange="func();">
          <c:set scope="request" value="${requestScope.idcate}" var="cateid"></c:set>
        <c:forEach items="${requestScope.listcate}" var="c">
            <option value="${c.id}"${c.id==cateid?"selected":""} >${c.name}</option>
        </c:forEach>
            
    </select>
  </div>
</div>
        
<div class="form-group">
  <label class="col-md-4 control-label" for="sub_category">SUB CATEGORY</label>
  <div class="col-md-4">
      <select id="product_categorie" name="subcateid" class="form-control" >
          <c:set scope="request" value="${requestScope.raw_subcate}" var="subcate"></c:set>
        <c:forEach items="${requestScope.listsub}" var="sub">
            <option value="${sub.id}"${sub.id==subcate?"selected":""}  >${sub.name}</option>
        </c:forEach>
            
    </select>
  </div>
</div>        
      <div class="form-group">
  <label class="col-md-4 control-label" for="sub_category">HOT PRODUCT</label>
  <div class="col-md-4">
      <input type="checkbox" name="isHot" ${p.isHot ?"checked":""}>
  </div>
</div>          
            
 



<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_description">SHORT DESCRIPTION</label>
  <div class="col-md-4">                     
      <textarea class="form-control" id="product_description" name="short_desctiption">${p.short_description}</textarea>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">PRODUCT DESCRIPTION </label>
  <div class="col-md-4">                     
      <textarea class="form-control" id="product_name_fr" name="description">${p.descript}</textarea>
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="sub_category">SALE</label>
  <div class="col-md-4">
      <select id="product_categorie" name="sale" class="form-control" >
          <c:forEach items="${requestScope.listsale}" var="sale">
            <option value="${sale.id}" ${sale.id== p.sale.id?"selected":""} >${sale.name}</option>
        </c:forEach>
            
    </select>
  </div>
</div>  


 <!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">Main_Image</label>
  <div class="col-md-4">
    <input accept="image/*" id="filebutton" name="mainimg" class="input-file" type="file" >

  </div>
</div>
<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">Other_Images</label>
  <div class="col-md-4">
      <input  accept="image/*" id="filebutton" name="otherimg" class="input-file" type="file" multiple="" >
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Save</label>
  <div class="col-md-4">
      <input type="submit" value="Insert" class="btn-primary" name="action">
  </div>
  </div>

</fieldset>
</form>

    </body>
    <script>
        function func(){
            document.getElementById("form").submit();
        }
    </script>
</html>
