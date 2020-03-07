
// obtener destinos
function buscarDestino(idOrigen){
    var destino = document.getElementById("destino");
    if(idOrigen != ""){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            destino.innerHTML = this.responseText;
          }
        };
        xhttp.open("GET", "./obtenerDestino?id=" + idOrigen, true);
        xhttp.send();
    }else{
        destino.innerHTML = "";
    }
}

function openModal(id, max){
    var container = document.getElementById(id);
    for(var i = 1; i <= max; i++){
        
        var otherId = "passager-" + i;
        if(otherId === id){
            
            // pasajero actual
            if(container.classList.contains("show")){
                container.classList.add("hide");
                container.classList.remove("show");
            }else{
                container.classList.add("show");
                container.classList.remove("hide");
            }
            
        }else{
            
            // otros pasajeros
            var otherPassager = document.getElementById(otherId);
            if(otherPassager.classList.contains("show")){
                otherPassager.classList.remove("show");
                otherPassager.classList.add("hide");
            }
            
        }
        
    }
}


function tieneHijos(element){
    var count = 0;
    for(var i = 0; i < element.childNodes.length; i++){
        var child = element.childNodes[i];
        if(child.nodeName != "#text"){
            //console.log("HOLA: " + child.nodeName);
            count++;
        }
    }
    return (count > 0);
}


function ayuda(){
    Swal.fire({
        html: `
            <ul style="text-align:left; list-style-type:none; margin:10px 0 10px 0;">
                <li><strong>Cuenta Administrador: </strong></li>
                <li>Email: jefe@autobus.com</li>
                <li>Clave: 1234</li>
                <li style="margin-top:15px;"><strong>Cuentas Cliente: </strong></li>
                <li>Clave: 1234</li>
                <li style="margin-top:15px;"><strong>Rutas: </strong></li>
                <li>Albacete -> Madrid | 28-01-2020</li>
                <li>Madrid -> Albacete | 03-03-2020</li>
            </ul>
        `,
        showCloseButton: true,
        showCancelButton: false,
        showConfirmButton: false
    });
}
function login(){
    Swal.fire({
        title: 'Iniciar sesión',
        html: `
            <form class="text-left" method="post" action="./iniciarSesion">
                <input type="hidden" name="redirect" value="pagar.jsp">
                <div class="form-group">
                    <label for="email"><i class="fas fa-envelope"></i> Correo electrónico:</label>
                    <input class="form-control" type="text" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="password"><i class="fas fa-key"></i> Contraseña:</label>
                    <input class="form-control" type="password" id="password" name="password">
                </div>
                <div class="form-row justify-content-center">
                    <button class="btn btn-primary" type="submit"><i class="fas fa-sign-in-alt"></i> Entrar</button>
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
            <form class="text-left" method="post" action="./crearCuenta" id="registro-form">
                <input type="hidden" name="login" value="1">
                <input type="hidden" name="redirect" value="pagar.jsp?account-created=1">
                <div class="form-group">
                    <label for="email"><i class="fas fa-envelope"></i> Correo electrónico:</label>
                    <input class="form-control" type="email" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="password"><i class="fas fa-key"></i> Contraseña:</label>
                    <input class="form-control" type="password" id="password" name="password">
                </div>
                <div class="form-row">
                    <div class="form-group col">
                        <label for="nombre"><i class="fas fa-user"></i> Nombre:</label>
                        <input class="form-control" type="text" id="nombre" name="nombre">
                    </div>
                    <div class="form-group col">
                        <label for="apellidos"><i class="far fa-user"></i> Apellidos:</label>
                        <input class="form-control" type="text" id="apellidos" name="apellidos">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col">
                        <label for="dni"><i class="fas fa-id-card"></i> DNI:</label>
                        <input class="form-control" maxlength="9" size="10" type="text" id="dni" name="dni">
                    </div>
                    <div class="form-group col">
                        <label for="telefono"><i class="fas fa-phone"></i> Teléfono:</label>
                        <input class="form-control" size="10" maxlength="10" type="number" id="telefono" name="telefono">
                    </div>
                </div>
            </form>
        `,
        showCloseButton: true,
        showCancelButton: false,
        confirmButtonText: 'Registrarse'
    }).then(function(result){
        if(result.value){
            var formulario = document.getElementById("registro-form");
            if(validaDniRegistro()){
                formulario.submit();
            }else{
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'El DNI que has introducido no es válido'
                })
            }
        }
    });
    
    
}

function lostpw(){
    Swal.fire({
        title: 'Contraseña olvidada',
        text: 'hey',
        showCloseButton: true,
        showCancelButton: false,
        showConfirmButton: false
    });
}


function validaDniRegistro(){
    var dni = document.getElementById("dni");
    return validarDNI(dni.value);
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






// drag and drop

function allowDrop(ev) {
    var otro = document.getElementById(ev.target.id);
    if(otro.nodeName !== "I"){
        ev.preventDefault();
    }
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
  var pasajero = document.getElementById(ev.target.id);
  pasajero.classList.add("animate-test");
}

function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  var pasajero = document.getElementById(data);
  ev.target.appendChild(pasajero);
  pasajero.classList.remove("animate-test");
}

function cancelarAsiento(ev) {
    
    ev.preventDefault();
    var pasajeroId = ev.dataTransfer.getData("text");
    var pasajero = document.getElementById(pasajeroId);
    ev.target.appendChild(pasajero);
    pasajero.classList.remove("animate-test");
    
    var numPasajero = pasajero.getAttribute("numpasajero");
    var inputAsiento = document.getElementById("asiento-" + numPasajero);
    inputAsiento.type = "text";
    inputAsiento.value = "¡sin seleccionar!";
    
    compruebaAsientosOcupados();
    
}

function seleccionarAsiento(ev, numAsiento){
    
    ev.preventDefault();
    
    var asiento = ev.target;
    var pasajeroId = ev.dataTransfer.getData("text");
    var pasajero = document.getElementById(pasajeroId);
    pasajero.classList.remove("animate-test");
    
    asiento.appendChild(pasajero);
    asiento.classList.add("busy");
    asiento.setAttribute("ondragover", "");
    
    var numPasajero = pasajero.getAttribute("numpasajero");
    var inputAsiento = document.getElementById("asiento-" + numPasajero);
    inputAsiento.type = "number";
    inputAsiento.value = numAsiento;
    
    // esto por si cambia de asiento
    // en vez de seleccionar directamente
    compruebaAsientosOcupados();
    
}


function compruebaAsientosOcupados(){
    var chair = document.getElementsByClassName("chair");
    for(var i = 0; i < chair.length; i++){
        var chairChild = chair[i].childNodes;
        var ocupado = false;
        for(var j = 0; j < chairChild.length; j++){
            if(chairChild[j].nodeName === "I"){
               //console.log(chairChild[j].nodeName);
                ocupado = true;
            }
        }
        if(!ocupado){
            if(!chair[i].classList.contains("disabled")){
                chair[i].classList.remove("busy");
                chair[i].setAttribute("ondragover", "allowDrop(event)");
                //console.log("SE HA LIBERDO LA SILLA -->");
                //console.log(chair[i]);
            }
        }
    }
}



