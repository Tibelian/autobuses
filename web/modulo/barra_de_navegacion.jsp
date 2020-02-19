
<%@page import="POJOS.Cliente"%>
<nav class="navbar navbar-expand-lg navbar-light bg-white">
    <a class="navbar-brand" href="./inicio.jsp">AutoBus</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNavBar" aria-controls="mainNavBar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNavBar">
        <ul class="ml-auto navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-question-circle"></i> Ayuda</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-globe"></i> Idioma
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Español</a>
                    <a class="dropdown-item" href="#">English</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user"></i> Mi cuenta
                </a>
                <div class="dropdown-menu">
                    <%
                    if(session.getAttribute("cliente") != null){
                        Cliente cliente = (Cliente) session.getAttribute("cliente");
                    %>
                    <div class="text-center p-2">
                        ¡Hola <%= cliente.getNombre() %>!
                    </div>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="./usuario-panel.jsp">Panel usuario</a>
                    <a class="dropdown-item" href="./usuario-ajustes.jsp">Ajustes</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="./cerrarSesion">Cerrar sesión</a>
                    <%
                    }else{
                    %>
                    <a class="dropdown-item" href="#" onclick="login()">Iniciar sesión</a>
                    <a class="dropdown-item" href="#" onclick="registro()">Crear cuenta</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" onclick="lostpw()">He olvidado mi clave</a>
                    <%
                    }
                    %>
                </div>
            </li>
        </ul>
        <button onclick="alert('¿Por qué lo has hecho?')" class="btn btn-outline-primary my-2 my-sm-0" type="submit">Localizador</button>
    </div>
</nav>