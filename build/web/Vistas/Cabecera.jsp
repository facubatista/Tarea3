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
                <!--Con los if se fija en que pagina esta para saber que pestaña del menu sombrear-->
                <%if(request.getParameter("active").equals("Servicios")){%>
                <li class="active"><a href="/DispositivoMovil/ServletServProm?Servicios=true">Servicios</a></li>
                <%}else{%>
                <li ><a href="/DispositivoMovil/ServletServProm?Servicios=true">Servicios</a></li>
                <%}%>
                <%if(request.getParameter("active").equals("Promociones")){%>
                <li class="active"><a href="/DispositivoMovil/ServletServProm?Promociones=true">Promociones</a></li>
                <%}else{%>
                <li><a href="/DispositivoMovil/ServletServProm?Promociones=true">Promociones</a></li>
                <%}%>
                <%if(request.getParameter("active").equals("Reservas")){%>
                <li class="active"><a href="/DispositivoMovil/ServletReservas?verReservas=true">Reservas</a></li>
                <%}else{%>
                <li><a href="/DispositivoMovil/ServletReservas?verReservas=true">Reservas</a></li>
                <%}%>
                <li>
                    <!--<img src="/DispositivoMovil/Img/logout.png" alt="imagen logoutusuario" class="img-responsive">-->
                    <a href="/DispositivoMovil/ServletSesion?cerrarSesion=true">
                        <img src="/DispositivoMovil/Img/logout.png" alt="imagen logoutusuario" class="img-responsive" style="width:20px;float:left;margin-right: 5px;">
                        Salir
                    </a>
                </li>
              </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
