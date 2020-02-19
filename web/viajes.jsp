
<%@page import="java.util.Date"%>
<%@page import="POJOS.Viaje"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
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
        <link rel="stylesheet" href="./assets/css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="./assets/css/owl.theme.default.min.css"/>
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
            
            <!-- listado con viajes disponibles -->
            <section class="row"> 
                <div class="col-12 p-3">
                    <h2 class="text-center">
                        <%= laFecha %> <br>
                        <%= reserva.getRuta().getEstacionByIdOrigen().getNombre() %> 
                        <i class="fas fa-arrow-right"></i> 
                        <%= reserva.getRuta().getEstacionByIdDestino().getNombre() %>
                    </h2>
                </div>
                <div class="col-11 p-3">
                    <div class="owl-carousel row justify-content-center" id="owl-list">
                        <%
                        int count = 0;
                        Iterator horarios = reserva.getRuta().getHorarios().iterator();
                        while(horarios.hasNext()){
                            Horario horario = (Horario)horarios.next();
                            DateFormat formatter = new SimpleDateFormat("HH:mm");
                            String hora = formatter.format(horario.getHora());

                            Iterator viajes = horario.getViajes().iterator();
                            while(viajes.hasNext()){
                                Viaje viaje = (Viaje)viajes.next();
                                if(reserva.getFechaSalida().equals(viaje.getFecha())){
                                    count++;
                                    long llegadaTime = horario.getHora().getTime() + reserva.getRuta().getDuracion().getTime();
                                    //DateFormat formatterDia = new SimpleDateFormat("HH:mm");
                                    String llegada = formatter.format(new Date(llegadaTime));
                                %>
                            <div class="item col bg-white shadow m-3 p-3">
                                <h3 class="text-center mb-3 border-bottom"><%= horario.getRuta().getPrecio() %> €</h3>
                                <ul>
                                    <li>Hora salida: <%= hora %></li>
                                    <li>Hora llegada: ~<%= llegada %></li>
                                    <li>Duración: <%= formatter.format(reserva.getRuta().getDuracion()) %></li>
                                    <li>Distancia: <%= reserva.getRuta().getKilometros()%> km</li>
                                </ul>
                                <form class="w-100 d-flex justify-content-center" action="./elegirViaje" method="post">
                                    <input type="hidden" name="viaje" value="<%= viaje.getId() %>">
                                    <button class="btn btn-primary" type="submit">Elegir viaje</button>
                                </form>
                            </div>
                                <%
                                }
                            }
                        }
                        %>

                    </div>
                       
                    <%
                    if(count == 0){
                        response.sendRedirect("./error.jsp?code=horario-404");
                        return;
                    }
                    %>
                        
                </div>
            </div>
                    
            </section>
            
        </main>

        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/main.js"></script>
        <script>

            $('#owl-list').owlCarousel({
                items: 2,
                loop: false,
                margin: 30,
                responsive:{
                    600:{
                        items: 4
                    }
                }
            });
            
        </script>
        
    </body>
</html>
