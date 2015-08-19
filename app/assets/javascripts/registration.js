$(function() {
    $("#provider_requirements").hide();

    $("#user_provider_type_id").change(function(){
        var value = $(this).val();
        if(value!=''){
            $.ajax({
                type: 'GET',
                url: '/provider_type/'+ value +'/requirements',
                dataType: 'json',
                success: function (data) {
                    var html = "";
                    $.each(data.requirements, function(index, e) {
                        var id_file = "r_" + e.id;
                        html += '<div class="list-group-item">';
                        html += '<div class="form-group no-margin-hr">';
                        html += '<label>'+ e.name +'</label>';
                        html += '<input id="'+ id_file +'" type="file" required="required" name="'+ id_file +'">';
                        html += '</div></div>';

                    });
                    $("#provider_requirements_contents").html(html);
                    $("#provider_requirements").show();
                }

            });
        }else{
            var msg = '<div class="alert alert-danger" style="text-align: center;">Elija un tipo de proveedor</div>';
            $("#provider_requirements_contents").html(msg);
            $("#provider_requirements").show();
        }
        return false;
    });

});