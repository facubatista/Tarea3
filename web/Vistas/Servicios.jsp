<%-- 
    Document   : Prueba
    Created on : 22/10/2016, 11:34:18 PM
    Author     : Kevin
--%>

<%@page import="webservices.DataServicio"%>
<%@page import="webservices.DataServicios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if(session.getAttribute("nickProveedor")==null){//Si no se inicio sesion, redirecciona a al servlet para verificar cookie de sesion
    response.sendRedirect("../ServletSesion?index");
}else{%>
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
                <h4>No se encontraron servicios</h4>
            </li>
            <%}else{
                for(int i=0; i < servicios.getServicios().size(); i++){
                    DataServicio s = servicios.getServicios().get(i);
                    String b64 = "";            
            %>
                <li class="list-group-item">
                    <%if(s.getImagenes().size()!=0 && s.getImagenes().get(0)!=null){
                        String[] imagenes = new String[s.getImagenes().size()];
                        for(int img=0; img<s.getImagenes().size(); img++){
                            imagenes[img] = javax.xml.bind.DatatypeConverter.printBase64Binary((byte[])s.getImagenes().get(img));
                        }
                        //b64 = javax.xml.bind.DatatypeConverter.printBase64Binary((byte[])s.getImagenes().get(0));
                        
                    %>
                        <div id="carousel<%= s.getNombre() %>" class="carousel slide" data-ride="carousel">
                            <!-- Indicadores -->
                            <ol class="carousel-indicators">
                                <!-- El primero imagen queda fuera del "for" porque indica la imagen a mostrar al principio, tiene la clase "active" -->
                                <li data-target="#carousel<%= s.getNombre() %>" data-slide-to="0" class="active"></li>
                                <%if(imagenes.length > 1){
                                    for(int aux =1; aux<imagenes.length; aux++){%>
                                <li data-target="carousel<%= s.getNombre() %>" data-slide-to="<%= aux %>"></li>
                                <%  }
                                }%>
                            </ol>

                            <!-- Contenedor de la imagenes -->
                            <div class="carousel-inner" role="listbox">
                                <!-- La primera imagen queda fuera del "for" porque es la que se muestra en al principio, tiene la clase "active" -->
                                <div class="item active">
                                    <img  src="data:image/jpg;base64, <%=imagenes[0]%>" class="img-responsive center-block img-rounded" style="width: 100%">
                                </div>
                            <%if(imagenes.length>1){
                                for(int aux =1; aux<imagenes.length; aux++){ %>
                                <div class="item">
                                    <img  src="data:image/jpg;base64, <%=imagenes[aux]%>" class="img-responsive center-block img-rounded" style="width: 100%">
                                </div>
                            <%  }
                            }%>
                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#carousel<%= s.getNombre() %>" role="button" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel<%= s.getNombre() %>" role="button" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                            </a>
                        </div>
                    
                    <%}else{%>
                    <div id="carousel<%= s.getNombre() %>" class="carousel slide" data-ride="carousel">
                            <!-- Indicadores -->
                            <ol class="carousel-indicators">
                                <!-- El primero imagen queda fuera del "for" porque indica la imagen a mostrar al principio, tiene la clase "active" -->
                                <li data-target="#carousel<%= s.getNombre() %>" data-slide-to="0" class="active"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <!-- La primera imagen queda fuera del "for" porque es la que se muestra en al principio, tiene la clase "active" -->
                                <div class="item active">
                                    <img src="/DispositivoMovil/Img/SinImagen.jpg" class="img-responsive center-block img-rounded" style="width: 100%">
                                </div>
                            </div>
                            <!-- Controles, derecha e izquierda -->
                            <a class="left carousel-control" href="#carousel<%= s.getNombre() %>" role="button" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel<%= s.getNombre() %>" role="button" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                            </a>
                    </div>
                    <%}%>
                    <h2><%= s.getNombre() %></h2>
                    <p class="text-justify"><%= s.getDescripcion() %></p>
                    <ul class="list-group" >
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h4>Precio: $<%= Math.round(s.getPrecio()) %></h4>
                        </li>
                        <%if(s.getDestino()!=null){%>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h4>Origen: <%= s.getOrigen() %></h4>
                        </li>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h4>Destino: <%= s.getDestino() %></h4>
                        </li>
                        <%}else{%>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h4>Ciudad: <%= s.getOrigen() %></h4>
                        </li>
                        <%}%>
                    </ul>
                </li>
            <%  }
            }%>
            </ul>
        </div>  
            
        <script src="/DispositivoMovil/JS/jQuery.js"></script>
        <script src="/DispositivoMovil/Bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
<%}%>