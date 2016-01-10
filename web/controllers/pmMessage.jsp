<%--  
    Document   : pmMessage
    Created on : 10 Ιαν 2016, 5:36:22 μμ
    Author     : John
--%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">
onload=function(){
var e=document.getElementById("refreshed");
if(e.value=="no")e.value="yes";
else{e.value="no";location.reload();}
}
</script>


        <% if (session.getAttribute("LoginStatus").equals(0)) { 
        response.sendRedirect("/Farm-Chat/msg/Error_Logout.jsp");
        }
        %>

        <%
     
     String username = (String)session.getAttribute("LoginUsername");
     String touser = request.getParameter("to");
     String msg = request.getParameter("msg");
     
     if(touser.equals("") || msg.equals("")){
      response.sendRedirect("/Farm-Chat/msg/Error_nomsg.jsp");
     }

try {
    String connectionURL = "jdbc:mysql://localhost:3306/register";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 

    connection = DriverManager.getConnection(connectionURL, "root", "");
    
    if(!connection.isClosed())
        connection.createStatement();
    Statement st = connection.createStatement();
        st.executeUpdate("INSERT INTO pm (chatmessage,fromuser,touser) " + "VALUES ('"+ msg +"','"+ username +"','"+ touser +"')");
 
    connection.close();
          response.sendRedirect("/Farm-Chat/view/messagesUI.jsp");
}catch(Exception ex){
    out.println("Unable to connect to database.");
}
%>
        
        
        
        
    </body>
</html>
