function mostrarOcultar(ul,tipo){
    
    var visible;
    var oculto;
    if(tipo === 'Servicios'){
        visible = 'servVisible';
        oculto = 'servOculto';
    }else{
        visible = 'promoVisible';
        oculto = 'promoOculta';
    }        
        
    //SI no hay ningun elemento(servicio/promocion) visible, entonces los muestra
    if(ul.getElementsByClassName("list-group-item "+visible).length === 0){
        ul.querySelector('li.botonVer>h4').innerHTML = tipo;
        ul.querySelector('li.botonVer').className = 'list-group-item active';
        //ul.querySelector('li.active').style.background = '#4290D3';
        //Lista de elementos, ocultos
        var so = ul.querySelectorAll('.'+oculto);
        [].forEach.call(so, function(li) {
            li.className = "list-group-item "+visible;
            li.style.display = "block";
        }); 
    }else{
        ul.querySelector('li.active>h4').innerHTML = 'Ver '+tipo;
        ul.querySelector('li.active').className = 'list-group-item botonVer';
        //ul.querySelector('li.active').style.background = '#337AB7';
        //Lista de elementos, visible
        var sv = ul.querySelectorAll('.'+visible);
        [].forEach.call(sv, function(li) {
            li.className = "list-group-item "+oculto;
            li.style.display = "none";
        }); 
    }
}
function facturar(o){
    var nroReserva = o.querySelector('[id="nroReserva"]');
    var cliente = o.querySelector('[id="cliente"]');
    var boton = o.querySelector('[id=boton]');
    console.log(nroReserva.value+" "+cliente.value);
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if(this.status===200 && this.readyState ===4){
            console.log(this);
            if(x.responseText==="true"){
                boton.style.display = "none";
            }else{
                console.log("error");
            }
        }
    };
    x.open("POST","ServletFactura", true);
    x.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    x.send("nroReserva="+nroReserva.value+"&cliente="+cliente.value); 
}

