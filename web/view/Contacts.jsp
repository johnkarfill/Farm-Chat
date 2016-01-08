<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Contacts</title> 
    </head>   
    <body>
        
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">
onload=function(){
var e=document.getElementById("refreshed");
if(e.value=="no")e.value="yes";
else{e.value="no";location.reload();}
}
</script>

        <% if (session.getAttribute("LoginStatus").equals(0)) { 
        response.sendRedirect("/pat/msg/Error_Logout.jsp");
        }
        %>
        
        <div id="wrapper">
            <div class="main-form">
                <form action="/pat/view/ShowContactUI.jsp" method="POST">
                    <fieldset>
                        <div class="text-center">
                            <span class="form-logo glyphicon glyphicon-user"></span>
                        </div>
                        <div class="form-body">
                            <h1 class="form-title text-center">Show contacts</h1>


                            <div class="form-group text-center">
                                <button class="btn btn-default btn-lg text-right" type="submit">go</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        <div id="wrapper">
            <div class="main-form">
                <form action="/pat/view/AddContactUI.jsp" method="POST">
                    <fieldset>
                        <div class="text-center">
                            <span class="form-logo glyphicon glyphicon-user"></span>
                        </div>
                        <div class="form-body">
                            <h1 class="form-title text-center">ADD contact</h1>


                            <div class="form-group text-center">
                                <button class="btn btn-default btn-lg text-right" type="submit">go</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div id="wrapper">
                <div class="main-form">
                    <form action="/pat/view/RemoveContactUI.jsp" method="POST">
                        <fieldset>
                            <div class="text-center">
                                <span class="form-logo glyphicon glyphicon-user"></span>
                            </div>
                            <div class="form-body">
                                <h1 class="form-title text-center">Remove contact</h1>


                                <div class="form-group text-center">
                                    <button class="btn btn-default btn-lg text-right" type="submit">go</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <button class="btn btn-default btn-lg text-right" type="button" onclick=window.location.href="/pat/view/Home.jsp">Back</button>
                </div>  
            </div>
        </div>

    </body> 
</html>
 