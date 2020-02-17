
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
Reserva reserva = (Reserva)session.getAttribute("reserva");
DateFormat formatterFecha = new SimpleDateFormat("dd/MM/yyyy");
String laFecha = formatterFecha.format(reserva.getFechaSalida());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script
        <script src="./assets/js/swal-forms.js"></script>
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
               
                <div class="bg-white p-30" style="margin:auto;border-radius:10px;">
                    <div class="navigation">
                        <ul>
                            <li><a href="./inicio.jsp"><i class="fas fa-home"></i></a></li>
                            <li><a href="./viajes.jsp"><span>1</span> Viaje</a></li>
                            <li><a href="./pasajeros.jsp"><span>2</span> Pasajeros</a></li>
                            <li><a href="./resumen.jsp"><span>3</span> Resumen</a></li>
                            <li><a class="active" href="#"><span>4</span> Pago</a></li>
                            <li><a href="#"><span>5</span> Completado</a></li>
                        </ul>
                    </div>
                    
                    <%
                    if(session.getAttribute("cliente") == null){
                    %>
                    <div style="display:flex; justify-content:space-around; margin-top: 10px;">
                        <button onclick="registro()" class="submit">Crear cuenta</button>
                        <button onclick="login()" class="submit">Iniciar sesión</button>
                    </div>
                    <%
                    }else{
                        Cliente cliente = (Cliente)session.getAttribute("cliente");
                        if(cliente.getTarjetas().size() == 0){
                        %>
                        AGREGAR TARJETA NUEVA
                        <%
                        }else{
                        %>
                        MOSTRAR TARJETAS Y BOTON PARA AGREGAR UNA NUEVA
                        <%
                        }
                    }
                    %>
                    
                </div>
                     
                        

            </section>
            
        </main>

        <script>
            function login(){
                Swal.fire({
                    title: 'Iniciar sesión',
                    html: `
                        <form method="post" action="./iniciarSesion">
                            <input type="hidden" name="redirect" value="pagar.jsp">
                            <div class="form-group">
                                <label for="email"><i class="fas fa-envelope"></i> Correo electrónico:</label>
                                <input type="text" id="email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="fas fa-key"></i> Contraseña:</label>
                                <input type="password" id="password" name="password">
                            </div>
                            <div class="form-row fcenter">
                                <button type="submit"><i class="fas fa-sign-in-alt"></i> Entrar</button>
                            </div>
                        </form>
                    `,
                    showCloseButton: true,
                    showCancelButton: false,
                    showConfirmButton: false
                });
            }
            
            function registro(){
                Swal.fire({
                    title: 'Crear cuenta',
                    html: `
                        <form method="post" action="./crearCuenta">
                            <input type="hidden" name="redirect" value="pagar.jsp">
                            <div class="form-group">
                                <label for="email"><i class="fas fa-envelope"></i> Correo electrónico:</label>
                                <input type="text" id="email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="fas fa-key"></i> Contraseña:</label>
                                <input type="password" id="password" name="password">
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="nombre"><i class="fas fa-user"></i> Nombre:</label>
                                    <input type="text" id="nombre" name="nombre">
                                </div>
                                <div class="form-group">
                                    <label for="apellidos"><i class="far fa-user"></i> Apellidos:</label>
                                    <input type="text" id="apellidos" name="apellidos">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="dni"><i class="fas fa-id-card"></i> DNI:</label>
                                    <input onchange="validarRegistroDni()" type="text" id="dni" name="dni">
                                </div>
                                <div class="form-group">
                                    <label for="telefono"><i class="fas fa-phone"></i> Teléfono:</label>
                                    <input type="number" id="telefono" name="telefono">
                                </div>
                            </div>
                            <div class="form-row fcenter">
                                <button type="submit"><i class="fas fa-user-plus"></i> Registrarse</button>
                            </div>
                        </form>
                    `,
                    showCloseButton: true,
                    showCancelButton: false,
                    showConfirmButton: false
                });
            }
        </script>
        
    </body>
</html>
