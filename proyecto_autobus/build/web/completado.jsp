
<%@page import="Modelo.ViajeroAsiento"%>
<%@page import="java.util.Iterator"%>
<%@page import="POJOS.Compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJOS.Viaje"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelo.Reserva"%>
<%@page import="POJOS.Horario"%>
<%@page import="POJOS.Ruta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
if(session.getAttribute("reserva") == null){
    if(session.getAttribute("pagina") != null){
        response.sendRedirect((String)session.getAttribute("pagina"));
        return;
    }
    response.sendRedirect("./");
    return;
}
if(session.getAttribute("compra") == null){
    if(session.getAttribute("pagina") != null){
        response.sendRedirect((String)session.getAttribute("pagina"));
        return;
    }
    response.sendRedirect("./");
    return;
}
Reserva reserva = (Reserva) session.getAttribute("reserva");
Compra compra = (Compra) session.getAttribute("compra");

SimpleDateFormat formatoHora = new SimpleDateFormat("HH:mm");
SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
String hora = formatoHora.format(compra.getViaje().getHorario().getHora());
String fecha = formatoFecha.format(reserva.getFechaSalida());

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/blue-style.css"/>
        <title>Reserva completada - AutoBus</title>
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
                    
                    <div class="row justify-content-around">
                        
                        <div class="col-12 my-3 d-flex flex-wrap justify-content-center">
                            <div class="mx-2" id="qrcode"></div>
                            <!--
                            <div class="mx-2 d-flex flex-column justify-content-center" style="width: 200px; height: 128px" >
                                <a class="btn btn-sm btn-secondary my-2" href="#"><i class="fas fa-qrcode"></i> Imprimir Código QR</a>
                                <a class="btn btn-sm btn-secondary my-2" href="#"><i class="fas fa-ticket-alt"></i> Imprimir Billetes</a>
                            </div>
                            -->
                        </div>
                        
                        <%
                        for (ViajeroAsiento viajero : reserva.getViajeros()) {
                        %>
                        <div class="ticket shadow">
                            <div class="border-dashed">
                                <h4 class="title"><%= viajero.getApellidos() + " " + viajero.getNombre() %></h4>
                                <hr>
                                <p>Fecha: <span><%= fecha %></span></p>
                                <p style="width: 35%;">Hora: <span><%= hora %></span></p>
                                <p>Localizador: <span><%= compra.getLocalizador() %></span></p>
                                <p style="width: 35%;">Asiento: <span><%= viajero.getAsiento() %></span></p>
                                <hr>
                                <h4 class="price">Total: <strong><%= reserva.getRuta().getPrecio() %> €</strong></h4>
                            </div>
                        </div>
                        <%
                        }
                        %>
                        
                    </div>
                    
                </div> 
                
            </section>
            
        </main>
                        
                        
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/qrcode.min.js"></script>
        <script src="./assets/js/main.js"></script>
        <script type="text/javascript">
            var codigoQR = new QRCode(document.getElementById("qrcode"), {
                width: 128,
                height: 128,
                text: "Localizador: <%= compra.getLocalizador() %>"
            });
        </script>
        
    </body>
</html>
