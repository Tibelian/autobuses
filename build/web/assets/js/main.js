
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

















// drag and drop

function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
}

function cancelarAsiento(ev) {
    
    ev.preventDefault();
    var pasajeroId = ev.dataTransfer.getData("text");
    var pasajero = document.getElementById(pasajeroId);
    ev.target.appendChild(pasajero);
    
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



