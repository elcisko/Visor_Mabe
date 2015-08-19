/**
 * Created by froche on 07/07/15.
 */
$(function() {


    $(".detalle_transacc").click(function(){
        var id = $(this).attr('href');
        $( ".modal-body.transaccion" ).load( "/transaccions/detalle/" + id);
        $("#modal-detalle-transaccion").modal('show');
        return false;
    });


    $("#bt_plus_filter").click(function(){
        $("#filtros").toggle();
    });

    if($(".total_transaccion").html() == 0){
        $("#filtros").hide();
    }else{
        $("#filtros").show();
    }

    $("#btn_search").click(function(){

        if($("#cantidad").val() > 1000){
            alert("No puede realizar busquedas superiores a 1000 registros");
            return false;
        }else{
            $("#btn_search").trigger("click");
        }
    });

    $(".sort").click(function(){
        $("#sort_column").val($(this).attr('href'));
        $("#search-form").submit();
        return false;
    });

});

function detalle_payload(id){
    $(".modal-body.payload").load("/transaccions/payload/" + id);
    $("#modal-detalle-payload").modal('show');
    return false;
}