module ApplicationHelper
  def flash_messages
    return "" if !flash[:error]

    messages = [flash[:error]].map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger" role="alert">
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
