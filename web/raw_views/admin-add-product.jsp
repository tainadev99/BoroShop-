<%-- 
    Document   : admin-list-product
    Created on : Nov 11, 2019, 8:20:47 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
      img{
          width: 150px;
          height: 150px;
      }
  </style>
</head>
<body>

<div class="container">      
    <form action="admin-add-product" method="POST">
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Image</th>
        <th>Size</th>
        <th>Quantity</th>
      </tr>
    </thead>
    <tbody>
    <c:set scope="request" var="p" value="${requestScope.product}"/>
    <input type="hidden" value="${p.id}" name="pid">
    <c:forEach items="${requestScope.listsize}" var="size">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td><img  src="raw_views/img/${p.image}" alt=""/></td>
            <td>${size.name}</td>
            <td>
                <input type="number" name="${size.id}" value="${size.quantity}"/>

</td>
            
        </tr></c:forEach>
    </tbody>
  </table>
                <br>
                <input type="submit" value="Update" > </form>
</div>

</body>
</html>
