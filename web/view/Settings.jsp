<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Settings</title> 
    </head>   
    <body background="/pat/images/chat2.jpg">
        
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">
onload=function(){
var e=document.getElementById("refreshed");
if(e.value=="no")e.value="yes";
else{e.value="no";location.reload();}
}
</script>

        <% if (session.getAttribute("LoginStatus").equals(0)) { 
        response.sendRedirect("/pat/msg/Error_Logout.jsp");
        }
        %>
        
    <br/><br/><br/><br/><br/><br/><br/>
    <button style="margin-left: 110px; height:25px; width:110px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/pat/view/DeleteAccount.jsp">Delete Account</button>
    <br/><br/>
    <button style="margin-left: 110px; height:25px; width:110px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/pat/view/Home.jsp">Back</button>
</body> 
</html>
 