
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="POJOS.Viaje"%>
<%@page import="POJOS.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("administrador") == null){
    response.sendRedirect("./");
    return;
}
Administrador admin = (Administrador) session.getAttribute("administrador");

if(session.getAttribute("listadoViajes") == null){
    response.sendRedirect("../obtenerViajesNoFinalizados");
    return;
}
List<Viaje> listadoViajes = (List)session.getAttribute("listadoViajes");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../assets/css/all.min.css"/>
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/datatables.min.css"/>
        <link rel="stylesheet" href="../assets/css/blue-style.css"/>
        <title>Adminstración - AutoBus</title>
    </head>
    <body>
        
        <!-- barra de navegación -->
        <header class="container-fuild">
            
        </header>
        
        <!-- contenido principal -->
        <main class="container-fluid">
            
            <section class="row justify-content-center mt-3"> 
                    
                <div class="col-md-8">
                    
                    <div class="my-4 d-flex flex-column align-items-center">
                        <h1 class="text-center">PANEL ADMIN</h1>
                        <a class="btn btn-primary btn-sm" href="../"><i class="fas fa-home"></i> Volver</a>
                    </div>
                    
                    <div class="row table-responsive bg-white shadow-sm p-3 rounded">
                        <table class="table table-sm table-hover display" id="tabla-viajes">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Origen</th>
                                    <th>Destino</th>
                                    <th>Fecha y hora</th>
                                    <th>Plazas</th>
                                    <th>Finalizar viaje</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                Iterator viajes = listadoViajes.iterator();
                                while(viajes.hasNext()){
                                    Viaje viaje = (Viaje) viajes.next();
                                    String origen = viaje.getHorario().getRuta().getEstacionByIdOrigen().getNombre() + " - " + viaje.getHorario().getRuta().getEstacionByIdOrigen().getDireccion();
                                    String destino = viaje.getHorario().getRuta().getEstacionByIdDestino().getNombre() + " - " + viaje.getHorario().getRuta().getEstacionByIdDestino().getDireccion();
                                    SimpleDateFormat formatterHora = new SimpleDateFormat("HH:mm");
                                    String horaSalida = formatterHora.format(viaje.getHorario().getHora());
                                    SimpleDateFormat formatterFecha = new SimpleDateFormat("dd/MM/YYYY");
                                    String fechaSalida = formatterFecha.format(viaje.getFecha());
                                %>
                                <tr>
                                    <td><%= origen %></td>
                                    <td><%= destino %></td>
                                    <td><%= fechaSalida + " " + horaSalida %></td>
                                    <td><%= viaje.getPlazas() %></td>
                                    <td>
                                        <form method="post" action="../finalizarViaje">
                                            <input type="hidden" name="id" value="<%= viaje.getId() %>">
                                            <button class="w-100 btn btn-sm btn-danger" type="submit"><i class="fas fa-ban"></i></button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                        
                        
                </div>
                    
            </section>
            
        </main>

        <script src="../assets/js/jquery-3.4.1.min.js"></script>
        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/datatables.min.js"></script>
        <script src="../assets/js/sweetalert2@9.js"></script>
        <script src="../assets/js/main.js"></script>
        <script>
            $('#tabla-viajes').DataTable({
                language: {
                    "decimal":        "",
                    "emptyTable":     "No hay viajes",
                    "info":           "Mostrando _START_ a _END_ de _TOTAL_ entradas totales",
                    "infoEmpty":      "Showing 0 to 0 of 0 entries",
                    "infoFiltered":   "(filtered from _MAX_ total entries)",
                    "infoPostFix":    "",
                    "thousands":      ",",
                    "lengthMenu":     "Mostrar _MENU_ viajes por página",
                    "loadingRecords": "Cargando...",
                    "processing":     "Procesando...",
                    "search":         "Buscar:",
                    "zeroRecords":    "No se han encontrado viajes con ese filtro",
                    "paginate": {
                        "first":      "Primera",
                        "last":       "Última",
                        "next":       "<i class='fas fa-arrow-right'></i>",
                        "previous":   "<i class='fas fa-arrow-left'></i>"
                    },
                    "aria": {
                        "sortAscending":  ": activate to sort column ascending",
                        "sortDescending": ": activate to sort column descending"
                    }
                }
            });
        </script>
        
    </body>
</html>

<%
session.setAttribute("listadoViajes", null);
%>
