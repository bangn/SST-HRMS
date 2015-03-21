module XEditableHelper
  DEFAULT_CONTAINER = :span
  def x_editable(object, field, opts = {})
    options = {}
    object.kind_of?(Array) ? model = object.last : model = object
    options[:class] = "editable editable-click"
    options[:data] = HashWithIndifferentAccess.new(opts[:data])
    options[:data]['pk'] = model.send(:id)
    options[:data]['model'] = model.class.to_s.downcase
    options[:data]['name'] = field.to_s
    options[:data]['url'] = opts[:url] ? opts[:url] : "#{url_for (object)}"
    options[:data]['type'] = opts[:as] if opts[:as]
    options[:data]['title'] = opts[:title] if opts[:title]
    options[:data]['source'] = opts[:source] if opts[:source]
    opts[:display_as] ? display_value = opts[:display_as] : display_value = model.send(field)
    container = opts[:container] || DEFAULT_CONTAINER
    content_tag(container, display_value, options)
  end

  def to_data_source(array)
    array.map {|element| {value: element, text: element}}.to_json
  end
end
