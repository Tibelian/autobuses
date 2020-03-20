
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="servicios.ViajeSW"%>
<%@page import="servicios.HorarioSW"%>
<%@page import="servicios.RutaSW"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>BusRastreator - Compara todas las rutas</title>
    </head>
    <body class="d-flex h-100 w-100 flex-column justify-content-center align-items-center bg-light">
        
        <h1 class="my-4">Todas las rutas disponibles en: AutoBus</h1>
        
        <div class="col-9">
        <table class="w-100 table table-sm bg-white table-bordered shadow align-middle small text-center">
            <thead class="thead-dark">
                <tr>
                    <th>Origen</th>
                    <th>Destino</th>
                    <th>Precio</th>
                    <th>Horarios</th>
                </tr>
            </thead>
            <tbody>
        <%
        try {
            servicios.Rutas_Service service = new servicios.Rutas_Service();
            servicios.Rutas port = service.getRutasPort();
            List<RutaSW> result = port.devuelveListado();
            Iterator itResult = result.iterator();
            while(itResult.hasNext()){
                RutaSW rutaSW = (RutaSW)itResult.next();
            %>
            <tr>
                <td class="align-middle"><%= rutaSW.getOrigen().getNombre() %></td>
                <td class="align-middle"><%= rutaSW.getDestino().getNombre() %></td>
                <td class="align-middle"><%= rutaSW.getPrecio() %></td>
                <td class="align-middle">
                <table class="table-sm w-100">
                    <thead class="thead-light">
                        <tr>
                            <th>Tipo</th>
                            <th>Hora</th>
                            <th>Viaje</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                Iterator itHorario = rutaSW.getHorarios().iterator();
                while(itHorario.hasNext()){
                    HorarioSW horarioSW = (HorarioSW)itHorario.next();
                    String laHora = horarioSW.getHora().getHour() + ":" + horarioSW.getHora().getSecond();
                %>
                    <tr>
                        <td class="align-middle"><%= horarioSW.getTipo() %></td>
                        <td class="align-middle"><%= laHora %></td>
                        <td class="align-middle">
                        <%
                        if(horarioSW.getViajes().size() != 0){
                        %>
                        <table class="table-sm w-100">
                            <thead class="thead-light">
                                <tr>
                                    <th>Plazas Total</th>
                                    <th>Plazas Disponibles</th>
                                    <th>Fecha</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                        Iterator itViaje = horarioSW.getViajes().iterator();
                        while(itViaje.hasNext()){
                            ViajeSW viajeSW = (ViajeSW)itViaje.next();
                            String laFecha = viajeSW.getFecha().getDay() + "/" + viajeSW.getFecha().getMonth() + "/" + viajeSW.getFecha().getYear();
                        %>
                            <tr>
                                <td class="align-middle"><%= viajeSW.getPlazas() %></td>
                                <td class="align-middle"><%= viajeSW.getPlazasDisponibles() %></td>
                                <td class="align-middle"><%= laFecha %></td>
                            </tr>
                        <%
                        }
                        %>
                            </tbody>
                        </table>
                        <%
                        }
                        %>
                        </td>
                    </tr>
                <%
                }
                %>
                    </tbody>
                </table>
                </td>
            </tr>
            <%
            }
        } catch (Exception ex) {
            out.print(ex);
        }
        %>
            </tbody>
        </table>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
            
    </body>
</html>