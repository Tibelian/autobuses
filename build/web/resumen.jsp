
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

if(reserva.getViajeros() == null){
    response.sendRedirect((String)session.getAttribute("pagina"));
    return;
}

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/blue-style.css"/>
        <title>Resumen reserva - AutoBus</title>
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
                    <h3 class="text-center price">
                        <span class="badge badge-info">Total: <%= reserva.getRuta().getPrecio() * reserva.getPasajeros() %> €</span>
                    </h3> 
                    <h5 class="text-center">
                        <span class="badge badge-secondary mb-2"><i class="fas fa-clock"></i> Salida: <%= reserva.getViaje().getHorario().getHora() %> </span>
                        <span class="badge badge-secondary mb-2"><i class="fas fa-calendar"></i> Fecha: <%= laFecha %></span><br>
                        <span class="badge badge-secondary">
                            <i class="fas fa-map-marker-alt"></i> Origen: <%= reserva.getRuta().getEstacionByIdOrigen().getNombre() %>
                        </span>
                        <span class="badge badge-secondary">
                            <i class="fas fa-street-view"></i> Destino: <%= reserva.getRuta().getEstacionByIdDestino().getNombre() %>
                        </span>
                    </h5>
                </div> 
                    
                <div class="col-md-9 p-3">
                    <div class="row">
                    <%
                    for(int i = 0; i < reserva.getViajeros().size(); i++){
                        Viajero viajero = reserva.getViajeros().get(i);
                    %>
                        <ul class="col-md-4 col-xs-6 mx-auto bg-white shadow list-group list-group-flush position-relative">
                            <li class="avatar"><i class="fas fa-user fa-6x"></i></li>
                            <li class="list-group-item border-0">DNI: <strong><%= viajero.getDni() %></strong></li>
                            <li class="list-group-item border-0 pt-0">Nombre: <strong><%= viajero.getNombre() %></strong></li>
                            <li class="list-group-item border-0 pt-0">Apellidos: <strong><%= viajero.getApellidos() %></strong></li>
                            <li class="list-group-item border-0 pt-0">Plaza: <strong><%= viajero.getAsiento() %></strong></li>
                        </ul>
                    <%
                    }
                    %>
                    </div>
                </div>

                <div class="col-md-9 d-flex justify-content-around my-3">
                    <a class="btn btn-danger ml-3" href="./cancelarTodo"><i class="fas fa-times"></i> CANCELAR RESERVA</a>
                    <a class="btn btn-primary mr-3" href="./pagar.jsp?ok=1"><i class="fas fa-check"></i> PAGAR</a>
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
