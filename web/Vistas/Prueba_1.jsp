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
