module ApplicationHelper
  include Pagy::Frontend
  include Rails.application.routes.url_helpers

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert alert-danger',
      alert: 'alert alert-warning',
      notice: 'alert alert-info',
    }[flash_type.to_sym] || flash_type.to_s
  end
end
