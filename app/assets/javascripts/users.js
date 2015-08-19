/**
 * Created by froche on 07/07/15.
 */
$(function() {


    $(".detalle_usuario").click(function(){
        var id = $(this).attr('href');
        $( ".modal-body.usuario" ).load( "/users/" + id);
        $("#modal-detalle-usuario").modal('show');
        return false;
    });

});