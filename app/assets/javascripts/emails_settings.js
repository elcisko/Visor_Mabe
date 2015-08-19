$(function() {
  //checking image dimensions
  var _URL = window.URL || window.webkitURL;
  $("#email_setting_logo").change(function(e) {
    var file, img;
    
    if ((file = this.files[0])) {
        img = new Image();
        var valid = true;
        img.onload = function() {
            if(this.width > 130 && this.height > 70){
              $("#email_setting_logo").val("");
              $(".status-body").html("<h4>El archivo ingresado no cumple con las dimensiones indicadas</h4>");
              $("#modal-status").modal('show');
            }

        };
        img.onerror = function() {
            $(".status-body").html("<h4>El archivo ingresado no es válido</h4>");
            $("#modal-status").modal('show');
        };
        
        img.src = _URL.createObjectURL(file);
        

    }
  });

});