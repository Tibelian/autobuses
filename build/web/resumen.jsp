
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
    
if(session.getAttribute("reserva") == null){
    if(session.getAttribute("pagina") != null){
        session.setAttribute("pagina", null);
    }
    response.sendRedirect("./");
    return;
}
Reserva reserva = (Reserva)session.getAttribute("reserva");
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
            
            <section class="row justify-content-center"> 
                
                <div class="col-md-9">
                    <h1 class="text-center price">
                        <%= reserva.getRuta().getPrecio() * reserva.getPasajeros() %> €
                    </h1> 
                </div> 
                    
                <div class="col-md-9">
                    <div class="summary">
                        <ul class="summary-travel">
                            <li><i class="fas fa-map-marker-alt"></i> Origen: <strong><%= reserva.getRuta().getEstacionByIdOrigen().getNombre() %></strong></li>
                            <li><i class="fas fa-calendar"></i> Fecha: <strong><%= laFecha %></strong></li>
                            <li><i class="fas fa-street-view"></i> Destino: <strong><%= reserva.getRuta().getEstacionByIdDestino().getNombre() %></strong></li>
                            <li><i class="fas fa-clock"></i> Hora salida: <strong><%= reserva.getViaje().getHorario().getHora() %></strong></li>
                        </ul>

                        <div class="summary-passenger">
                        <%
                        for(int i = 0; i < reserva.getViajeros().size(); i++){
                            Viajero viajero = reserva.getViajeros().get(i);
                        %>
                            <ul>
                                <li class="avatar"><i class="fas fa-user fa-5x"></i></li>
                                <li>DNI: <strong><%= viajero.getDni() %></strong></li>
                                <li>Nombre: <strong><%= viajero.getNombre() %></strong></li>
                                <li>Apellidos: <strong><%= viajero.getApellidos() %></strong></li>
                                <li>Plaza: <strong><%= viajero.getAsiento() %></strong></li>
                            </ul>
                        <%
                        }
                        %>
                        </div>
                    </div>
                </div>

                <div class="col-md-9 d-flex justify-content-around mt-3">
                    <a class="btn btn-danger" href="./cancelarTodo"><i class="fas fa-times"></i> CANCELAR RESERVA</a>
                    <a class="btn btn-primary" href="./pagar.jsp?ok=1"><i class="fas fa-check"></i> PAGAR</a>
                </div>
                        
            </section>
            
        </main>
                        
                        
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>
