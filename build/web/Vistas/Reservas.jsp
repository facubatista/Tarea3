<%-- 
    Document   : Reservas
    Created on : 25/10/2016, 02:00:41 PM
    Author     : Kevin
--%>

<%@page import="webservices.DataReserva"%>
<%@page import="webservices.DataReservas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <h3>No se encontraron reservas</h3>
                </li>
                <%}else{
                    for(int i=0; i < reservas.getReservas().size(); i++){
                        DataReserva r = reservas.getReservas().get(i);            
                %>
                <div class="panel panel-primary">
                    <div class="panel-heading clearfix">
                        <h4 class="pull-left">Reserva: #<%= r.getNumero() %>, Cliente: <%= r.getCliente() %></h4>
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
                </div>--%>
            </div>
        </div>
        
        <script src="/DispositivoMovil/JS/jQuery.js"></script>
        <script src="/DispositivoMovil/Bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
