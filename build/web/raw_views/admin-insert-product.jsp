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
        
        <form class="form-horizontal" action="admin-insert-product" method="POST" id="form">
<fieldset>

<!-- Form Name -->
<legend><div class="text-center">PRODUCTS</div></legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>  
  <div class="col-md-4">
      <input id="product_name" name="name" placeholder="PRODUCT NAME" class="form-control input-md" required="" type="text" value="${requestScope.name}">
    
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">PRODUCT PRICE </label>
  <div class="col-md-4">                     
      <input type="number" class="form-control" id="product_name_fr" name="price"value="${requestScope.price}">
  </div>
</div>
<div class="form-group">
  <label class="col-md-4 control-label" for="sub_category">BRAND</label>
  <div class="col-md-4">
      <select id="product_categorie" name="brand" class="form-control" >
          <c:set scope="request" var="br" value="${requestScope.brand}" />
        <c:forEach items="${requestScope.listbrand}" var="brand">
            <option value="${brand.id}"${brand.id==br?"selected":""} >${brand.name}</option>
        </c:forEach>
            
    </select>
  </div>
</div>       

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_categorie">PRODUCT CATEGORY</label>
  <div class="col-md-4">
      <select id="product_categorie" name="cateid" class="form-control" onchange="func();">
        <c:set scope="request" var="ca" value="${requestScope.idcate}" />
        <c:forEach items="${requestScope.listcate}" var="c">
            <option value="${c.id}"${c.id==ca?"selected":""} >${c.name}</option>
        </c:forEach>
            
    </select>
  </div>
</div>
        
<div class="form-group">
  <label class="col-md-4 control-label" for="sub_category">SUB CATEGORY</label>
  <div class="col-md-4">
      <select id="product_categorie" name="subcateid" class="form-control" >
        <c:forEach items="${requestScope.listsub}" var="sub">
            <option value="${sub.id}" >${sub.name}</option>
        </c:forEach>
            
    </select>
  </div>
</div>        
      <div class="form-group">
  <label class="col-md-4 control-label" for="sub_category">HOT PRODUCT</label>
  <div class="col-md-4">
      <input type="checkbox" name="isHot" ${requestScope.isHot ne null?"checked":""}>
  </div>
</div>          
            
 



<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_description">SHORT DESCRIPTION</label>
  <div class="col-md-4">                     
      <textarea class="form-control" id="product_description" name="short_desctiption">${requestScope.short_desctiption}</textarea>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">PRODUCT DESCRIPTION </label>
  <div class="col-md-4">                     
      <textarea class="form-control" id="product_name_fr" name="description">${requestScope.description}</textarea>
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="sub_category">SALE</label>
  <div class="col-md-4">
      <select id="product_categorie" name="sale" class="form-control" >
          <c:set scope="request" var="sa" value="${requestScope.sale}" />
        <c:forEach items="${requestScope.listsale}" var="sale">
            <option value="${sale.id}" ${sale.id== sa?"selected":""} >${sale.name}</option>
        </c:forEach>
            
    </select>
  </div>
</div>  


 <!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">Main_Image</label>
  <div class="col-md-4">
    <input id="filebutton" name="mainimg" class="input-file" type="file" accept="image/*">
  </div>
</div>
<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">Other_Images</label>
  <div class="col-md-4">
      <input id="filebutton" name="otherimg" class="input-file" type="file" multiple="" accept="image/*">
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Single Button</label>
  <div class="col-md-4">
      <input type="submit" value="Insert" class="btn-primary" name="action" >
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
