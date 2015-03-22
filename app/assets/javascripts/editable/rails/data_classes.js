jQuery(function($) {
  return $("[data-classes]").on("save", function(e, data) {
    var class_name, css, element, key, value;
    value = data.newValue;
    element = $(this);
    css = element.data('classes') || {};
    for (key in css) {
      class_name = css[key];
      element.removeClass(class_name);
    }
    element.addClass(css[value]);
    return element.css('background-color', '');
  });
});