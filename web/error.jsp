<%
String mensaje = "Ha ocurrido un error inesperado";
if(request.getParameter("code") != null){
    mensaje = request.getParameter("code");
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <script src="./assets/js/main.js"></script>
        <title>Ha ocurrido un error</title>
    </head>
    <body>
        
        <main>
            
            <section class="bg-opacity bg-img" style="background-image:url('./assets/img/bus3.jpg')"> 
                
                <div class="text-white bg-opacity shadow p-30 m-auto">

                    <div style="text-align: center; display:flex;flex-direction:column;">
                        <h4 style="margin-bottom: 5px;"><%= mensaje %></h4>
                        <br>
                        <a style="text-decoration: none; color: #b71c1c;" href="./inicio.jsp">Volver</a>
                    </div>
                    
                </div>
                
            </section>
            
        </main>
        
    </body>
</html>
