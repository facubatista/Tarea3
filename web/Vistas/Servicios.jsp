<%-- 
    Document   : Prueba
    Created on : 22/10/2016, 11:34:18 PM
    Author     : Kevin
--%>

<%@page import="webservices.DataServicio"%>
<%@page import="webservices.DataServicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Servicios</title>
        <link type="image/x-icon" rel="shortcut icon" href="/DispositivoMovil/Img/IconoH4T.ico">
        <link rel="stylesheet" href="/DispositivoMovil/Bootstrap/css/bootstrap.min.css">
    </head>
    <body style="padding-top: 65px">
        <!--El parametro que pasa en el include es para decirle que pestaña sombrear en el menu, indicando en que pagina se esta-->
        <jsp:include page="Cabecera.jsp?active=Servicios" />
        <div class="container">
            <ul class="list-group">
            <%
            DataServicios servicios = (DataServicios)session.getAttribute("serviciosDeP");
            if(servicios.getServicios().size()==0){
            %>
            <li class="list-group-item">
                <h3>No se encontraron servicios</h3>
            </li>
            <%}else{
                for(int i=0; i < servicios.getServicios().size(); i++){
                    DataServicio s = servicios.getServicios().get(i);
                    String b64 = "";            
            %>
                <li class="list-group-item">
                    <%if(s.getImagenes().size()!=0 && s.getImagenes().get(0)!=null){
                        b64 = javax.xml.bind.DatatypeConverter.printBase64Binary((byte[])s.getImagenes().get(0));
                    %>
                    <img  src="data:image/jpg;base64, <%=b64%>" class="img-responsive center-block img-rounded" style="width: 50%">
                    <%}else{%>
                    <img src="/DispositivoMovil/Img/SinImagen.jpg" class="img-responsive center-block img-rounded">
                    <%}%>
                    <h2><%= s.getNombre() %></h2>
                    <p class="text-justify"><%= s.getDescripcion() %></p>
                    <ul class="list-group" >
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h3>Precio: $<%= Math.round(s.getPrecio()) %></h3>
                        </li>
                        <%if(s.getDestino()!=null){%>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h3>Origen: <%= s.getOrigen() %></h3>
                        </li>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h3>Destino: <%= s.getDestino() %></h3>
                        </li>
                        <%}else{%>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h3>Ciudad: <%= s.getOrigen() %></h3>
                        </li>
                        <%}%>
                    </ul>
                </li>
            <%  }
            }%>
            </ul>
            <%--<ul class="list-group">
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
            </ul>--%>
        </div>  
            
        <script src="/DispositivoMovil/JS/jQuery.js"></script>
        <script src="/DispositivoMovil/Bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
