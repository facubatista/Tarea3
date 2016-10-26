function verificarProveedor(claveIngresada){

    var claveProv = claveIngresada.value;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function(){
        //Los status 200 y 4 indican que no hubo ningun problema
        if(this.status===200 && this.readyState ===4){
           //var json = JSON.parse(this.responseText);
           if(this.responseText === 'false' && claveProv.length!==0){
           //if(json.verificacion[0].respuesta === 'false'){
                document.getElementById("nickInvalido").style.display = 'block';
                document.getElementById("botonIngresar").style.display = 'none';
                document.getElementById("botonIngresarDis").style.display = 'block';
                return false;
           }else{
               document.getElementById("nickInvalido").style.display = 'none';
               document.getElementById("botonIngresar").style.display = 'block';
               document.getElementById("botonIngresarDis").style.display = 'none';
               return true;
            }
        }
        console.log(this);
    };
    request.open("POST","ServletSesion",true );
    request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    request.send("verificarProveedor="+claveProv);

}

function iniciarSesion(form){
    var password = form.querySelector("input[id=password]").value;
    //password = sha1(password);
    var nickname = form.querySelector("input[id=claveProveedor]").value;
    var request = new XMLHttpRequest();
    request.open("POST","ServletSesion",true );
    request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    request.send("verificarPassword="+password+"&proveedor="+nickname);
    request.onreadystatechange = function(){
        //console.log(this);
        if(this.status===200 && this.readyState ===4){
            if(this.responseText === 'passOK'){
                var request2 = new XMLHttpRequest();
                request2.open("POST","ServletSesion",true );
                request2.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                request2.send("claveProveedor="+nickname);
                request2.onreadystatechange = function(){
                    if(this.status===200 && this.readyState ===4){
                        window.location = "/DispositivoMovil/Vistas/Servicios.jsp";
                        return true;
                    }
                };
            }else{
                document.getElementById("passwordIncorrecta").style.display = 'block';
                document.getElementById("botonIngresar").style.display = 'none';
                document.getElementById("botonIngresarDis").style.display = 'block';
                return false;
            }
        }else
            return false;
    };    
}


function ocultarMensaje(nickOpass){
    if(nickOpass.id==='claveProveedor'){
        document.querySelector("label[id=nickInvalido]").style.display = 'none';
    }else{
        document.querySelector("label[id=passwordIncorrecta]").style.display = 'none';       
    }
    
    document.getElementById("botonIngresarDis").style.display = 'none';
    document.getElementById("botonIngresar").style.display = 'block';
    
    return false;
}