$.fn.numericInputExample = function () {
  'use strict';
  var element = $(this);

    element.find('td').on('change', function (evt) {
      var cell = $(this),
          column = cell.index(),
          total = 0;
      if (column === 0 || column === 1 || column === 3) {
        return;
      }   
      
  }).on('validate', function (evt, value) {
    var cell = $(this),
    column = cell.index();
    if (column === 2) {
      var id = element.find('td:eq(0)').text();
      var current = parseFloat(element.find('td:eq(4)').text());
      if(!isNaN(parseFloat(value)) && isFinite(value)){
        if(current > parseFloat(value)){
          $("#"+id).val(id+"-"+value);
        }else{
          $("#"+id).val(id);
        }
        return true;  
      }else{
        $("#"+id).val(id);
        return false;
      }
      
      //return !isNaN(parseFloat(value)) && isFinite(value) && current >= parseFloat(value);
    }else{
      return false;
    }
  });
  return this;
};
