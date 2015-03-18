function enableXEditable() {
  return $("[data-xeditable=true]").each(function() {
    return $(this).editable({
      date: {
        format: 'DD-MM-YYYY',
        viewformat: 'DD-MM-YYYY',
        datepicker: {
             weekStart: 1
        }
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
