<%-- 
    Document   : Prueba
    Created on : 22/10/2016, 11:34:18 PM
    Author     : Kevin
--%>

                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicadores -->
                            <ol class="carousel-indicators">
                                <!-- El primero imagen queda fuera del "for" porque indica la imagen a mostrar al principio, tiene la clase "active" -->
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <%if(s.getImagenes().size()>0){
                                    for(int aux =1; aux<s.getImagenes().size(); aux++){%>
                                <li data-target="#myCarousel" data-slide-to="<%= aux %>"></li>
                                <%  }
                                }%>
                            </ol>

                            <!-- Contenedor de la imagenes -->
                            <div class="carousel-inner" role="listbox">
                                <!-- La primera imagen queda fuera del "for" porque es la que se muestra en al principio, tiene la clase "active" -->
                                <div class="item active">
                                    <img  src="data:image/jpg;base64, <%=imagenes[0]%>" class="img-responsive center-block img-rounded" style="width: 50%">
                                </div>
                            <%if(imagenes.length>0){
                                for(int aux =1; aux<s.getImagenes().size(); aux++){ %>
                                <div class="item">
                                    <img  src="data:image/jpg;base64, <%=imagenes[aux]%>" class="img-responsive center-block img-rounded" style="width: 50%">
                                </div>
                            <%  }
                            }%>
                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                            </a>
                        </div>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/Layout.css">
        <link rel="stylesheet" href="../CSS/Prueba.css">
    </head>
    <body>
        <!--container es como la clase principal que usabamos-->
        <div class="principal" >
            <!--
            col=columna 
            xs,sm,md,lg indican el tamaño de la pantalla(extra small,samall, medium, large)
            el numero indica la cantidad de columnas que tendra en ese tamaño 
            -->
            <div class="nueve columnas responsive">
                <p>Bienvenido</p>
            </div>
            <div class="tres columnas responsive">
                <p>
                    Otro div
                </p>
            </div>
        </div>
    </body>
</html>
