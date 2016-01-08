<%@ page import="java.sql.*"%>  
  
<%  
    
    String cuser = (String)session.getAttribute("LoginUsername");
    

{  


try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");  
PreparedStatement ps=con.prepareStatement("SELECT chatmessage,fromuser,touser FROM message WHERE touser='" + cuser+"'");  
//ps.setInt(1,id);  
ResultSet rs=ps.executeQuery();  
while(rs.next()){  
out.print("<h2><BR>  --> "+rs.getString(2)+"<B></h2> ::: <h3><I>"+rs.getString(1)+"</i></h3>");  
}  
con.close();  
}catch(Exception e){e.printStackTrace();}  
}  
%>  