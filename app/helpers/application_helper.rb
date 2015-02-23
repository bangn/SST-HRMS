module ApplicationHelper
  def show_error_messages_if_any messages
    return "" if !messages or !messages.any?

    messages = messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div class="alert alert-danger" role="alert">
      <button class="pull-right closable">x</button>
      <strong> Something went wrong:</strong>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
  
  def show_notice_message_if_any message
    return "" if !message

    html = <<-HTML
    <div class="alert alert-success" role="alert">
      <button class="pull-right closable">x</button>
      #{message}
    </div>
    HTML

    html.html_safe
  end
  
  def edit_link_for resource
    case resource
    when User
      edit_admin_user_path(resource.id)
    when Team
      edit_admin_team_path(resource.id)
    when Job
      edit_admin_job_path(resource.id)
    end
  end
  
  def link_for resource
    case resource
    when User
      admin_user_path(resource.id)
    when Team
      admin_team_path(resource.id)
    when Job
      admin_job_path(resource.id)
    end
  end
end
