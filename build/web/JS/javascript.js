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
        ul.querySelector('li.active>h4').innerHTML = tipo;
        //Lista de elementos, ocultos
        var so = ul.querySelectorAll('.'+oculto);
        [].forEach.call(so, function(li) {
            li.className = "list-group-item "+visible;
            li.style.display = "block";
        }); 
    }else{
        ul.querySelector('li.active>h4').innerHTML = 'Ver '+tipo;
        //Lista de elementos, visible
        var sv = ul.querySelectorAll('.'+visible);
        [].forEach.call(sv, function(li) {
            li.className = "list-group-item "+oculto;
            li.style.display = "none";
        }); 
    }
}

