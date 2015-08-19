$(function() {

    /*
    $('#signup_request').on("click", ".pagination a", function() {
        $.getScript(this.href);
        return false;
    });

    $("#btn_search").click(function() {
        $.get($("#provider_search").attr("action"), $("#provider_search").serialize(), null, "script");
        return false;
    });

    $('#update_request').on("click", ".pagination a", function() {
        $.getScript(this.href);
        return false;
    });

    $("#btn_search_u").click(function() {
        $.get($("#provider_search_u").attr("action"), $("#provider_search_u").serialize(), null, "script");
        return false;
    });
/*
    $("#form-approve-r").ajaxForm({
            type: 'post',
            dataType: 'json',
            clearForm: false,
            beforeSubmit: function(arr, $form, options) {
                $("#btn-approve-r").attr('disabled', 'disabled');
                $("#btn-reject-r").attr('disabled', 'disabled');
            },
            success: function(response) {
                
                $(".notification").html("<h4>"+ response.message +"</h4>");
                $("#modal-notification").modal('show');
                if(!response.success){
                    $("#btn-approve-r").removeAttr('disabled');
                    $("#btn-reject-r").removeAttr('disabled');
                }
            },
            error: function() {
                $(".notification").html("<h4>Ha ocurrido un error inesperado. Intente de nuevo</h4>");
                $("#modal-notification").modal('show');
            }
        });

        $("#form-reject-r").ajaxForm({
            type: 'post',
            dataType: 'json',
            clearForm: false,
            beforeSubmit: function(arr, $form, options) {
                $("#btn-approve-r").attr('disabled', 'disabled');
                $("#btn-reject-r").attr('disabled', 'disabled');
            },
            success: function(response) {
                
                $(".notification").html("<h4>"+ response.message +"</h4>");
                $("#modal-notification").modal('show');
                
                if(!response.success){
                    $("#btn-approve-r").removeAttr('disabled');
                    $("#btn-reject-r").removeAttr('disabled');
                }
            },
            error: function() {
                $(".notification").html("<h4>Ha ocurrido un error inesperado. Intente de nuevo</h4>");
                $("#modal-notification").modal('show');
            }
        });


        $("#btn-approve-r").click(function(){
            $("#modal-group").modal('show');
        });

        $("#btn-reject-r").click(function(){
            if($("#observation").val()!=''){
                $("#form-reject-r").submit();
                $(".notification").html("<h5><span class='text-danger'>Procesando no refresque o salga de esta pagina</span></h5>");
                $('#modal-notification').modal({
                    show: true,
                    keyboard: false,
                    backdrop: 'static'
                });
            }else{
                $(".notification").html("<h4>Debe indicar una observacion como motivo de rechazo</h4>");
                $("#modal-notification").modal('show');
            }
        });

        $("#add-group").click(function(){
            if($("#group_account").val()!=''){
                $("#gaccount").val($("#group_account").val());
                $("#form-approve-r").submit();
                $("#modal-group").modal('hide');
                $(".notification").html("<h5><span class='text-danger'>Procesando no refresque o salga de esta pagina</span></h5>");
                $('#modal-notification').modal({
                    show: true,
                    keyboard: false,
                    backdrop: 'static'
                });
            }
            return false;
        });
        */
});