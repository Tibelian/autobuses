
<%@page import="java.util.List"%>
<%@page import="POJOS.Ocupacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJOS.Compra"%>
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

ArrayList<Integer> ocupados = new ArrayList();
Iterator comprasIt = reserva.getViaje().getCompras().iterator();
while(comprasIt.hasNext()){
    Compra compra = (Compra)comprasIt.next();
    Iterator ocupacionIt = compra.getOcupacions().iterator();
    while(ocupacionIt.hasNext()){
        Ocupacion ocupacion = (Ocupacion)ocupacionIt.next();
        ocupados.add(ocupacion.getAsiento());
    }
}

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="./assets/css/style.css"/>
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
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
                            <li><a class="active" href="#"><span>2</span> Pasajeros</a></li>
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
                    
                    <p style="margin-top: 15px;">
                        <i class="fas fa-info-circle"></i>
                        A continuación por favor arrastre el pasajero en el asiento que usted desea. Para introducir los datos del pasajero debe hacer click encima suya.
                    </p>
                       
                    <form id="pasajeros-form" onsubmit="compruebaDatos(this); return false;" method="post" action="#">
                        <%
                        for(int i = 1; i <= reserva.getPasajeros(); i++){
                        %>
                        <div class="passager">
                            <div class="passager-data hide" id="passager-<%= i %>">
                                <button type="button" class="close" onclick="openModal('passager-<%= i %>', <%= reserva.getPasajeros() %>)"><i class="fas fa-times"></i></button>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="nombre-<%= i %>"><i class="far fa-user"></i> Nombre:</label>
                                        <input class="dato-pasajero" type="text" id="nombre-<%= i %>" name="nombre[]">
                                    </div>
                                    <div class="form-group">
                                        <label for="apellidos-<%= i %>"><i class="fas fa-user"></i> Apellidos:</label>
                                        <input class="dato-pasajero" type="text" id="apellidos-<%= i %>" name="apellidos[]">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="dni-<%= i %>"><i class="fas fa-id-card"></i> DNI / NIE:</label>
                                        <input maxlength="9" class="dato-pasajero" type="text" id="dni-<%= i %>" name="dni[]">
                                    </div>
                                    <div class="form-group">
                                        <label for="asiento-<%= i %>"><i class="fas fa-chair"></i> Asiento:</label>
                                        <input class="dato-pasajero" type="text" readonly id="asiento-<%= i %>" name="asiento[]" value="¡sin seleccionar!">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%  
                        }
                        %>
                        
                        
                        <div class="drag-and-drop">
                            <div id="contenedor-pasajeros" class="icons" ondrop="cancelarAsiento(event)" ondragover="allowDrop(event)">
                            <%
                            for(int pas = 1; pas <= reserva.getPasajeros(); pas++){
                            %>
                            <i class="fas fa-male fa-3x" numpasajero="<%= pas %>" id="pas-<%= pas %>" draggable="true" ondragstart="drag(event, <%= pas %>)" onclick="openModal('passager-<%= pas %>', <%= reserva.getPasajeros() %>)" ondragover="" ></i>
                            <%
                            }
                            %>
                            </div>
                            <div class="bus">
                                <div class="wheel w-1"></div>
                                <div class="wheel w-2"></div>
                            <%
                            for(int asiento = 1; asiento < reserva.getViaje().getPlazas(); asiento++){

                                boolean ocupado = false;
                                for(int n = 1; n <= ocupados.size(); n++){
                                    if(asiento == ocupados.get(n)){
                                        ocupado = true;
                                    }
                                }

                                if(ocupado){
                                    %>
                                    <div class="chair busy" id="chair-<%= asiento %>"><span>OCUPADO</span></div>
                                    <%
                                }else{
                                    %>
                                    <div class="chair" id="chair-<%= asiento %>" ondrop="seleccionarAsiento(event, <%= asiento %>)" ondragover="allowDrop(event)"></div>
                                    <%
                                }

                            }
                            %>
                                <div class="wheel w-3"></div>
                                <div class="wheel w-4"></div>
                            </div>
                        </div>
                        
                        <button type="submit">Guardar pasajeros</button>
                    </form> 
                </div>
                     
                        

            </section>
            
        </main>

        <script>
            function compruebaDatos(form){

                var data = new FormData(form);
                var json = [];
                var error = false;
                var message = "";
                
                for(var i = 0; i < data.getAll("nombre[]").length; i++){
                    
                    var nombre = data.getAll("nombre[]")[i];
                    var apellidos = data.getAll("apellidos[]")[i];
                    var dni = data.getAll("dni[]")[i];
                    var asiento = data.getAll("asiento[]")[i];
                    
                    if(!validarDNI(dni)){
                        message = "El dni del pasajero '" + nombre + "' no es válido";
                        error = true;
                    }
                    if(parseInt(asiento) === 0 || isNaN(parseInt(asiento))){
                        message = "Debes arrastar y soltar el pasajero '" + nombre + "' en el asiento deseado";
                        error = true;
                    }
                    if(apellidos.length === 0){
                        message = "Debes introducir los apellidos del pasajero '" + nombre + "'";
                        error = true;
                    }
                    if(nombre.length === 0){
                        message = "Debes introducir el nombre del pasajero";
                        error = true;
                    }
                    
                    if(error){ break; } else {
                        json.push({
                            nombre: nombre,
                            apellidos: apellidos,
                            dni: dni,
                            asiento: asiento
                        });
                    }
                    
                }

                if(error){

                    Swal.fire({
                        title: 'Error!',
                        text: message,
                        icon: 'error',
                        confirmButtonText: 'Aceptar'
                    });
                    if(!document.getElementById("passager-" + (i+1)).classList.contains("show")){
                        openModal("passager-" + (i+1), data.getAll("nombre[]").length);
                    }
                    return false;

                }else{

                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (this.readyState === 4 && this.status === 200) {
                            
                            if(this.responseText.includes("OK")){
                                Swal.fire({
                                    title: 'PERFECTO',
                                    text: 'Los pasajeros han sido guardados. En breves serás redireccionado al resumen.',
                                    icon: 'success',
                                    confirmButtonText: 'Aceptar'
                                });
                                setTimeout(function(){
                                    location.href = "./resumen.jsp";
                                }, 4000);
                            }else{
                                Swal.fire({
                                    title: 'RESPUESTA SERVIDOR!',
                                    text: this.responseText,
                                    icon: 'info',
                                    confirmButtonText: 'Aceptar'
                                });
                            }
                            
                        }
                    };
                    xhttp.open("GET", "./guardarPasajeros?data=" + JSON.stringify(json), true);
                    xhttp.send();

                }

            }
            function validarDNI(dni){
                var numero, let, letra;
                var expresion_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;
                dni = dni.toUpperCase();
                if(expresion_regular_dni.test(dni) === true){
                    numero = dni.substr(0,dni.length-1);
                    numero = numero.replace('X', 0);
                    numero = numero.replace('Y', 1);
                    numero = numero.replace('Z', 2);
                    let = dni.substr(dni.length-1, 1);
                    numero = numero % 23;
                    letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
                    letra = letra.substring(numero, numero+1);
                    if (letra !== let) {
                        //alert('Dni erroneo, la letra del NIF no se corresponde');
                        return false;
                    }else{
                        //alert('Dni correcto');
                        return true;
                    }
                }else{
                    //alert('Dni erroneo, formato no válido');
                    return false;
                }
            }
        </script>
        
    </body>
</html>
