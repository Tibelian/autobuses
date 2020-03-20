<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="POJOS.Tarjeta"%>
<%@page import="java.util.Iterator"%>
<%@page import="POJOS.Cliente"%>
<%
if(session.getAttribute("cliente") == null){
    response.sendRedirect("./error.jsp?code=Debes iniciar sesión como cliente para entrar al panel del usuario");
    return;
}
Cliente cliente = (Cliente) session.getAttribute("cliente");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/blue-style.css"/>
        <title>Panel de usuario - AutoBus</title>
    </head>
    <body>
        
        <!-- barra de navegación -->
        <header class="container-fuild">
            <jsp:include page="./modulo/barra_de_navegacion.jsp" />
        </header>
        
        <!-- contenido principal -->
        <main class="container-fluid">
            <section class="row flex-column align-items-center justify-content-center">
                <h1 class="mt-4">Panel del usuario</h1>
                <div class="col-6 bg-white shadow rounded p-3 my-3">
                    <ul class="list-group">
                        <li class="list-group-item"><i class="fas fa-envelope"></i> Email: <strong><%= cliente.getEmail() %></strong></li>
                        <li class="list-group-item"><i class="fas fa-user"></i> Nombre y Apellidos: <strong><%= cliente.getNombre() + " " + cliente.getApellidos() %></strong></li>
                        <li class="list-group-item"><i class="fas fa-id-card"></i> DNI: <strong><%= cliente.getDni() %></strong></li>
                        <li class="list-group-item"><i class="fas fa-phone"></i> Teléfono: <strong><%= cliente.getTelefono()%></strong></li>
                    </ul>
                    <p class="mt-3 mb-0 font-weight-bold border-bottom text-center bg-light p-2 text-uppercase">Tarjetas: </p>
                    <ul class="list-group text-center" style="list-style-type:none">
                    <%
                    if(cliente.getTarjetas().size() != 0){
                        Iterator itTarjeta = cliente.getTarjetas().iterator();
                        while(itTarjeta.hasNext()){
                            Tarjeta tarjeta = (Tarjeta) itTarjeta.next();
                            String digitos = new String(tarjeta.getNumero(), StandardCharsets.UTF_8);
                        %>
                        <li style="margin-top: 10px;">Tipo: <strong class="text-uppercase"><%= tarjeta.getTipo() %></strong></li>
                        <li>Número: <strong>•••• •••• •••• •••• <%= digitos.substring(digitos.length() - 4) %></strong></li>
                        <li></li>
                        <%
                        }
                    }else{
                    %>
                    <li>No tiene ninguna tarjeta enlazada</li>
                    <%
                    }
                    %>
                    </ul>
                </div>
            </section>
        </main>
                                            
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>
