<%-- 
    Document   : Reservas
    Created on : 25/10/2016, 02:00:41 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/DispositivoMovil/Bootstrap/css/bootstrap.min.css">
        <title>Reservas</title>
    </head>
    <body style="padding-top: 65px">
        <%
        String nomProv = "";
        if(session.getAttribute("nickProveedor")!=null){
            nomProv = (String) session.getAttribute("nickProveedor");
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
                    <li><a href="/DispositivoMovil/ServletServProm?Servicios=true">Servicios</a></li>
                    <li><a href="#about">Promociones</a></li>
                    <li class="active"><a href="/DispositivoMovil/ServletReservas?verReservas=true">Reservas</a></li>
                    <li>
                        <a href="/DispositivoMovil/ServletSesion?cerrarSesion=true">
                            Salir
                            <img src="/DispositivoMovil/Img/logout.png" alt="imagen logoutusuario" class="img-responsive" style="width:20px;float:left;margin-right: 5px;">
                        </a>
                    </li>
                  </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container" >
            <h2 class="form-signin-heading text-center">Reservas del proveedor</h2>
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading clearfix">
                        <h4 class="pull-left">Reserva 1</h4>
                        <button type="button" class="btn btn-primary pull-right">Facturar</button>
                    </div>
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <h5>Servicio</h5>
                            </li>
                            <li class="list-group-item">
                                <h5>Servicio2</h5>
                            </li>
                            <li class="list-group-item">
                                <h5>Servicio3</h5>
                            </li>
                            <li class="list-group-item">
                                <h5>Servicio4</h5>
                            </li>
                        </ul>   
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading clearfix">
                        <h4 class="pull-left">Reserva 2</h4>
                        <button class="btn btn-primary pull-right">Facturar</button>
                    </div>
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <h5>Servicio</h5>
                            </li>
                            <li class="list-group-item">
                                <h5>Servicio2</h5>
                            </li>
                            <li class="list-group-item">
                                <h5>Servicio3</h5>
                            </li>
                            <li class="list-group-item">
                                <h5>Servicio4</h5>
                            </li>
                        </ul>   
                    </div>
                </div>
            </div>
        </div>
        
        <script src="/DispositivoMovil/JS/jQuery.js"></script>
        <script src="/DispositivoMovil/Bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
