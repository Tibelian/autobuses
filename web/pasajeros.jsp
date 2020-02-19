
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

if(reserva.getViaje() == null){
    response.sendRedirect((String)session.getAttribute("pagina"));
    return;
}

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
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
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
            
            <!-- listado con asientos y pasajeros -->
            <section class="row justify-content-center"> 
                <div class="col-12 p-3">
                    <h3 class="text-center">
                        <span class="badge badge-secondary mb-2"><%= reserva.getRuta().getPrecio() %> € </span>
                        <span class="badge badge-secondary mb-2"><%= laFecha %></span><br>
                        <span class="badge badge-info">
                            <%= reserva.getRuta().getEstacionByIdOrigen().getNombre() %> 
                            <i class="fas fa-arrow-right"></i> 
                            <%= reserva.getRuta().getEstacionByIdDestino().getNombre() %>
                        </span>
                    </h3>
                </div>
                <div class="col-md-9 p-2 mb-3">
                    <div class="row justify-content-center">
                        <p class="col-md-8 text-center">
                            <i class="fas fa-info-circle"></i>
                            A continuación, por favor arrastre el pasajero en el asiento que usted desea. Para introducir los datos del pasajero debe hacer click encima suya.
                        </p>
                        <form id="pasajeros-form" onsubmit="compruebaDatos(this); return false;" method="post" action="#">
                            <%
                            for(int i = 1; i <= reserva.getPasajeros(); i++){
                            %>
                            <div class="passager">
                                <div class="passager-data hide" id="passager-<%= i %>">
                                    <button type="button" class="close" onclick="openModal('passager-<%= i %>', <%= reserva.getPasajeros() %>)"><i class="fas fa-times"></i></button>
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <div class="input-group">
                                                <label class="input-group-prepend" for="nombre-<%= i %>"><span class="input-group-text"><i class="far fa-user"></i>&nbsp;</span></label>
                                                <input class="form-control" placeholder="Nombre" type="text" id="nombre-<%= i %>" name="nombre[]">
                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <div class="input-group">
                                                <label class="input-group-prepend" for="apellidos-<%= i %>"><span class="input-group-text"><i class="fas fa-user"></i>&nbsp;</span></label>
                                                <input class="form-control" placeholder="Apellidos" type="text" id="apellidos-<%= i %>" name="apellidos[]">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <div class="input-group">
                                                <label class="input-group-prepend" for="dni-<%= i %>"><span class="input-group-text"><i class="fas fa-id-card"></i>&nbsp;</span></label>
                                                <input maxlength="9" class="form-control" placeholder="DNI / NIE" type="text" id="dni-<%= i %>" name="dni[]">
                                            </div>
                                        </div>
                                        <div class="form-group col">
                                            <div class="input-group">
                                                <label class="input-group-prepend" for="asiento-<%= i %>"><span class="input-group-text"><i class="fas fa-chair"></i>&nbsp;</span></label>
                                                <input class="form-control" type="text" readonly id="asiento-<%= i %>" name="asiento[]" value="¡asiento sin seleccionar!">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%  
                            }
                            %>

                            <!-- el autobus con sus asientos y pasajeros -->
                            <div class="drag-and-drop">
                                <div id="contenedor-pasajeros" class="icons" ondrop="cancelarAsiento(event)" ondragover="allowDrop(event)">
                                <%
                                for(int pas = 1; pas <= reserva.getPasajeros(); pas++){
                                %>
                                <i class="fas fa-male fa-3x" numpasajero="<%= pas %>" id="pas-<%= pas %>" draggable="true" ondragstart="drag(event)" onclick="openModal('passager-<%= pas %>', <%= reserva.getPasajeros() %>)" ondragover="" ></i>
                                <%
                                }
                                %>
                                </div>
                                <div class="bus" style="width: calc(55px * <%= reserva.getViaje().getPlazas() %>)">
                                    <div class="wheel w-1"></div>
                                    <div class="wheel w-2"></div>
                                <%
                                for(int asiento = 1; asiento <= reserva.getViaje().getPlazas(); asiento++){

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

                            <button class="w-100 btn btn-primary" type="submit">Guardar pasajeros</button>
                        </form> 
                    </div>
                </div>
            </section>
            
        </main>

        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/main.js"></script>
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
                                    text: 'Los pasajeros han sido guardados',
                                    icon: 'success',
                                    confirmButtonText: 'Siguiente'
                                }).then(() => {
                                    location.href = "./resumen.jsp";
                                });
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
