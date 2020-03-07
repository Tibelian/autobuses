
<%@page import="POJOS.Ocupacion"%>
<%@page import="java.util.Iterator"%>
<%@page import="POJOS.Compra"%>
<%@page import="POJOS.Ruta"%>
<%@page import="POJOS.Estacion"%>
<%@page import="POJOS.Viaje"%>
<%@page import="POJOS.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
boolean localizado = false;
Compra compra = null;
if(session.getAttribute("compraLocalizada") != null){
    compra = (Compra) session.getAttribute("compraLocalizada");
    localizado = true;
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/blue-style.css"/>
        <title>Localizador - AutoBus</title>
    </head>
    <body>
        
        <!-- barra de navegación -->
        <header class="container-fuild">
            <jsp:include page="./modulo/barra_de_navegacion.jsp" />
        </header>
        
        <!-- contenido principal -->
        <main class="container-fluid">
            
            
            <!-- listado con viajes disponibles -->
            <section class="row justify-content-center"> 
                
                <%
                if(localizado){
                %>
                <div class="col-6 p-3">
                    <h3 class="text-center mt-4">
                        Compra con el localizador:<br> <strong><%= compra.getLocalizador() %></strong>
                    </h3>
                </div>
                <div class="col-md-9 p-2 mb-3">
                    <div class="row justify-content-center">
                        <div class="col-6 bg-white shadow m-3 p-5">
                            <ul class="list-group">
                                <li class="list-group-item p-2">Fecha:  <strong><%= compra.getFecha() %> </strong></li>
                                <li class="list-group-item p-2">Importe total:  <strong><%= compra.getImporte()%> € </strong></li>
                                <li class="list-group-item p-2">Ruta:  <strong><%= compra.getViaje().getHorario().getRuta().getEstacionByIdOrigen().getNombre() %> -> <%= compra.getViaje().getHorario().getRuta().getEstacionByIdDestino().getNombre() %> </strong></li>
                                <li class="list-group-item p-2">Viajeros: <strong><%= compra.getViajeros() %></strong></li>
                                <%
                                Iterator itOcupacion = compra.getOcupacions().iterator();
                                while(itOcupacion.hasNext()){
                                    Ocupacion ocupacion = (Ocupacion) itOcupacion.next();
                                %>
                                
                                <li class="list-group-item p-2 bg-light"></li>
                                <li class="list-group-item p-2">Nombre: <strong><%= ocupacion.getViajero().getNombre() + " " + ocupacion.getViajero().getApellidos() %></strong></li>
                                <li class="list-group-item p-2">DNI: <strong><%= ocupacion.getViajero().getDni() %></strong></li>
                                <li class="list-group-item p-2">Asiento: <strong><%= ocupacion.getAsiento() %></strong></li>
                                
                                <%
                                }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
                <%
                }else{
                %>
                <div class="col-6 p-3">
                    <h3 class="text-center mt-4">
                        Introduce tu localizador para obtener información sobre la compra
                    </h3>
                </div>
                <div class="col-md-9 p-2 mb-3">
                    <div class="row justify-content-center">
                        <div class="col-6 bg-white shadow m-3 p-5">
                            <form method="POST" action="./cargaLocalizador">
                                <div class="form-group">
                                    <label for="localizador"><i class="fas fa-key"></i> Código</label>
                                    <input type="text" maxlength="8" class="form-control" id="localizador" name="localizador">
                                </div>
                                <div class="d-flex">
                                    <button type="submit" class="btn btn-primary mx-auto"><i class="fas fa-search"></i> Obtener datos</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%
                }
                %>
                
            </section>
            
        </main>

        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>
<%
session.setAttribute("compraLocalizada", null);
%>