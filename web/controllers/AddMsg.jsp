<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%  
     
     String username = (String)session.getAttribute("LoginUsername");
     String friendname = request.getParameter("friendname");
         String msg = request.getParameter("msg");

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

   </div>  
</html>