
<%
String pagina = "";
if(session.getAttribute("pagina") != null){
    pagina = (String)session.getAttribute("pagina");
}else{
    return;
}
int paso = 1;
if(pagina.equals("viajes.jsp")){
    paso = 2;
}else if(pagina.equals("pasajeros.jsp")){
    paso = 3;
}else if(pagina.equals("resumen.jsp")){
    paso = 4;
}else if(pagina.equals("pagar.jsp")){
    paso = 5;
}else if(pagina.equals("completado.jsp")){
    paso = 6;
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col mx-auto mt-3 p-3">
    <div class="w-100 d-flex justify-content-center">
        <ul class="progressbar">
            <li class="active"><a href="./inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
            <li <% if(paso > 1){out.print("class='active'");} %>><a href="./viajes.jsp"><i class="fas fa-bus"></i> Viajes</a></li>
            <li <% if(paso > 2){out.print("class='active'");} %>><a href="./pasajeros.jsp"><i class="fas fa-users"></i> Pasajeros</a></li>
            <li <% if(paso > 3){out.print("class='active'");} %>><a href="./resumen.jsp"><i class="fas fa-file-alt"></i> Resumen</a></li>
            <li <% if(paso > 4){out.print("class='active'");} %>><a href="./pagar.jsp"><i class="fas fa-coins"></i> Pago</a></li>
            <li <% if(paso > 5){out.print("class='active big'");} %>><a href="./completado.jsp"><i class="fas fa-thumbs-up"></i> Completado</a></li>
        </ul>
    </div>
</div>