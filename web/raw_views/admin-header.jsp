<%-- 
    Document   : admin-header
    Created on : Nov 10, 2019, 11:27:17 PM
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
        <div class="header_area">Xin chao ${sessionScope.admin.username}<br>
            <a href="admin-logout">Logout</a>
           
       
        
        </div>
    </body>
</html>
