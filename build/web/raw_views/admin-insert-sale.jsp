<%-- 
    Document   : admin-insert-sale
    Created on : Nov 11, 2019, 6:25:03 AM
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
        <form action="admin-insert-sale" method="POST">
            Name:<input type="text" name="name"/>
            Value: <input type="text" name="value"/>
            <input type="submit" value="insert"/>
        </form>
    </body>
</html>
