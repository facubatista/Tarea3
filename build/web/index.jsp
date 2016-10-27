<%-- 
    Document   : index
    Created on : 20/10/2016, 02:57:20 PM
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inicio</title>
        <link type="image/x-icon" rel="shortcut icon"  href="/DispositivoMovil/Img/IconoH4T.ico">
        <link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            
            <div class="form-signin" >
              <h2 class="form-signin-heading text-center">Iniciar Sesión</h2>
              <label id="nickInvalido" class="text-danger" hidden="">Nickname o email inválido</label>
              <input name="claveProveedor" id="claveProveedor" class="form-control" placeholder="Email o Nickname" required style="margin-bottom: 10px;"
                     onblur="verificarProveedor(this)" onfocus="ocultarMensaje(this)">
              <label id="passwordIncorrecta" class="text-danger" hidden="">Contraseña incorrecta</label>
              <input type="password" id="password" class="form-control" placeholder="Contraseña" required onfocus="ocultarMensaje(this)">
              <div class="checkbox">
                <label>
                  <input type="checkbox" value="remember-me"> Recordarme
                </label>
              </div>
              <button class="btn btn-lg btn-primary btn-block" id="botonIngresar" type="submit" style="display:none" onclick="return iniciarSesion(this.parentElement);">Ingresar</button>
              <button class="btn btn-lg btn-warning btn-block" id="botonIngresarDis" disabled="" value="Ingresar" type="submit">Ingresar</button>
            </div>

        </div>
        
        <!--container es como la clase principal que usabamos-->
        <!--<div class="container" >
            <!--
            col=columna 
            xs,sm,md,lg indican el tamaño de la pantalla(extra small,samall, medium, large)
            el numero indica la cantidad de columnas que tendra en ese tamaño 
            -->
            <!--<div class="col-xs-12 col-sm-8 col-md-9 col-lg-9" style="background: green; color: white">
                <p>Bienvenido</p>
                <button class="btn btn-primary">Boton</button>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3" style="background: blue">
                <p>
                    Otro div
                </p>
            </div>-->
        <!--</div>-->
        
        <script src="JS/jQuery.js"></script>
        <script src="Bootstrap/js/bootstrap.min.js"></script>
        <script src="JS/Sesion.js"></script>
    </body>
</html>
