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
                    
                    String newemail = request.getParameter("newemail");
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
                                int i=st1.executeUpdate("update register set Email='"+newemail+"' where Email='"+loginemail+"'");
                                   out.println("Email changed successfully");
                        

                                 response.sendRedirect("/Farm-Chat/msg/ChangeEmail.jsp");
                             }
                             else {
                             response.sendRedirect("/Farm-Chat/msg/Error2.jsp");
                                     }
                             }
                         response.sendRedirect("/Farm-Chat/msg/Error2.jsp");
                    }catch(Exception e1){} 
 %>
    </body> 
</html> 