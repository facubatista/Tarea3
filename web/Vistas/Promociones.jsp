<%@page import="webservices.WSProveedores"%>
<%@page import="webservices.WSProveedoresService"%>
<%@page import="webservices.DataPromocion"%>
<%@page import="webservices.DataPromociones"%>
<%@page import="webservices.DataServicio"%>
<%@page import="webservices.DataServicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Promociones</title>
        <link type="image/x-icon" rel="shortcut icon"  href="/DispositivoMovil/Img/IconoH4T.ico">
        <link rel="stylesheet" href="/DispositivoMovil/Bootstrap/css/bootstrap.min.css">
    </head>
    <body style="padding-top: 65px">
        <jsp:include page="Cabecera.jsp?active=Promociones" />
        <div class="container">
            <ul class="list-group">
            <%
            DataPromociones promos = (DataPromociones)session.getAttribute("promosDeP");
            if(promos.getPromociones().size()==0){
            %>
            <li class="list-group-item">
                <h3>No se encontraron promociones</h3>
            </li>
            <%}else{
                for(int i=0; i < promos.getPromociones().size(); i++){
                    DataPromocion p = promos.getPromociones().get(i);
                    String b64 = "";

                    WSProveedores wsp = (WSProveedores) request.getAttribute("webServiceP");
                    DataServicio s = wsp.seleccionarServicioAListar(p.getProveedor(), p.getServicios().get(0));
            %>
                <li class="list-group-item">
                    <%if(s.getImagenes().size()!=0 && s.getImagenes().get(0)!=null){
                        b64 = javax.xml.bind.DatatypeConverter.printBase64Binary((byte[])s.getImagenes().get(0));
                    %>
                    <img  src="data:image/jpg;base64, <%=b64%>" class="img-responsive center-block img-rounded" style="width: 50%">
                    <%}else{%>
                    <img src="/DispositivoMovil/Img/SinImagen.jpg" class="img-responsive center-block img-rounded">
                    <%}%>
                    <h2><%= p.getNombre() %></h2>
                    <p class="text-justify"><%= s.getDescripcion() %></p>
                    <ul class="list-group" >
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h3>Descuento: %<%= Math.round(p.getPorcentaje()) %></h3>
                        </li>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h3>Total: $<%= Math.round(p.getTotal()) %></h3>
                        </li>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            
                            <ul class="list-group" >
                                <li class="list-group-item active" style="border-color: #337AB7;">
                                    <h3>Servicios</h3>
                                </li>
                                <%for(int aux=0; aux<p.getServicios().size(); aux++){%>
                                <li class="list-group-item " style="border-color: #337AB7;">
                                    <h3><%= p.getServicios().get(aux) %></h3>
                                </li>
                                <%}%>
                            </ul>
                        </li>
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
