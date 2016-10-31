<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                <h4>No se encontraron promociones</h4>
            </li>
            <%}else{
                for(int i=0; i < promos.getPromociones().size(); i++){
                    DataPromocion p = promos.getPromociones().get(i);
                    String b64 = "";

                    WSProveedores wsp = (WSProveedores) request.getAttribute("webServiceP");
                    
            %>
                <li class="list-group-item">
                    <%
                    DataServicio primerS = wsp.seleccionarServicioAListar(p.getProveedor(), p.getServicios().get(0));
                    List <String> listaImgProm = new ArrayList<>();
                    for(int aux=0; aux < p.getServicios().size() ; aux++){
                        DataServicio s = wsp.seleccionarServicioAListar(p.getProveedor(), p.getServicios().get(aux));
                        for(int img=0; img<s.getImagenes().size(); img++){
                            //Se pasa la imagen a Base64 y se agrega a la lista de imagenes
                            listaImgProm.add(javax.xml.bind.DatatypeConverter.printBase64Binary((byte[])s.getImagenes().get(img)));
                        }
                    }
                    %>
                    <%if(listaImgProm.size()>0){%>
                    <div id="carousel<%= p.getNombre() %>" class="carousel slide" data-ride="carousel">
                            <!-- Indicadores -->
                            <ol class="carousel-indicators">
                                <!-- El primero imagen queda fuera del "for" porque indica la imagen a mostrar al principio, tiene la clase "active" -->
                                <li data-target="#carousel<%= p.getNombre() %>" data-slide-to="0" class="active"></li>
                                <%if(listaImgProm.size() > 1){
                                    for(int aux2 =1; aux2<listaImgProm.size(); aux2++){%>
                                <li data-target="#carousel<%= p.getNombre() %>" data-slide-to="<%= aux2 %>"></li>
                                <%  }
                                }%>
                            </ol>

                            <!-- Contenedor de la imagenes -->
                            <div class="carousel-inner" role="listbox">
                                <!-- La primera imagen queda fuera del "for" porque es la que se muestra en al principio, tiene la clase "active" -->
                                <div class="item active">
                                    <img  src="data:image/jpg;base64, <%=listaImgProm.get(0)%>" class="img-responsive center-block img-rounded" style="width: 100%">
                                </div>
                            <%if(listaImgProm.size()>1){
                                for(int aux2 =1; aux2<listaImgProm.size(); aux2++){ %>
                                <div class="item">
                                    <img  src="data:image/jpg;base64, <%=listaImgProm.get(aux2)%>" class="img-responsive center-block img-rounded" style="width: 100%">
                                </div>
                            <%  }
                            }%>
                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#carousel<%= p.getNombre() %>" role="button" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel<%= p.getNombre() %>" role="button" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                            </a>
                        </div>
                    
                    <%}else{%>
                    <div id="carousel<%= p.getNombre() %>" class="carousel slide" data-ride="carousel">
                            <!-- Indicadores -->
                            <ol class="carousel-indicators">
                                <!-- El primero imagen queda fuera del "for" porque indica la imagen a mostrar al principio, tiene la clase "active" -->
                                <li data-target="#carousel<%= p.getNombre() %>" data-slide-to="0" class="active"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <!-- La primera imagen queda fuera del "for" porque es la que se muestra en al principio, tiene la clase "active" -->
                                <div class="item active">
                                    <img src="/DispositivoMovil/Img/SinImagen.jpg" class="img-responsive center-block img-rounded" style="width: 100%">
                                </div>
                            </div>
                            <!-- Controles, derecha e izquierda -->
                            <a class="left carousel-control" href="#carousel<%= p.getNombre() %>" role="button" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel<%= p.getNombre() %>" role="button" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                            </a>
                    </div>                    
                    <%}%>
                    <h2><%= p.getNombre() %></h2>
                    <p class="text-justify"><%= primerS.getDescripcion() %></p>
                    <ul class="list-group" >
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h4>Descuento: %<%= Math.round(p.getPorcentaje()) %></h4>
                        </li>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            <h4>Total: $<%= Math.round(p.getTotal()) %></h4>
                        </li>
                        <li class="list-group-item" style="border-color: #337AB7; color:#337AB7">
                            
                            <ul class="list-group" >
                                <li class="list-group-item active" style="border-color: #337AB7;">
                                    <h4>Servicios</h4>
                                </li>
                                <%for(int aux2=0; aux2<p.getServicios().size(); aux2++){%>
                                <li class="list-group-item " style="border-color: #337AB7;">
                                    <%DataServicio s = wsp.seleccionarServicioAListar(p.getProveedor(), p.getServicios().get(aux2));%>
                                    <h4><%= p.getServicios().get(aux2) %>: $<%= Math.round(s.getPrecio()) %></h4>
                                </li>
                                <%}%>
                            </ul>
                        </li>
                    </ul>
                </li>
                <%}
            }%>
            </ul>
        </div>  
            
        <script src="/DispositivoMovil/JS/jQuery.js"></script>
        <script src="/DispositivoMovil/Bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
