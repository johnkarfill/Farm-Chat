 
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
        <style>
            .scrollable {
    height: 200px; /* or any value */
    overflow-y: scroll;
    background-color:  white;
    outline: 1px solid slategrey;
    
    
}
            
            body{
                font:12px/15px Roboto, "Helvetica Neue", Helvetica, sans-serif;
            }
            select,
            input,
            .btn {
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            }
            #wrapper{
                margin:0 auto;
            }
            .main-form {
                width: 360px;
                min-height: 360px;
                background: #fff;
                border-radius: 60px;
                margin:0px auto 20px;
                padding: 20px;
            }
            .form-logo {
                font-size: 100px;
                color: #708090;
            }
        </style>
    </head>
    <body id="bod" background="/Farm-Chat/images/chat2.jpg">>
        
        
        
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">
onload=function(){
var e=document.getElementById("refreshed");
if(e.value=="no")e.value="yes";
else{e.value="no";location.reload();}
}
</script>
<script>  
var request;  
function sendInfo()  
{  

var url="/Farm-Chat/controllers/getchatmsgs.jsp"
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById("amit2").innerHTML=val;
}  
}  
 var request2;  
function sendInfo2()  
{  


var to=$("#friendname").val();
var msg=$("#msg").val();

var url="/Farm-Chat/controllers/AddMsg.jsp?friendname="+to+"&msg="+msg;
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo2;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo2(){  
if(request2.readyState==4){  
var val=request2.responseText;  
//document.getElementById("amit2").innerHTML=val;  
}  
}   

setInterval(sendInfo,1000);

function scrollToBottom() {
   var scrollBottom = Math.max($('#Table0').height() - $('#myDiv').height() + 20, 0);
   $('#myDiv').scrollTop(scrollBottom);
}
$(document).ready( scrollToBottom );

</script>
                         
  <div id ="amit2" class='scrollable' style="width:1350px;height:300px;">
      
    <!-- Your table -->
</div>
<section id="amitd2">  </section>  

  <form onsubmit="sendInfo2();" >

<br/><br/>
                              <input class="form-control" type="text" id="msg" name="msg" placeholder="Type your message here:">

                            
                            

                                <br/>
                                <button class="btn btn-default btn-lg text-right" type="submit" >Send</button>
                      
                
                </form>

        





        <% if (session.getAttribute("LoginStatus").equals(0)) { 
        response.sendRedirect("/Farm-Chat/msg/Error_Logout.jsp");
        }
        %>
        

        <br/><br/><br/><br/><br/><br/><br/><br/>    
    <center><button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/Farm-Chat/view/Home.jsp">Back</button></center>

                            
        
 
        
    </body>
</html>