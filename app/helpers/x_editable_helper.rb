module XEditableHelper
  DEFAULT_CONTAINER = :span
  def x_editable(object, field, opts = {})
    options = {}
    object.kind_of?(Array) ? model = object.last : model = object
    options[:data] = HashWithIndifferentAccess.new(opts[:data])
    options[:data]['xeditable'] = true
    options[:data]['pk'] = model.send(:id)
    options[:data]['model'] = model.class.to_s.downcase
    options[:data]['name'] = field.to_s
    options[:data]['url'] = "#{polymorphic_path (object), format: :json}"
    options[:data]['type'] = opts[:as] if opts[:as]
    options[:data]['title'] = opts[:title] if opts[:title]
    options[:data]['source'] = opts[:source] if opts[:source]
    opts[:display_as] ? display_value = opts[:display_as] : display_value = model.send(field)
    container = opts[:container] || DEFAULT_CONTAINER
    content_tag(container, display_value, options)
  end
end
