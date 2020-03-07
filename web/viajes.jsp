
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
        <title>Todos los viajes de una ruta - AutoBus</title>
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
            <section class="row justify-content-center"> 
                <div class="col-12 p-3">
                    <h3 class="text-center">
                        <span class="badge badge-secondary mb-2"><%= reserva.getRuta().getPrecio() %> € </span>
                        <span class="badge badge-secondary mb-2"><%= laFecha %></span><br>
                        <span class="badge badge-info">
                            <%= reserva.getRuta().getEstacionByIdOrigen().getNombre() %> 
                            <i class="fas fa-arrow-right"></i> 
                            <%= reserva.getRuta().getEstacionByIdDestino().getNombre() %>
                        </span>
                    </h3>
                </div>
                <div class="col-md-9 p-2 mb-3">
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
                                <h4 class="text-center mb-3 border-bottom">Salida: <strong><%= hora %></strong></h4>
                                <ul>
                                    <li>Llegada: <strong>~<%= llegada %></strong></li>
                                    <li>Duración: <strong><%= formatter.format(reserva.getRuta().getDuracion()) %></strong></li>
                                    <li>Distancia: <strong><%= reserva.getRuta().getKilometros()%> km</strong></li>
                                    <li>Plazas disponibles: <strong><%= viaje.getPlazasDisponibles()%></strong></li>
                                </ul>
                                <%
                                String disabled = "";
                                if(viaje.getPlazasDisponibles() < reserva.getPasajeros()){
                                    disabled = "disabled";
                                }
                                %>
                                <form class="w-100 d-flex justify-content-center" action="./elegirViaje" method="post">
                                    <input type="hidden" name="viaje" value="<%= viaje.getId() %>">
                                    <button class="btn btn-primary <%= disabled %>" <%= disabled %> type="submit">Elegir viaje</button>
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
                        String origen = reserva.getRuta().getEstacionByIdOrigen().getNombre();
                        String destino = reserva.getRuta().getEstacionByIdDestino().getNombre();
                        session.setAttribute("reserva", null);
                        session.setAttribute("pagina", null);
                        response.sendRedirect("./error.jsp?code=horario-404&origen=" + origen + "&destino=" + destino + "&fecha=" + laFecha);
                        return;
                    }
                    %>
                        
                    <div class="d-flex flex-column justify-content-center align-items-center w-100 my-4">
                        <div id="c_75592776f23eec067cdfb752875dcf7f" class="ancho mb-3"></div><script type="text/javascript" src="https://www.eltiempo.es/widget/widget_loader/75592776f23eec067cdfb752875dcf7f"></script>
                        <div id="c_1600114df6a1fce1ebed744498d2c489" class="ancho"></div><script type="text/javascript" src="https://www.eltiempo.es/widget/widget_loader/1600114df6a1fce1ebed744498d2c489"></script>
                    </div>
                </div>
            </div>
                    
            </section>
            
        </main>

        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/main.js"></script>
        <script>

            $('#owl-list').owlCarousel({
                items: 2,
                loop: false,
                margin: 30,
                nav: true,
		lazyLoad:true,
		dots: true,
                responsive:{
                    600:{
                        items: 3
                    }
                }
            });
            
        </script>
        
    </body>
</html>
