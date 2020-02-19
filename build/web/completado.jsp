
<%@page import="POJOS.Compra"%>
<%@page import="POJOS.Viajero"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJOS.Viaje"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelo.Reserva"%>
<%@page import="POJOS.Horario"%>
<%@page import="POJOS.Ruta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
if(
    session.getAttribute("reserva") == null ||
    session.getAttribute("compra") == null
){
    if(session.getAttribute("pagina") != null){
        response.sendRedirect((String)session.getAttribute("pagina"));
        return;
    }
    response.sendRedirect("./");
    return;
}
Reserva reserva = (Reserva) session.getAttribute("reserva");
Compra compra = (Compra) session.getAttribute("compra");
DateFormat formatterFecha = new SimpleDateFormat("dd/MM/yyyy");
String laFecha = formatterFecha.format(reserva.getFechaSalida());

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/blue-style.css"/>
        <title>Todos los viajes de una ruta</title>
    </head>
    <body>
        
        <!-- barra de navegación -->
        <header class="container-fuild">
            <jsp:include page="./modulo/barra_de_navegacion.jsp" />
        </header>
        
        <!-- contenido principal -->
        <main class="container-fluid">
            
            <!-- todos los pasos para completar la operación -->
            <section class="row"> 
                <jsp:include page="./modulo/pasos.jsp" />
            </section>
            
            <section class="row justify-content-center align-items-center py-4"> 
                
                <div class="col-md-9">
                    <h1 class="text-center price h2">
                        ¡GRACIAS POR CONFIAR EN NOSOTROS!
                    </h1> 
                </div> 
                
            </section>
            
        </main>
                        
                        
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>
