  
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<html> 
    <head>
        <meta charset="utf-8" />
        <title>Add Contact</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
        
        <form action="/Farm-Chat/controllers/pmMessage.jsp" method="POST" >        
        <h2>TO:</h2> <input type="text" id="to" name="to" >

                            <h1>Type your message here:</h1>
                            

                              <input class="form-control" type="text" id="msg" name="msg" placeholder="message">

                            
                            

                                <br/>
                                <button class="btn btn-default btn-lg text-right" type="submit" >Send</button>
                      
                   </form>

     
        

        <br/><br/><br/><br/><br/><br/><br/><br/>    
    <center><button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/Farm-Chat/view/messagesUI.jsp">Back</button></center>

                            
        
 
        
    </body>
</html>