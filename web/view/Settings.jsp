 <html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Settings</title> 
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
        
            <center><h1>Username: <%= session.getAttribute("LoginUsername") %></h1></center>
            <center><h1>Email: <%= session.getAttribute("LoginEmail") %></h1></center>
        
    <br/><br/><br/>
    <button style="margin-left: 110px; height:35px; width:110px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/Farm-Chat/view/ChangeUsernameUI.jsp">Change Username</button>
    <br/><br/>
    <button style="margin-left: 110px; height:35px; width:110px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/Farm-Chat/view/ChangeEmailUI.jsp">Change Email</button>
    <br/><br/>
    <button style="margin-left: 110px; height:35px; width:110px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/Farm-Chat/view/ChangePasswordUI.jsp">Change Password</button>
    <br/><br/>
    <button style="margin-left: 110px; height:25px; width:110px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/Farm-Chat/view/DeleteAccount.jsp">Delete Account</button>
    <br/><br/>
    <button style="margin-left: 110px; height:25px; width:110px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/Farm-Chat/view/Home.jsp">Back</button>
</body> 
</html>
 