<%@page import="java.util.List"%>
<%@page import="POJOS.Estacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("listadoOrigen") == null){
    response.sendRedirect("./obtenerOrigen");
    return;
}
List<Estacion> listadoOrigen = (List)session.getAttribute("listadoOrigen");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <link rel="stylesheet" href="./assets/css/pure-css-select-style.css"/>
        <script src="./assets/js/main.js"></script>
        <title>Bienvenido al mejor sitio web del mundo</title>
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
            
            <section class="bg-opacity bg-img" style="background-image:url('./assets/img/architecture.jpg')"> 
                
                <div class="text-white bg-white shadow b-radius p-20 m-auto">
                    <form method="post" action="./buscarViajes">
                        <div class="form-group">
                            <label for="origen"><i class="fas fa-map-marked-alt"></i> Origen:</label>
                            <select name="origen" id="origen" onchange="buscarDestino(this.value)" required>
                                <option value=""></option>
                                <%
                                for(Estacion estacion:listadoOrigen){
                                %>
                                <option value="<%= estacion.getId() %>"><%= estacion.getNombre() %> - <%= estacion.getDireccion() %></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="destino"><i class="fas fa-map-pin"></i> Destino:</label>
                            <select name="destino" id="destino" required></select>
                        </div>
                        <div class="d-flex">
                            <div class="form-group" style="margin-right: 5px;">
                                <label for="salida"><i class="fas fa-clock"></i> Salida:</label>
                                <input type="date" name="salida" id="salida" required>
                            </div>
                            <div class="form-group">
                                <label for="pasajeros"><i class="fas fa-users"></i> Pasajeros:</label>
                                <input type="number" name="pasajeros" id="pasajeros" required value="1">
                            </div>
                        </div>
                        <button type="submit"><i class="fas fa-search"></i> Buscar</button>
                    </form>
                </div>
                
            </section>
            
            <section style="background-color:#ef9a9a;">
                <div class="featured">
                    <div class="icon">
                        <i class="fas fa-globe"></i>
                        <h5>Multilenguaje</h5>
                    </div>
                    <div class="icon">
                        <i class="fas fa-map-marked"></i>
                        <h5>Explore</h5>
                    </div>
                    <div class="icon">
                        <i class="fas fa-flag"></i>
                        <h5>Internacional</h5>
                    </div>
                    <div class="icon">
                        <i class="fas fa-users"></i>
                        <h5>Usuarios</h5>
                    </div>
                    <div class="icon">
                        <i class="fas fa-luggage-cart"></i>
                        <h5>Equipaje</h5>
                    </div>
                </div>
                
                
                <div class="d-flex p-20">
                    <div class="w-50" style="padding-right: 20px;">
                        <h2 style="margin-bottom: 20px;">Quiénes somos</h2>
                        <p>
                            Consulta los horarios de los autobuses y disfruta de todas las ventajas de organizar tus rutas de autobús, conociendo los horarios de cada trayecto antes de reservar.  <br><br>
                            Si tienes en mente algo distinto, ponte en contacto con nosotros, y te ofreceremos las mejores soluciones en transporte. Destacamos por nuestro compromiso y gestión de vehículos para que de lo único que tengas que preocuparte sea de disfrutar de tu acto especial.
                        </p>
                        <a class="btn-contact" href="#"><i class="fas fa-envelope"></i> Contactar</a>
                    </div>
                    <div class="w-50">
                        <img class="ml-auto" src="./assets/img/bus1.jpg" width="100%" alt="viaja conmigo">
                    </div>
                </div>
                
            </section>
            
        </main>
        
        <script>
            var fecha = new Date();
            var mes = fecha.getUTCMonth() + 1;
            var dia = fecha.getUTCDate();
            if(mes < 10){ mes = "0" + mes; }
            if(dia < 10){ dia = "0" + dia; }
            var fechaSalida = fecha.getUTCFullYear() + "-" + mes  + "-" + dia;
            document.getElementById("salida").value = fechaSalida;
        </script>
        
    </body>
</html>
<%
session.setAttribute("listadoOrigen", null);
%>
