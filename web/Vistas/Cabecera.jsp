<%
    String nomProv = "";
    if(session.getAttribute("nomProveedor")!=null){
        nomProv = (String) session.getAttribute("nomProveedor");
    } 
%>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">Bienvenido <%=nomProv%></a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="/DispositivoMovil/ServletServProm?Servicios=true">Servicios</a></li>
                <li><a href="#about">Promociones</a></li>
                <li><a href="/DispositivoMovil/ServletReservas?verReservas=true">Reservas</a></li>
                <li><a href="/DispositivoMovil/ServletSesion?cerrarSesion=true">Salir</a></li>
              </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
