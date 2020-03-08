<%@page import="POJOS.Cliente"%>
<%
if(session.getAttribute("cliente") == null){
    response.sendRedirect("./error.jsp?code=Debes iniciar sesión como cliente para entrar al panel del usuario");
    return;
}
Cliente cliente = (Cliente) session.getAttribute("cliente");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/all.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/blue-style.css"/>
        <title>Configura tu cuenta - AutoBus</title>
    </head>
    <body>
        
        <!-- barra de navegación -->
        <header class="container-fuild">
            <jsp:include page="./modulo/barra_de_navegacion.jsp" />
        </header>
        
        <!-- contenido principal -->
        <main class="container-fluid">
            <section class="row flex-column align-items-center justify-content-center">
                <h1 class="mt-4">Configuración de cuenta</h1>
                <div class="col-6 bg-white shadow rounded p-4 my-3">         
                    <form method="POST" action="#">
                        <div class="form-row">
                            <div class="form-group col">
                                <label for="nombre"><i class="fas fa-user"></i> Nombre:</label>
                                <input type="text" maxlength="32" class="form-control" id="nombre" name="nombre" value="<%= cliente.getNombre() %>" required>
                            </div>
                            <div class="form-group col">
                                <label for="apellidos"><i class="far fa-user"></i> Apellidos:</label>
                                <input type="text" maxlength="32" class="form-control" id="apellidos" name="apellidos" value="<%= cliente.getApellidos()%>" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col">
                                <label for="dni"><i class="fas fa-id-card"></i> DNI:</label>
                                <input type="text" maxlength="9" class="form-control" id="dni" name="dni" value="<%= cliente.getDni()%>" required>
                            </div>
                            <div class="form-group col">
                                <label for="telefono"><i class="fas fa-phone"></i> Teléfono:</label>
                                <input type="text" maxlength="11" class="form-control" id="telefono" name="telefono" value="<%= cliente.getTelefono()%>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password"><i class="fas fa-key"></i> Introduzca otra vez su contraseña para confirmar los cambios:</label>
                            <input type="text" class="form-control" id="password" name="password" required autocomplete="off">
                        </div>
                        <div class="d-flex">
                            <button type="submit" class="mx-auto btn btn-primary"><i class="fas fa-save"></i> Guardar cambios</button>
                        </div>
                    </form>
                </div>
            </section>
        </main>
                                            
        <script src="./assets/js/jquery-3.4.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/sweetalert2@9.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>
