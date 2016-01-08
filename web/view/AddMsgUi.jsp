 
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
    overflow-y: auto;
    background-color: yellow;
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
    <body id="bod">
        
        
        
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

var url="/pat/controllers/getchatmsgs.jsp"
  
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



</script>
 <span class="form-logo glyphicon glyphicon-user"></span>
<marquee><h1>This is an example of ajax</h1></marquee>  
                    
                         
  <div id ="amit2" class='scrollable'>
    <!-- Your table -->
</div>
<section id="amitd2">  </section>  

  <form onsubmit="sendInfo2();" >
                   
                       
                            <h1 ">SEND MESSAGE</h1>
                            

                                <input class="form-control" type="text" id="friendname" name="friendname" placeholder="Username of contact">
                                  <input class="form-control" type="text" id="msg" name="msg" placeholder="message">

                            
                            

                                
                                <button class="btn btn-default btn-lg text-right" style="margin-left: 150px" type="submit" >confirm</button>
                      
                
                </form>

        





        <% if (session.getAttribute("LoginStatus").equals(0)) { 
        response.sendRedirect("/Farm-Chat/msg/Error_Logout.jsp");
        }
        %>
        
<%    
            String connectionURL = "jdbc:mysql://localhost:3306/register";
    
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(connectionURL, "root", "");
                Statement st = con.createStatement();
                String cuser = (String)session.getAttribute("LoginUsername");
                ResultSet rs = st.executeQuery("SELECT FriendName FROM contacts WHERE Username='" + cuser + "'");

                while (rs.next()) {

                    String friend = rs.getString(1);
                    out.println(friend+"  ");
                    out.println("");
                }

            } catch (Exception e1) {
            }
           
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(connectionURL, "root", "");
                Statement st = con.createStatement();
                String cuser = (String)session.getAttribute("LoginUsername");
                ResultSet rs = st.executeQuery("SELECT chatmessage,fromuser,touser FROM message WHERE touser='" + cuser + "'");

                while (rs.next()) {

                    String from = rs.getString(2);
                     String msg = rs.getString(1);

                    
                //    out.println("FROM:"+from +"  MESSAGE :"+msg+" ");
             //       out.println("<BR>");
                }

            } catch (Exception e1) {
            }


        %>
       
                                                 <button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/pat/view/Home.jsp">Back</button>

                            
        
 
        
    </body>
</html>