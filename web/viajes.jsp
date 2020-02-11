
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
        <link rel="stylesheet" href="./assets/css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="./assets/css/owl.theme.default.min.css"/>
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/owl.carousel.min.js"></script>
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
               
                <div class="bg-white b-radius p-30" style="margin:auto;border-radius:10px;">
                    <div class="navigation">
                        <ul>
                            <li><a href="./inicio.jsp"><i class="fas fa-home"></i></a></li>
                            <li><a class="active" href="#"><span>1</span> Viaje</a></li>
                            <li><a href="#"><span>2</span> Pasajeros</a></li>
                            <li><a href="#"><span>3</span> Resumen</a></li>
                            <li><a href="#"><span>4</span> Pago</a></li>
                            <li><a href="#"><span>5</span> Completado</a></li>
                        </ul>
                    </div>
                    
                    <h1 class="mx-auto" style="text-align:center">
                        <%= laFecha %> <br>
                        <%= reserva.getRuta().getEstacionByIdOrigen().getNombre() %> 
                        <i class="fas fa-arrow-right"></i> 
                        <%= reserva.getRuta().getEstacionByIdDestino().getNombre() %>
                    </h1>   

                    <div class="owl-carousel text-white  p-20 m-auto" id="owl-list">

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
                            <div class="item shadow p-30 m-20 text-white">
                                <h2 style="margin-bottom: 10px;border-bottom: 1px solid #c0c0c0;"><%= horario.getRuta().getPrecio() %> €</h2>
                                <ul style="margin-left: 20px;">
                                    <li>Hora salida: <%= hora %></li>
                                    <li>Hora llegada: ~<%= llegada %></li>
                                    <li>Duración: <%= formatter.format(reserva.getRuta().getDuracion()) %></li>
                                    <li>Distancia: <%= reserva.getRuta().getKilometros()%> km</li>
                                </ul>
                                <form style="padding: 10px 0 0 0;" action="./elegirViaje" method="post">
                                    <input type="hidden" name="viaje" value="<%= viaje.getId() %>">
                                    <button type="submit">Elegir viaje</button>
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
                
            </section>
            
        </main>

        <script>

            $('#owl-list').owlCarousel({
                center: true,
                items: 2,
                loop: false,
                margin: 10,
                nav: true,
                responsive:{
                    600:{
                        items: 1.5
                    }
                }
            });
            
        </script>
        
    </body>
</html>
