
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="POJOS.Tarjeta"%>
<%@page import="java.util.Iterator"%>
<%@page import="POJOS.Cliente"%>
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
if(request.getParameter("ok") != null){
    session.setAttribute("pagina", "pagar.jsp");
}
Reserva reserva = (Reserva)session.getAttribute("reserva");

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
        <link rel="stylesheet" href="./assets/css/card.css"/>
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
            
            <section class="row justify-content-center mt-3"> 
                    
                <div class="col-md-6">
                    <%
                    if(session.getAttribute("cliente") == null){
                    %>
                        <div class="d-flex justify-content-center">
                            <i class="text-center fas fa-exclamation-triangle fa-4x" style="color:rgba(0,0,0,.3);"></i>
                            <h3 class="text-center">Hemos detectado que todavía no te has identificado para realizar el pago.</h3>
                        </div>                    
                        <div class="d-flex justify-content-around mt-3">
                            <button class="btn btn-outline-primary" onclick="registro()">Crear cuenta</button>
                            <button class="btn btn-primary" onclick="login()">Iniciar sesión</button>
                        </div>
                    <%
                    }else{
                        Cliente cliente = (Cliente)session.getAttribute("cliente");
                        if(request.getParameter("account-created") != null){
                        %>  
                        <div class="d-flex justify-content-center">
                            <i class="text-center fas fa-check-circle fa-4x" style="color:rgba(0,0,0,.3);"></i>
                            <h3 class="text-center">La cuenta ha sido creada con éxito y ha iniciado sesión automáticamente</h3>
                        </div>
                        <%
                        }

                        if(cliente.getTarjetas().size() == 0 || request.getParameter("nueva-tarjeta") != null){
                        %>
                        <!-- agregar una tarjeta nueva -->
                        <div class="p-4 bg-white shadow-sm rounded">
                            <div class="d-flex flex-wrap justify-content-center">
                                <h3 class="w-100 text-center">Introduzca los datos de su tarjeta bancaria:</h3>
                                <jsp:include page="./modulo/agregar_tarjeta.jsp" />
                            </div>
                        </div>
                        <%
                            if(request.getParameter("nueva-tarjeta") != null){
                            %>
                            <div class="d-flex my-4 justify-content-center">
                                <a class='btn btn-sm btn-danger' href='./pagar.jsp'>Cancelar</a>
                            </div>
                            <%
                            }
                        }else{
                        %>
                        <!-- elegir tarjeta y/o agrear una nueva -->
                        <a class="w-100 btn btn-sm btn-outline-primary" href="./pagar.jsp?nueva-tarjeta=1"><i class="fas fa-plus-circle"></i> Añadir nueva tarjeta</a>
                        <table class="table table-light shadow-sm table-hover my-3">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Tipo</th>
                                    <th>Últimos dígitos</th>
                                    <th>Caducidad</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                Iterator itTarjeta = cliente.getTarjetas().iterator();
                                while(itTarjeta.hasNext()){
                                    Tarjeta tarjeta = (Tarjeta)itTarjeta.next();
                                    String digitos = new String(tarjeta.getNumero(), StandardCharsets.UTF_8);
                                %>
                                <tr>
                                    <td class="align-middle text-uppercase"><%= tarjeta.getTipo() %></td>
                                    <td class="align-middle">•••• •••• •••• •••• <%= digitos.substring(digitos.length() - 4) %></td>
                                    <td class="align-middle"><%= new SimpleDateFormat("MM/yyyy").format(tarjeta.getCaducidad()) %></td>
                                    <td class="align-middle d-flex">
                                        <form onsubmit="confirmarEliminar(this); return false;" method="post" action="./eliminarTarjeta?id=<%= tarjeta.getId() %>">
                                            <button title="Haga click para eliminar tarjeta de crédito" class="btn btn-sm btn-danger" type="submit"><i class="fas fa-trash"></i></button>
                                        </form>
                                        <form id="form-<%= tarjeta.getId() %>" onsubmit="confirmarPago(this, '<%= tarjeta.getTipo() %>', <%= reserva.getRuta().getPrecio() * reserva.getViajeros().size() %>); return false;" method="post" action="./confirmarPago?id=<%= tarjeta.getId() %>">
                                            <button class="mx-2 btn btn-sm btn-primary" type="submit"><i class="fas fa-check"></i> PAGAR</button>
                                        </form>
                                    </td>
                                </tr> 
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                        <%
                        }
                    }
                    %>
                </div>
                    
            </section>
            
        </main>

        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/card.js"></script>
        <script src="./assets/js/main.js"></script>
        <script>
            <%
            if(request.getParameter("msg") != null){
                String msg = request.getParameter("msg");
                if(msg.equals("eliminar-tarjeta-ok")){
            %>
                    Swal.fire({
                        title: '¡Tarjeta eliminada!',
                        text: 'La tarjeta se ha eliminado con éxito',
                        icon: 'success',
                        confirmButtonText: 'Ok'
                    });
            <%
                }
            }
            %>
            
            function confirmarEliminar(form){
                Swal.fire({
                    title: '¿Está usted seguro?',
                    text: 'Una vez eliminada la tarjeta ya no podrá utilizarla. Le recomendamos que por lo menos tenga una tarjeta guardada para futuras compras, de este modo facilitandole la compra.',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Sí, quiero eliminarla',
                    cancelButtonText: 'No, mejor no'
                }).then((result) => {
                    if(result.value){
                        form.submit();
                    }
                });
            }
            
            
            function confirmarPago(form, tarjeta, precio){
                Swal.fire({
                    title: 'Escribe "CONFIRMAR"',
                    icon: 'info',
                    html: '<h5>Para completar el pago <strong>' + precio + ' €</strong> con la tarjeta <span class="text-uppercase">' + tarjeta + '</span></h5>',
                    input: 'text', 
                    inputAttributes: {
                        maxlength: 10,
                        autocapitalize: 'off',
                        autocorrect: 'off',
                        class: 'text-center'
                    },
                    confirmButtonText: 'Realizar pago',
                    cancelButtonText: 'Cancelar',
                    showCancelButton: true,
                    inputValidator: (value) => {
                        if (value === "CONFIRMAR") {
                            form.submit();
                        }else{
                            return '¡Debes confirmar la compra!'
                        }
                    }
                });
            }
        </script>
        
    </body>
</html>
