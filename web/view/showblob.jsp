 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%@ page import="java.io.*" %>
<html>
    <body>
<button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/Farm-Chat/view/Home.jsp">Back</button>

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
        
<% Blob image = null;
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

session.getAttribute("LoginUsername");
String name2 = request.getParameter("whoname");
out.println(session.getAttribute("LoginUsername"));

try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT photo FROM pics  WHERE last_name='"+session.getAttribute("LoginUsername")+"' ORDER BY contact_id  DESC LIMIT 1" );
    
  
  if(rs.next())
    {
        
          OutputStream o = response.getOutputStream();
             Blob bl = rs.getBlob(1);
             byte[] pict = bl.getBytes(1,(int)bl.length());
             response.setContentType("image/jpg");
             o.write(pict);
             o.flush();
             o.close();


    }
  
  else if(!rs.next()){response.sendRedirect("/Farm-Chat/msg/Error_No_Image.jsp");
        }

} catch (Exception e) {
    
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
} finally {
try {
rs.close();

stmt.close();
con.close();
} catch (SQLException e) {
e.printStackTrace();

}
}
%>

    </body>
</html>  