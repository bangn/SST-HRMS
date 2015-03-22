jQuery(function($) {
  var EditableForm;
  EditableForm = $.fn.editableform.Constructor;
  EditableForm.prototype.saveWithUrlHook = function(value) {
    var model, nestedId, nestedLocale, nestedName, originalUrl;
    originalUrl = this.options.url;
    model = this.options.model;
    nestedName = this.options.nested;
    nestedId = this.options.nid;
    nestedLocale = this.options.locale;
    this.options.url = (function(_this) {
      return function(params) {
        var myName, myValue, nested, obj;
        if (typeof originalUrl === 'function') {
          return originalUrl.call(_this.options.scope, params);
        } else if ((originalUrl != null) && _this.options.send !== 'never') {
          myName = params.name;
          myValue = params.value;
          if (Object.prototype.toString.call(params.value) === '[object Array]' && params.value.length === 0) {
            params.value.push("");
          }
          obj = {};
          if (nestedName) {
            nested = {};
            nested[myName] = myValue;
            nested['id'] = nestedId;
            if (nestedLocale) {
              nested['locale'] = nestedLocale;
            }
            obj[nestedName + '_attributes'] = nested;
          } else {
            obj[myName] = myValue;
          }
          params[model] = obj;
          delete params.name;
          delete params.value;
          delete params.pk;
          return $.ajax($.extend({
            url: originalUrl,
            data: params,
            type: 'PUT',
            dataType: 'json'
          }, _this.options.ajaxOptions));
        }
      };
    })(this);
    return this.saveWithoutUrlHook(value);
  };
  EditableForm.prototype.saveWithoutUrlHook = EditableForm.prototype.save;
  return EditableForm.prototype.save = EditableForm.prototype.saveWithUrlHook;
});
