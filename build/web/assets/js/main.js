
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
            <form class="text-left" method="post" action="./crearCuenta">
                <input type="hidden" name="login" value="1">
                <input type="hidden" name="redirect" value="pagar.jsp?account-created=1">
                <div class="form-group">
                    <label for="email"><i class="fas fa-envelope"></i> Correo electrónico:</label>
                    <input class="form-control" type="text" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="password"><i class="fas fa-key"></i> Contraseña:</label>
                    <input class="form-control" type="password" id="password" name="password">
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="nombre"><i class="fas fa-user"></i> Nombre:</label>
                        <input class="form-control" type="text" id="nombre" name="nombre">
                    </div>
                    <div class="form-group">
                        <label for="apellidos"><i class="far fa-user"></i> Apellidos:</label>
                        <input class="form-control" type="text" id="apellidos" name="apellidos">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="dni"><i class="fas fa-id-card"></i> DNI:</label>
                        <input class="form-control" onchange="validarRegistroDni()" type="text" id="dni" name="dni">
                    </div>
                    <div class="form-group">
                        <label for="telefono"><i class="fas fa-phone"></i> Teléfono:</label>
                        <input class="form-control" type="number" id="telefono" name="telefono">
                    </div>
                </div>
                <div class="form-row justify-content-center">
                    <button class="btn btn-primary" type="submit"><i class="fas fa-user-plus"></i> Registrarse</button>
                </div>
            </form>
        `,
        showCloseButton: true,
        showCancelButton: false,
        showConfirmButton: false
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
            chair[i].classList.remove("busy");
            chair[i].setAttribute("ondragover", "allowDrop(event)");
            //console.log("SE HA LIBERDO LA SILLA -->");
            //console.log(chair[i]);
        }
    }
}



