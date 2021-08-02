module CompaniesHelper
  def company_error_messages!
    return '' if @company.errors.empty?

    messages = @company.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger alert-block"> <button type="button"
    class="btn-close float-end" data-dismiss="alert"></button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
