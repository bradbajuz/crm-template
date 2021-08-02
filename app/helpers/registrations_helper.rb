module RegistrationsHelper
  def registration_error_messages!
    return '' if @user.errors.empty?

    messages = @user.errors.full_messages.map { |msg| content_tag(:list_group_item, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger alert-block"> <button type="button"
    class="btn-close float-end" data-dismiss="alert"></button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
