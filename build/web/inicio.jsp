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
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/blue-style.css"/>
        <title>Bienvenido al mejor sitio web del mundo</title>
    </head>
    <body>
        

        <!-- barra de navegación -->
        <header class="container-fuild">
            <jsp:include page="./modulo/barra_de_navegacion.jsp" />
        </header>
        
        <!-- contenido principal -->
        <main class="container-fluid">
            
            <!-- hacer un búsqueda -->
            <section class="row bg-img" style="background-image:url('./assets/img/bus1.jpg')"> 
                <div class="container col-md-8 py-3 mx-auto">
                    <form class="text-white p-5 mx-auto" method="post" action="./buscarViajes">
                        <div class="text-center text-shadow mb-4">
                            <i class="fas fa-map-marked-alt fa-6x mb-2"></i>
                            <h2>Encuentra viajes baratos</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-10">
                                <div class="form-row">
                                    <div class="form-group col">
                                        <div class="input-group">
                                            <label title="Origen" class="input-group-prepend" for="origen"><span class="input-group-text"><i class="fas fa-map-marked-alt"></i>&nbsp;</span></label>
                                            <select class="form-control" name="origen" id="origen" onchange="buscarDestino(this.value)" required>
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
                                    </div>
                                    <div class="form-group col">
                                        <div class="input-group">
                                            <label title="Destino" class="input-group-prepend" for="destino"><span class="input-group-text"><i class="fas fa-map-pin"></i>&nbsp;</span></label>
                                            <select class="form-control" name="destino" id="destino" required>
                                                <option disabled>Primero seleccione el origen</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col mb-0">
                                        <div class="input-group">
                                            <label title="Fecha de salida" class="input-group-prepend mb-0" for="salida"><span class="input-group-text"><i class="fas fa-clock"></i></span></label>
                                            <input class="form-control" type="date" name="salida" id="salida" required>
                                        </div>
                                    </div>
                                    <div class="form-group col mb-0">
                                        <div class="input-group">
                                            <label title="Cantidad de pasajeros" class="input-group-prepend mb-0" for="pasajeros"><span class="input-group-text"><i class="fas fa-users"></i></span></label>
                                            <input class="form-control" type="number" name="pasajeros" id="pasajeros" required value="1" max="20" min="1">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button class="d-flex flex-wrap h-100 w-100 align-items-center justify-content-center btn btn-primary" type="submit"><i class="fas fa-search fa-3x"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            
            <!-- nuestras características -->
            <section class="row">
                <div class="container col-md-9 mx-auto">
                    <div class="d-flex flex-wrap justify-content-between my-5">
                        <div class="col-4 bg-white shadow p-4 text-center">
                            <i class="fas fa-globe"></i>
                            <p class="mb-0">Multilenguaje</p>
                        </div>
                        <div class="col-4 bg-white shadow p-4 text-center">
                            <i class="fas fa-map-marked"></i>
                            <p class="mb-0">Explore</p>
                        </div>
                        <div class="col-4 bg-white shadow p-4 text-center">
                            <i class="fas fa-flag"></i>
                            <p class="mb-0">Internacional</p>
                        </div>
                        <div class="col-4 bg-white shadow p-4 text-center">
                            <i class="fas fa-users"></i>
                            <p class="mb-0">Usuarios</p>
                        </div>
                        <div class="col-4 bg-white shadow p-4 text-center">
                            <i class="fas fa-luggage-cart"></i>
                            <p class="mb-0">Equipaje</p>
                        </div>
                        <div class="col-4 bg-white shadow p-4 text-center">
                            <i class="fas fa-wifi"></i>
                            <p class="mb-0">Wifi gratis</p>
                        </div>
                    </div>
                </div>
                
                <div class="container col-md-9 mx-auto">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3>Quiénes somos</h3>
                            <p>
                                Consulta los horarios de los autobuses y disfruta de todas las ventajas de organizar tus rutas de autobús, conociendo los horarios de cada trayecto antes de reservar.  <br><br>
                                Si tienes en mente algo distinto, ponte en contacto con nosotros, y te ofreceremos las mejores soluciones en transporte. Destacamos por nuestro compromiso y gestión de vehículos para que de lo único que tengas que preocuparte sea de disfrutar de tu acto especial.
                            </p>
                            <a class="btn btn-outline-dark" href="#"><i class="fas fa-envelope"></i> Contactar</a>
                        </div>
                        <div class="col-sm-6">
                            <img class="ml-auto shadow" src="./assets/img/bus1.jpg" width="100%" alt="viaja conmigo">
                        </div>
                    </div>
                </div>
                
            </section>
            
        </main>
        
        <footer class="container-fluid mt-3">
            <div class="row justify-content-center">
                <div class="col-9 text-center p-4">
                    &copy; All rights reserved
                </div>
            </div>
        </footer>
                                            
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/main.js"></script>
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
