function enableXEditable() {
  return $(".editable").each(function() {
    return $(this).editable({
      combodate: {
        format: 'DD-MM-YYYY',
        viewformat: 'DD-MM-YYYY',
        template: 'D/MMM/YYYY',
        minYear: 2010,
        maxYear: 2050
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
