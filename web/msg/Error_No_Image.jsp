<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Error</title> 
    </head> 
<body background="/Farm-Chat/images/chat2.jpg">
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
        <h1>No photos</h1>
        
        <button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/Farm-Chat/view/Home.jsp">Back</button>
    </body> 
</html> 
