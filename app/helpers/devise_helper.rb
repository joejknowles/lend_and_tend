module DeviseHelper

  #The below method adds bootstrap alert classes to devise login errors

  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger">
      #{messages}
    </div>
    HTML
    html.html_safe
  end
end