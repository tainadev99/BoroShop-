<%-- 
    Document   : admin-register
    Created on : Nov 11, 2019, 12:04:05 AM
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
        <%@include file="admin-header.jsp" %>
        <form action="admin-register" method="POST">
            <input type="text" name="user"/>
            <input type="password" name="pass"/>
            <input type="submit" value="Sign up"/>
        </form>
        <a href="${sessionScope.lasturl}"><input type="button" value="Cancel"</a>
        <%@include file="admin-footer.jsp" %>
    </body>
</html>
