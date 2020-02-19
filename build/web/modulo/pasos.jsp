
<%
String pagina = "";
if(session.getAttribute("pagina") != null){
    pagina = (String)session.getAttribute("pagina");
}else{
    return;
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col mx-auto mt-3 p-3">
    <div class="navigation">
        <ul>
            <li><a href="./inicio.jsp"><i class="fas fa-home"></i></a></li>
            <li><a <% if(pagina.equals("viajes.jsp")){out.print("class='active'");} %> href="./viajes.jsp"><span>1</span> Viaje</a></li>
            <li><a <% if(pagina.equals("pasajeros.jsp")){out.print("class='active'");} %> href="./pasajeros.jsp"><span>2</span> Pasajeros</a></li>
            <li><a <% if(pagina.equals("resumen.jsp")){out.print("class='active'");} %> href="./resumen.jsp"><span>3</span> Resumen</a></li>
            <li><a <% if(pagina.equals("pagar.jsp")){out.print("class='active'");} %> href="./pagar.jsp"><span>4</span> Pago</a></li>
            <li><a <% if(pagina.equals("completado.jsp")){out.print("class='active'");} %> href="./completado.jsp"><span>5</span> Completado</a></li>
        </ul>
    </div>
</div>