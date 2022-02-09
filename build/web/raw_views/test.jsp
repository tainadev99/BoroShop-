<%-- 
    Document   : test.jsp
    Created on : Nov 10, 2019, 7:11:51 PM
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
        <form action="http://www.google.com/search">
  <input type="text" name="q" />
  <input type="submit" value="Go"
    onclick="return confirm('Are you sure you want to search Google?')"
  />
</form>
    </body>
</html>
