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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  <% int i=1;%>
</head>
<body>

<div class="container">      
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>No.</th>
        <th>Name</th>
        <th>Image</th>
        <th>Status</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Quantity</th>
      </tr>
    </thead>
    <tbody>
        <c:set scope="request" var="no" value="0"/>
    <c:forEach items="${requestScope.listproduct}" var="p">
        <tr>
            <td><%=i++%></td>
            <td>${p.name}</td>
            <td><img  src="raw_views/img/${p.image}" alt=""/></td>
            <td>${p.isOutOfStock?"Out of Stock":"Stocking"}</td>
            <td>
                <a href="admin-update-product?pid=${p.id}">  Edit </a>

</td>
            <td><a href="admin-delete-product?pid=${p.id}" onclick="return confirm('Are you sure to delete this product?')">  Delete </a></td>
            <td><a href="admin-add-product?pid=${p.id}">  Add </a></td>
        </tr></c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
