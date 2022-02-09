<%-- 
    Document   : admin-insert-subcategory
    Created on : Nov 11, 2019, 5:19:35 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="admin-insert-size" method="POST">
           <select name="category" >
               <c:forEach items="${requestScope.data}" var="c"><option value="${c.id}" > ${c.name}</option></c:forEach></select>
              
               
           
           
            <input type="text" name="name"/>
            <input type="submit" value="insert"/>
        </form>
    </body>
</html>
