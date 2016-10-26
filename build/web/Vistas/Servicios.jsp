<%-- 
    Document   : Prueba
    Created on : 22/10/2016, 11:34:18 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/DispositivoMovil/Bootstrap/css/bootstrap.min.css">
    </head>
    <body style="padding-top: 65px">
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
        <div class="container">      
            <ul class="list-group">
                <li class="list-group-item">
                    <img src="/DispositivoMovil/Img/SinImagen.jpg" class="img-responsive center-block img-rounded">
                    <h2>Servicio</h2>
                    <p class="text-justify">     
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non dui sed lacus congue aliquet. Praesent ut vulputate ipsum. Etiam vel metus congue, dapibus neque quis, aliquet nisl. Nulla facilisi. Pellentesque sem ipsum, porta ut accumsan eget, laoreet vel purus. Mauris non tempor diam, nec dictum nisl. Nam luctus sapien quis massa ultricies consectetur ac vitae ante. Suspendisse vel metus urna. Cras a vulputate est. Fusce ac augue non odio finibus semper nec eu elit. Proin vitae justo luctus, faucibus lorem ut, ullamcorper enim. Suspendisse at massa quis risus malesuada aliquet. Quisque aliquet nec est a faucibus. Nam non lorem ut nulla rhoncus vehicula.
                        Morbi ut mattis tellus. Fusce porta faucibus sagittis. Praesent lacinia elit luctus ornare semper. Aenean eu nunc laoreet, tristique enim pulvinar, efficitur nulla. Aenean mollis, augue nec fringilla elementum, felis arcu consectetur turpis, a ultricies lacus arcu in arcu. Maecenas rhoncus pharetra laoreet. Integer purus odio, feugiat vitae aliquam eu, elementum vel tortor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque libero lorem, volutpat et bibendum in, elementum eu mi. Donec quam sem, dapibus at facilisis quis, tempor quis libero. Sed maximus at arcu eget malesuada. Maecenas in leo sed arcu placerat fringilla ut vitae sem. Cras ac mauris condimentum felis aliquam finibus. Nunc ac lorem a nisi placerat aliquam id nec dui. Integer porttitor, lorem nec fermentum malesuada, tortor libero faucibus metus, maximus scelerisque nisi purus eget nunc.
                        Etiam mauris enim, placerat sit amet pretium at, bibendum at neque. Vivamus id posuere erat. Phasellus a fringilla nibh. Integer ut nibh quis eros ullamcorper fermentum. Curabitur dignissim dolor at leo cursus suscipit. Vestibulum imperdiet porttitor magna. Morbi tristique mattis cursus. Praesent nec nisi et sapien efficitur porttitor et nec felis.
                    </p>
                </li>
                <li class="list-group-item">
                    <img src="/DispositivoMovil/Img/SinImagen.jpg" class="img-responsive center-block img-rounded">
                    <h2>Servicio2</h2>
                    <p class="text-justify">     
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non dui sed lacus congue aliquet. Praesent ut vulputate ipsum. Etiam vel metus congue, dapibus neque quis, aliquet nisl. Nulla facilisi. Pellentesque sem ipsum, porta ut accumsan eget, laoreet vel purus. Mauris non tempor diam, nec dictum nisl. Nam luctus sapien quis massa ultricies consectetur ac vitae ante. Suspendisse vel metus urna. Cras a vulputate est. Fusce ac augue non odio finibus semper nec eu elit. Proin vitae justo luctus, faucibus lorem ut, ullamcorper enim. Suspendisse at massa quis risus malesuada aliquet. Quisque aliquet nec est a faucibus. Nam non lorem ut nulla rhoncus vehicula.
                        Morbi ut mattis tellus. Fusce porta faucibus sagittis. Praesent lacinia elit luctus ornare semper. Aenean eu nunc laoreet, tristique enim pulvinar, efficitur nulla. Aenean mollis, augue nec fringilla elementum, felis arcu consectetur turpis, a ultricies lacus arcu in arcu. Maecenas rhoncus pharetra laoreet. Integer purus odio, feugiat vitae aliquam eu, elementum vel tortor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque libero lorem, volutpat et bibendum in, elementum eu mi. Donec quam sem, dapibus at facilisis quis, tempor quis libero. Sed maximus at arcu eget malesuada. Maecenas in leo sed arcu placerat fringilla ut vitae sem. Cras ac mauris condimentum felis aliquam finibus. Nunc ac lorem a nisi placerat aliquam id nec dui. Integer porttitor, lorem nec fermentum malesuada, tortor libero faucibus metus, maximus scelerisque nisi purus eget nunc.
                        Etiam mauris enim, placerat sit amet pretium at, bibendum at neque. Vivamus id posuere erat. Phasellus a fringilla nibh. Integer ut nibh quis eros ullamcorper fermentum. Curabitur dignissim dolor at leo cursus suscipit. Vestibulum imperdiet porttitor magna. Morbi tristique mattis cursus. Praesent nec nisi et sapien efficitur porttitor et nec felis.
                    </p>
                </li>
                <li class="list-group-item">
                    <img src="/DispositivoMovil/Img/SinImagen.jpg" class="img-responsive center-block img-rounded">
                    <h2>Servicio3</h2>
                    <p class="text-justify">     
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non dui sed lacus congue aliquet. Praesent ut vulputate ipsum. Etiam vel metus congue, dapibus neque quis, aliquet nisl. Nulla facilisi. Pellentesque sem ipsum, porta ut accumsan eget, laoreet vel purus. Mauris non tempor diam, nec dictum nisl. Nam luctus sapien quis massa ultricies consectetur ac vitae ante. Suspendisse vel metus urna. Cras a vulputate est. Fusce ac augue non odio finibus semper nec eu elit. Proin vitae justo luctus, faucibus lorem ut, ullamcorper enim. Suspendisse at massa quis risus malesuada aliquet. Quisque aliquet nec est a faucibus. Nam non lorem ut nulla rhoncus vehicula.
                        Morbi ut mattis tellus. Fusce porta faucibus sagittis. Praesent lacinia elit luctus ornare semper. Aenean eu nunc laoreet, tristique enim pulvinar, efficitur nulla. Aenean mollis, augue nec fringilla elementum, felis arcu consectetur turpis, a ultricies lacus arcu in arcu. Maecenas rhoncus pharetra laoreet. Integer purus odio, feugiat vitae aliquam eu, elementum vel tortor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque libero lorem, volutpat et bibendum in, elementum eu mi. Donec quam sem, dapibus at facilisis quis, tempor quis libero. Sed maximus at arcu eget malesuada. Maecenas in leo sed arcu placerat fringilla ut vitae sem. Cras ac mauris condimentum felis aliquam finibus. Nunc ac lorem a nisi placerat aliquam id nec dui. Integer porttitor, lorem nec fermentum malesuada, tortor libero faucibus metus, maximus scelerisque nisi purus eget nunc.
                        Etiam mauris enim, placerat sit amet pretium at, bibendum at neque. Vivamus id posuere erat. Phasellus a fringilla nibh. Integer ut nibh quis eros ullamcorper fermentum. Curabitur dignissim dolor at leo cursus suscipit. Vestibulum imperdiet porttitor magna. Morbi tristique mattis cursus. Praesent nec nisi et sapien efficitur porttitor et nec felis.
                    </p>
                </li>
                <li class="list-group-item">
                    <img src="/DispositivoMovil/Img/SinImagen.jpg" class="img-responsive center-block img-rounded" >
                    <h2>Servicio4</h2>
                    <p class="text-justify">     
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non dui sed lacus congue aliquet. Praesent ut vulputate ipsum. Etiam vel metus congue, dapibus neque quis, aliquet nisl. Nulla facilisi. Pellentesque sem ipsum, porta ut accumsan eget, laoreet vel purus. Mauris non tempor diam, nec dictum nisl. Nam luctus sapien quis massa ultricies consectetur ac vitae ante. Suspendisse vel metus urna. Cras a vulputate est. Fusce ac augue non odio finibus semper nec eu elit. Proin vitae justo luctus, faucibus lorem ut, ullamcorper enim. Suspendisse at massa quis risus malesuada aliquet. Quisque aliquet nec est a faucibus. Nam non lorem ut nulla rhoncus vehicula.
                        Morbi ut mattis tellus. Fusce porta faucibus sagittis. Praesent lacinia elit luctus ornare semper. Aenean eu nunc laoreet, tristique enim pulvinar, efficitur nulla. Aenean mollis, augue nec fringilla elementum, felis arcu consectetur turpis, a ultricies lacus arcu in arcu. Maecenas rhoncus pharetra laoreet. Integer purus odio, feugiat vitae aliquam eu, elementum vel tortor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque libero lorem, volutpat et bibendum in, elementum eu mi. Donec quam sem, dapibus at facilisis quis, tempor quis libero. Sed maximus at arcu eget malesuada. Maecenas in leo sed arcu placerat fringilla ut vitae sem. Cras ac mauris condimentum felis aliquam finibus. Nunc ac lorem a nisi placerat aliquam id nec dui. Integer porttitor, lorem nec fermentum malesuada, tortor libero faucibus metus, maximus scelerisque nisi purus eget nunc.
                        Etiam mauris enim, placerat sit amet pretium at, bibendum at neque. Vivamus id posuere erat. Phasellus a fringilla nibh. Integer ut nibh quis eros ullamcorper fermentum. Curabitur dignissim dolor at leo cursus suscipit. Vestibulum imperdiet porttitor magna. Morbi tristique mattis cursus. Praesent nec nisi et sapien efficitur porttitor et nec felis.
                    </p>
                </li>
            </ul>
        </div>  
            
        <script src="/DispositivoMovil/JS/jQuery.js"></script>
        <script src="/DispositivoMovil/Bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
