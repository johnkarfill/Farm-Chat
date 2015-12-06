<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>  
<head> 
<title>Send Message</title>
</head> 
<body>
<%
     
     String username = (String)session.getAttribute("LoginUsername");
     String friendname = request.getParameter("friendname");
         String msg = request.getParameter("msg");
out.println("Sender: "+username+" <br/>Message: '"+msg+"'<br/>TO: "+friendname);

try {
    String connectionURL = "jdbc:mysql://localhost:3306/register";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");
    
    if(!connection.isClosed())
        connection.createStatement();
    Statement st = connection.createStatement();
        st.executeUpdate("INSERT INTO message (chatmessage,fromuser,touser) " + "VALUES ('"+ msg +"','"+ username +"','"+ friendname +"')");
 
    connection.close();
}catch(Exception ex){
    out.println("Unable to connect to database.");
}
%>
<div class="main-form">
    <br/>
       <form action="/Farm-Chat/view/AddMsgUi.jsp" method="POST">
           <fieldset>
             
               <div class="form-body">

                   <div class="form-group text-center">
                       <button class="btn btn-default btn-lg text-right" type="submit">Back</button>
                       </div>
               </div>
           </fieldset>
       </form>
   </div>  
</html>