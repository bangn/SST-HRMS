$.fn.editable.defaults.error = function(response, newValue) {
  var error_msgs, field_name;
  field_name = $(this).data("name");
  error_msgs = response.responseJSON.errors[field_name];
  return error_msgs.join("; ");
};