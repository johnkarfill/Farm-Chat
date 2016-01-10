<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" > 
        <title>Home</title> 
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
       
    <center><h1><%= session.getAttribute("LoginUsername") %></h1></center>
      
    <br/><br/><br/><br/><br/><br/><br/>
    <button style="margin-left: 130px; height:25px; width:80px"class="btn btn-default btn-lg text-left" type="button" onclick='window.location.href="/Farm-Chat/view/AddMsgUi.jsp"'>Chat</button>
    <br/><br/>
    <button style="margin-left: 130px; height:25px; width:80px"class="btn btn-default btn-lg text-left" type="button" onclick='window.location.href="/Farm-Chat/view/messagesUI.jsp"'>Messages</button>
    <br/><br/>
    <button style="margin-left: 130px; height:35px; width:80px"class="btn btn-default btn-lg text-left" type="button" onclick='window.location.href="/Farm-Chat/view/uicam.jsp"'>Send Photo</button> 
     <br/><br/>
    <button style="margin-left: 130px; height:25px; width:80px"class="btn btn-default btn-lg text-left" type="button" onclick='window.location.href="/Farm-Chat/view/showblob.jsp"'>Get Photo</button>  
    
    <br/><br/>
    <button style="margin-left: 130px; height:25px; width:80px"class="btn btn-default btn-lg text-left" type="button" onclick='window.location.href="/Farm-Chat/view/Contacts.jsp"'>Contacts</button> 
        <br/><br/>
    <button style="margin-left: 130px; height:25px; width:80px"class="btn btn-default btn-lg text-left" type="button" onclick='window.location.href="/Farm-Chat/view/Settings.jsp"'>Settings</button> 
    <br/><br/>
    <button style="margin-left: 130px; height:25px; width:80px"class="btn btn-default btn-lg text-left" type="button" onclick='window.location.href="/Farm-Chat/view/About.jsp"'>About</button>    
    <br/> <br/> <br/><br/><br/><br/><br/> 
    <button style="margin-left: 130px; height:25px; width:80px"class="btn btn-default btn-lg text-left" type="button" onclick='window.location.href="/Farm-Chat/msg/Logout.jsp"'
    >Logout</button>
</body> 
</html> 
