<%-- 
    Document   : admin
    Created on : Nov 10, 2019, 6:10:24 PM
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
        <form action="admin" method="POST">
            Username: <input type="text" name="admin-user" onClick="func();"/>  
            Password: <input type="password" name="admin-password" onClick="func();" /><br>
            <c:if test="${requestScope.message ne null}">
                <div id="abc" style="color:red; display: block;" >${requestScope.message} </div>
            </c:if>
            <input type="submit" value="Login"/>
        </form>
        <script>
            function func(){
                document.getElementById("abc").style.display='none';
            }
        </script>
    </body>
</html>
