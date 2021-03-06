
<%@page import="POJOS.Administrador"%>
<%@page import="POJOS.Cliente"%>
<%
    Object usuario = null;
    if(session.getAttribute("cliente") != null){
        usuario = (Cliente) session.getAttribute("cliente");
    }
    if(session.getAttribute("administrador") != null){
        usuario = (Administrador) session.getAttribute("administrador");
    }
%>
<nav class="navbar navbar-expand-lg navbar-light bg-white">
    <a class="navbar-brand" href="./inicio.jsp">AutoBus</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNavBar" aria-controls="mainNavBar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNavBar">
        <ul class="ml-auto navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="ayuda()"><i class="fas fa-question-circle"></i> Ayuda</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-globe"></i> Idioma
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Espa�ol</a>
                    <a class="dropdown-item" href="#">English</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user"></i> Mi cuenta
                </a>
                <div class="dropdown-menu">
                    <%
                    if(usuario != null){
                        String nombre = "";
                        if(usuario instanceof Cliente){
                            nombre = ((Cliente)usuario).getNombre();
                        }else{
                            nombre = ((Administrador)usuario).getEmail();
                        }
                    %>
                    <div class="text-center p-2">
                        �Hola <%= nombre %>!
                    </div>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="./usuario-panel.jsp">Panel usuario</a>
                    <%
                    if(usuario instanceof Administrador){
                    %>
                    <a class="dropdown-item" href="./admin/">Panel admin</a>
                    <%
                    }
                    %>
                    <a class="dropdown-item" href="./usuario-ajustes.jsp">Ajustes</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="./cerrarSesion">Cerrar sesi�n</a>
                    <%
                    }else{
                    %>
                    <a class="dropdown-item" href="#" onclick="login()">Iniciar sesi�n</a>
                    <a class="dropdown-item" href="#" onclick="registro()">Crear cuenta</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" onclick="lostpw()">He olvidado mi clave</a>
                    <%
                    }
                    %>
                </div>
            </li>
        </ul>
        <a href="./localizador.jsp" class="btn btn-outline-primary my-2 my-sm-0">Localizador</a>
    </div>
</nav>