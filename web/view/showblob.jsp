<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%@ page import="java.io.*" %>
<html>
    <body>
<button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/pat/view/Home.jsp">Back</button>

<% Blob image = null;
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

String name = request.getParameter("whoname");
out.println(name);
try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT photo FROM pics  WHERE first_name='"+name+"' ORDER BY contact_id  DESC LIMIT 1" );
      OutputStream o = response.getOutputStream();
    if(rs.next())
    {
             Blob bl = rs.getBlob(1);
             byte[] pict = bl.getBytes(1,(int)bl.length());
             response.setContentType("image/jpg");
             o.write(pict);
             o.flush();
             o.close();


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