<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>  
<head>  
<title>Registered</title>
</head> 
<body background="images/chat2.jpg">
<%
     String username = request.getParameter("username");
     String email = request.getParameter("email");
     String password = request.getParameter("password");
     String pass2 = request.getParameter("password2");
         
try {
    String connectionURL = "jdbc:mysql://localhost:3306/register";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "");
    
     if(username.equals("") || email.equals("") || password.equals("") || pass2.equals("")){
                response.sendRedirect("/Farm-Chat/msg/Error_NoData.jsp");
                connection.close();
                }
     if(password.equals(password) != pass2.equals(password)){
                response.sendRedirect("/Farm-Chat/msg/Error_Pass.jsp");
                connection.close();
                }
    
    if(!connection.isClosed())
        connection.createStatement();
    Statement st = connection.createStatement();
        st.executeUpdate("INSERT INTO register (Username,Email,Password) " + "VALUES ('"+ username + "', '"+ email +"', '"+ password +"')");
        
    connection.close();
}catch(Exception ex){
    out.println("Unable to connect to database.");
}
%>
<h1>Account Created</h1>

        <button style="height:25px; width:130px"class="btn btn-default btn-lg text-left" type="button" onclick=window.location.href="/Farm-Chat/index.html">Back</button>
</body> 
</html> 