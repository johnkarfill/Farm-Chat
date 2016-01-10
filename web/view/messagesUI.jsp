  
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<html> 
    <head>
        <meta charset="utf-8" />
        <title>Show Contacts</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <style>
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
        
<%    
            String connectionURL = "jdbc:mysql://localhost:3306/register";
            out.println("<h3><b>CURRENT MESSAGES:</b></h3><br>");
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(connectionURL, "root", "");
                Statement st = con.createStatement();
                String cuser = (String)session.getAttribute("LoginUsername");
                ResultSet rs = st.executeQuery("SELECT chatmessage,fromuser FROM pm WHERE touser='" + cuser + "'");

                while (rs.next()) {

                    String message = rs.getString(1);
                    String from = rs.getString(2);
                    out.println("<h3>"+from+": " + message+"</h3>");
                    out.println("");
                }

            } catch (Exception e1) {
            }
        %>
        

             <div class="form-group text-center">
                 <button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/Farm-Chat/view/pmMessageUI.jsp">New Message</button>
                 <button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/Farm-Chat/view/Home.jsp">Back</button>
             </div>
 
    </body>
</html>