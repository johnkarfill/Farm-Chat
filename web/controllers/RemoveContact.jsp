<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>  
<head> 
<title>Remove Contact</title>
</head> 
<body>
 <%
            String fname = request.getParameter("fname");
            out.println("You Delete: " +fname);
           try {
                String connectionURL = "jdbc:mysql://localhost:3306/register";
                Connection connection = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "");
                String query = "delete from contacts where FriendName = ?";
                PreparedStatement preparedStmt = connection.prepareStatement(query);
                preparedStmt.setString(1, fname);

                // execute the preparedstatement
                preparedStmt.executeUpdate();

                connection.close();

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }
        %>
<div class="main-form">
       <form action="/Farm-Chat/view/Contacts.jsp" method="POST">
           <fieldset>
              
               <div class="form-body">
                   
                  
                   <div class="form-group text-center">
                       <button class="btn btn-default btn-lg text-right" type="submit">Back</button>
                       </div>
               </div>
           </fieldset>
       </form>
   </div>  
    </body> 
</html>