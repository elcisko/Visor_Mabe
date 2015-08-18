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


    $('#society_id').selectMultiple();

    //sociedades configuradas en el usuario
    var separadas = $("#asignadas").val().split("*");

    if (separadas != ""){

        $.each(separadas, function(index, value){

            var asig = this.trim();// nombre de la sociedad

            var flag=0 //bandera para habilitar el check asociado a la sociedad

            $("ul li.ms-elem-selectable span").map(function(){

                var sp = $(this).html();

                if( flag==1){
                    $(this).attr("style", "display:inline;");
                    flag=0;
                }

                if(sp==asig){
                    flag=1;
                }
            });
            //#$("."+this).addClass("ms-selected");
        });
    }

    $('#all_socs').click(function(){

        if($("#all_socs").is(':checked')){
            $('#society_id').selectMultiple('select_all');
        }else{
            $('#society_id').selectMultiple('deselect_all');
        }
    });

    /*
    $('#all_docs').click(function(){

        if($("#all_docs").is(':checked')){
            $('#type_document_id').selectMultiple('select_all');
        }else{
            $('#type_document_id').selectMultiple('deselect_all');
        }
    });
    */
});