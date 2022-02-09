<%-- 
    Document   : admin-manage
    Created on : Nov 10, 2019, 11:12:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        ${requestScope.url}
        <%@include file="admin-header.jsp" %>
        <a href="register" >Register User</a><br>
        <a href="admin-register">Register Admin</a><br>
        <a href="admin-insert-brand">Insert brand</a><br>
        <a href="admin-insert-category">Insert category</a><br>
        <a href="admin-insert-subcategory">Insert subcategory</a><br>
        <a href="admin-insert-product">Insert Product</a><br>
        <a href="admin-insert-size">Insert size</a><br>
        <a href="admin-insert-sale">Insert sale</a><br>
        <a href="admin-list-product">List Product</a><br>
        <a href="abcxyz">abcxyz</a><br>
        <form action="../abcxyz" method="POST">
            <input type="submit" value="abc"/>
        </form>
        <%@include file="admin-footer.jsp" %>
    </body>
</html>
