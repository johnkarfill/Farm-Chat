<%--   
    Document   : Data
    Created on : 1 Δεκ 2015, 6:31:52 μμ
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data</title>
    </head>
    <body>
<% 
    session.setAttribute("LoginStatus", 0); 
    session.setAttribute("LoginUsername", "");
    session.setAttribute("LoginEmail", "");
    session.setAttribute("LoginPassword", "");
%>
    </body>
</html>
