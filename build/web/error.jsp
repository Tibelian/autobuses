<%
String mensaje = "Ha ocurrido un error inesperado";
if(request.getParameter("code") != null){
    String code = request.getParameter("code");
    if(code.equals("horario-404")){
        if(request.getParameter("origen") != null && request.getParameter("destino") != null && request.getParameter("fecha") != null){
            String origen = request.getParameter("origen");
            String destino = request.getParameter("destino");
            String fecha = request.getParameter("fecha");
            mensaje = "La ruta <strong>" + origen + " -> " + destino + "</strong> que acabas de indicar no tiene viajes el día <strong>" + fecha + "</strong>.";
        }else{
            mensaje = "La ruta que acabas de indicar no tiene viajes ese día.";
        }
    }
    if(code.equals("viaje-404")){
        mensaje = "No hay ninguna ruta que coincida con ese filtro.";
    }
    if(code.equals("login-miss")){
        mensaje = "Completa todos los campos para iniciar sesión.";
    }
    if(code.equals("login-wrong")){
        mensaje = "Los datos que has introducido son incorrectos. Vuelve a intentarlo.";
    }
    if(code.equals("register-exception")){
        if(request.getParameter("msg") != null){
            mensaje = "Ha ocurrido un error en el registro. " + request.getParameter("msg");
        }else{
            mensaje = "Ha ocurrido un error en el registro. Contacte con el administrador si el error persiste.";
        }
    }
    if(code.equals("register-miss")){
        mensaje = "Rellena todos los campos para completar el registro.";
    }
    if(code.equals("data-miss")){
        mensaje = "Rellena todos los campos para completar la operación.";
    }
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/blue-style.css"/>
        <script src="./assets/js/main.js"></script>
        <title>Ha ocurrido un error</title>
    </head>
    <body>
        <main class="w-100 d-flex justify-content-center flex-column align-items-center bg-light" style="min-height: 100vh">
            <section class="col-5 rounded d-flex bg-white shadow p-5 text-center"> 
                <div class="col-4 p-0"><i class="fas fa-exclamation-triangle fa-7x mx-auto" style="color: rgba(0,0,0,.2);"></i></div>
                <div clasS="col-8 p-0 d-flex flex-column justify-content-center"><p class="m-0"><%= mensaje %></p></div>
            </section>
            <a href="./index.jsp" class="btn btn-primary mt-4"><i class="fas fa-arrow-left"></i> Volver</a>
        </main>
    </body>
</html>
