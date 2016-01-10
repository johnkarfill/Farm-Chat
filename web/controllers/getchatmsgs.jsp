<%@ page import="java.sql.*"%>  
  
<%  
    
    String cuser = (String)session.getAttribute("LoginUsername");
    

{  


try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");  
PreparedStatement ps=con.prepareStatement("SELECT chatmessage,fromuser FROM message");  
//ps.setInt(1,id);  

ResultSet rs=ps.executeQuery();  
while(rs.next()){  
out.print("<h3><b> "+rs.getString(2)+"</b>:"+" "+rs.getString(1)+"</h3><br>");  
}  
con.close();  
}catch(Exception e){e.printStackTrace();}  
}  
%>  