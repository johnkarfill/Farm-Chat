<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Login Check</title> 
    </head> 
    <body> 
 <%     
                    String user=request.getParameter("username");
                    String pass=request.getParameter("password");
                    String connectionURL = "jdbc:mysql://localhost:3306/register";
 
                    try{
 
                         Class.forName("com.mysql.jdbc.Driver");
                         Connection con=DriverManager.getConnection(connectionURL, "root", "");
                         Statement st=con.createStatement();
                         ResultSet rs=st.executeQuery("SELECT Username,Password,Email FROM register WHERE Username='"+user+"' AND Password='"+pass+"'");
                         
                         
                         
                         while(rs.next())
                             {
                                 
                             String username=rs.getString(1);
                             String password=rs.getString(2);
                             String LoginEmail=rs.getString("Email");
                                                              
                             if(user.equals(username) && pass.equals(password)){
                                 session.setAttribute("username",username);
                                 session.setAttribute("LoginStatus", 1);
                                 session.setAttribute("LoginEmail", LoginEmail);
                                 session.setAttribute("LoginPassword", password);
                                 session.setAttribute("LoginUsername", username);
                                  
                                 response.sendRedirect("/Farm-Chat/view/Home.jsp");
                             }
                             else {
                                 
                               response.sendRedirect("/Farm-Chat/msg/Error.jsp");
                                     }
                             }
                         response.sendRedirect("/Farm-Chat/msg/Error.jsp");
                    }catch(Exception e1){} 
 %>
    </body> 
</html> 