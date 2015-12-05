<html> 
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Username Changed</title> 
    </head> 
    <body>
<%             
                session.setAttribute("LoginStatus", 0); 
                session.setAttribute("LoginFirstName", "");
                session.setAttribute("LoginLastName", "");
                session.setAttribute("LoginEmail", "");
                session.setAttribute("LoginPassword", "");
%>
        <h1>Username Changed</h1>
        
        <a href="/Farm-Chat/index.html"><b>Back</b></a>
    </body> 
</html> 
