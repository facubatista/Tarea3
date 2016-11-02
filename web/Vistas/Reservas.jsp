<%if(session.getAttribute("nickProveedor")==null){//Si no se inicio sesion, redirecciona a al servlet para verificar cookie de sesion
    response.sendRedirect("../ServletSesion?index");
}else{%>
<%@page import="java.util.List"%>
<%@page import="webservices.DtRP"%>
<%@page import="webservices.DtRS"%>
<%@page import="webservices.DataRsRp"%>
<%@page import="webservices.DataPromocion"%>
<%@page import="webservices.DataServicio"%>
<%@page import="webservices.WSProveedores"%>
<%@page import="webservices.DataReserva"%>
<%@page import="webservices.DataReservas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Reservas</title>
        <link type="image/x-icon" rel="shortcut icon" href="/DispositivoMovil/Img/IconoH4T.ico">
        <link rel="stylesheet" href="/DispositivoMovil/Bootstrap/css/bootstrap.min.css">
    </head>
    <body style="padding-top: 65px">
        <jsp:include page="Cabecera.jsp?active=Reservas" />
        <div class="container" >
            <%
            DataReservas reservas = (DataReservas)session.getAttribute("reservasDeP"); 
            %>
            <div class="panel-group">
                <%            
                if(reservas!=null && reservas.getReservas().size()==0){
                %>
                <li class="list-group-item">
                    <h4>No se encontraron reservas</h4>
                </li>
                <%}else{
                    for(int i=0; i < reservas.getReservas().size(); i++){
                        DataReserva r = reservas.getReservas().get(i);

                        WSProveedores wsp = (WSProveedores) request.getAttribute("webServiceP");
                        DataRsRp SyP = wsp.traerRsRp( r.getNumero(), r.getCliente());
                        List<DtRP> promosDeR = SyP.getPromociones();
                        List<DtRS> serviciosDeR = SyP.getServicios();
                %>
                <div class="panel panel-primary">
                    <div class="panel-heading clearfix">
                        <h4 class="pull-left">Reserva #<%= r.getNumero() %></h4>
                        <%if(r.getEstado().equals("Pagada")){%>
                        <button type="button" class="btn btn-primary pull-right">Facturar</button>
                        <%}%>
                    </div>
                    <div class="panel-body">
                        <ul class="list-group" >
                            <li class="list-group-item" style="border-color: #337AB7;">
                                <h4>Cliente: <%= r.getCliente() %></h4>
                            </li>
                            <li class="list-group-item" style="border-color: #337AB7;">
                                <h4>Estado: <%= r.getEstado() %></h4>
                            </li>
                            <li class="list-group-item" style="border-color: #337AB7;">
                                <h4>Fecha de creación: <%= r.getFechaCreacion() %></h4>
                            </li>
                            <li class="list-group-item" style="border-color: #337AB7;">
                                <h4>Total: $<%= Math.round(r.getPrecioTotal()) %></h4>
                            </li>
                            <% if(serviciosDeR.size()>0){ %>
                            <li class="list-group-item" style="border-color: #337AB7;">                                
                                <ul class="list-group" style="color: #337AB7">
                                    <li class="list-group-item botonVer" onclick="mostrarOcultar(this.parentElement, 'Servicios')" 
                                        role="button" style="border-color: #337AB7;">
                                        <h4>Ver Servicios</h4>
                                    </li>
                                    <% for(int aux=0; aux < serviciosDeR.size(); aux++ ){ %>
                                    <%
                                        DtRS sr = serviciosDeR.get(aux);
                                        DataServicio s = wsp.seleccionarServicioAListar( (String)session.getAttribute("nickProveedor") , sr.getServicio());
                                    %>
                                    <li class="list-group-item servOculto" style="border-color: #337AB7; display:none">
                                        <h4><%= sr.getServicio() %>: $<%= Math.round(s.getPrecio()) %> x <%= sr.getCantidad() %></h4>
                                    </li>
                                    <%}%>
                                </ul>                              
                            </li>
                            <%}%>  
                            <% if(promosDeR.size()>0){ %>
                            <li class="list-group-item" style="border-color: #337AB7;">
                                <ul class="list-group" style="color: #337AB7">
                                    <li class="list-group-item botonVer" onclick="mostrarOcultar(this.parentElement,'Promociones')" 
                                        role="button" style="border-color: #337AB7;">
                                        <h4>Ver Promociones</h4>
                                    </li>
                                    <% for(int aux=0; aux< promosDeR.size(); aux++ ){ %>
                                    <%
                                    DtRP pr = promosDeR.get(aux);
                                    DataPromocion p = wsp.seleccionarPromocionAListar( (String)session.getAttribute("nickProveedor") , pr.getPromocion());
                                    
                                    %>
                                    <li class="list-group-item promoOculta" style="border-color: #337AB7;display:none">
                                        <h4><%= pr.getPromocion() %>: $<%= Math.round(p.getTotal()) %> x <%= pr.getCantidad() %></h4>
                                    </li>
                                    <%}%>
                                </ul>
                            </li>
                            <%}%>
                            
                        </ul>
                    </div>
                </div>
                <%  }
                }%>        
                <%--<div class="panel panel-primary">
                    <div class="panel-heading clearfix">
                        <h4 class="pull-left">Reserva 2</h4>
                        <button class="btn btn-primary pull-right">Facturar</button>
                    </div>
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <h4>Servicio</h4>
                            </li>
                            <li class="list-group-item">
                                <h4>Servicio2</h4>
                            </li>
                            <li class="list-group-item">
                                <h4>Servicio3</h4>
                            </li>
                            <li class="list-group-item">
                                <h4>Servicio4</h4>
                            </li>
                        </ul>   
                    </div>
                </div>--%>
            </div>
        </div>
        
        <script src="/DispositivoMovil/JS/jQuery.js"></script>
        <script src="/DispositivoMovil/Bootstrap/js/bootstrap.min.js"></script>
        <script src="/DispositivoMovil/JS/javascript.js"></script>
    </body>
</html>
<%}%>