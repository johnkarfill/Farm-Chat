<%-- 
    Document   : About
    Created on : 25 Νοε 2015, 7:12:33 μμ
    Author     : John
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
    </head> 
    <body background="/Farm-Chat/images/chat2.jpg">
        
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
        
        <br/><br/><br/><br/>
        <h1><font color="white">This Web Created by: </font></h1>
        <a href="https://www.facebook.com/n30r39" style="margin-left: 100px;">ΕΦΗ ΑΝΔΡΟΝΗ</a><br/><br/>
        
        <br/><br/>
        <button style="margin-left: 100px; height:25px; width:130px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="http://www.emailmeform.com/builder/form/qAN4tO1bg75arazfCDW">Contact Form</button>
        <br/><br/>
        <button style="margin-left: 100px; height:25px; width:130px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/pat/view/Home.jsp">Back</button>
    </body>
</html> 
