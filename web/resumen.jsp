
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
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/main.js"></script>
        <title>Todos los viajes de una ruta</title>
    </head>
    <body>
        
        <header>
            <img class="logo" src="./assets/img/logo.png" alt="logo" width="auto" />
            <nav class="ml-auto">
                <ul>
                    <li><a href="#">Iniciar sesión</a></li>
                    <li><a href="#">Idioma</a></li>
                </ul>
            </nav>
        </header>
        
        <main>
            
            <section class="bg-opacity bg-img" style="background-image:url('./assets/img/bus2.jpg');align-items: center"> 
               
                <div class="bg-white p-30" style="margin:auto;border-radius:10px;">
                    <div class="navigation">
                        <ul>
                            <li><a href="./inicio.jsp"><i class="fas fa-home"></i></a></li>
                            <li><a href="./viajes.jsp"><span>1</span> Viaje</a></li>
                            <li><a href="./pasajeros.jsp"><span>2</span> Pasajeros</a></li>
                            <li><a class="active" href="#"><span>3</span> Resumen</a></li>
                            <li><a href="#"><span>4</span> Pago</a></li>
                            <li><a href="#"><span>5</span> Completado</a></li>
                        </ul>
                    </div>
                    <h1 class="mx-auto price" style="text-align:center">
                        <%= reserva.getRuta().getPrecio() * reserva.getPasajeros() %> €
                    </h1>  
                    
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
                    
                    <div style="display:flex; justify-content:space-around; margin-top: 10px;">
                        <a href="./cancelarTodo" class="submit">CANCELAR</a>
                        <a href="./pagar.jsp" class="submit">PAGAR</a>
                    </div>
                        
                    
                </div>
                     
                        

            </section>
            
        </main>
        
    </body>
</html>
