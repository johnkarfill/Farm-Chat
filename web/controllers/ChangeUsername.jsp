<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
  
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Change Email</title> 
    </head> 
    <body> 
 <%
                    String loginpass = (String)session.getAttribute("LoginPassword");
                    String loginemail = (String)session.getAttribute("LoginEmail");
                    String loginusername = (String)session.getAttribute("LoginUsername");
                    
                    String newusername = request.getParameter("newusername");
                    String pass = request.getParameter("password");
                    String pass2 = request.getParameter("password2");
                    String connectionURL = "jdbc:mysql://localhost:3306/register";
                    
                    try{
 
                         Class.forName("com.mysql.jdbc.Driver");
                         Connection con=DriverManager.getConnection(connectionURL, "root", "");
                         Statement st=con.createStatement();
                         ResultSet rs = st.executeQuery("SELECT Email,Password FROM register WHERE Email='"+loginemail+"' AND Password='"+loginpass+"'");
                         
                         while(rs.next())
                             {
                                 
                             String email=rs.getString(1);
                             String password=rs.getString(2);
                             

                             
                             if(loginemail.equals(email) && pass.equals(password) && pass2.equals(password)){
                                 session.setAttribute("password",pass);
                                 
                                Statement st1=con.createStatement();
                                int i=st1.executeUpdate("update register set Username='"+newusername+"' where Username='"+loginusername+"'");
                                   out.println("Email changed successfully");
                                   
                                    Statement st2=con.createStatement();
                                int b=st2.executeUpdate("update contacts set Username='"+newusername+"' where Username='"+loginusername+"'");
                                   out.println("Email changed successfully");
                        

                                 response.sendRedirect("/Farm-Chat/msg/ChangeUsername.jsp");
                             }
                             else {
                             response.sendRedirect("/Farm-Chat/msg/Error4.jsp");
                                     }
                             }
                         response.sendRedirect("/Farm-Chat/msg/Error4.jsp");
                    }catch(Exception e1){} 
 %>
    </body> 
</html> 