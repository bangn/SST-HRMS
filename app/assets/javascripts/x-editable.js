function enableXEditable() {
  return $("[data-xeditable=true]").each(function() {
    return $(this).editable({
      format: 'DD-MM-YYYY',    
      template: 'DD-MM-YYYY',    
      combodate: {
        minYear: 2000,
        maxYear: 2020,
      },
      ajaxOptions: {
        type: "PUT",
        dataType: "json"
      },
      params: function(params) {
        var railsParams;
        railsParams = {};
        railsParams[$(this).data("model")] = {};
        railsParams[$(this).data("model")][params.name] = params.value;
        return railsParams;
      }
    });
  });
}  
