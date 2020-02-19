
<nav class="navbar navbar-expand-lg navbar-light bg-white">
    <a class="navbar-brand" href="#">AutoBus</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNavBar" aria-controls="mainNavBar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="ml-auto navbar-nav   ">
            <li class="nav-item active">
                <a class="nav-link" href="#">Inicio</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="langDropdown" role="button" data-toggle="langDropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-globe"></i> Idioma
                </a>
                <div class="dropdown-menu" aria-labelledby="langDropdown">
                    <a class="dropdown-item" href="#">Español</a>
                    <a class="dropdown-item" href="#">English</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" role="button" data-toggle="accountDropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user"></i> Mi cuenta
                </a>
                <div class="dropdown-menu" aria-labelledby="accountDropdown">
                    <a class="dropdown-item" href="#">Iniciar sesión</a>
                    <a class="dropdown-item" href="#">Crear cuenta</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">He olvidado mi clave</a>
                </div>
            </li>
        </ul>
        <button onclick="alert('¿Por qué lo has hecho?')" class="btn btn-outline-primary my-2 my-sm-0" type="submit">No hagas click</button>
    </div>
</nav>