class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :company_branding

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotDefinedError, with: :user_not_authorized unless Rails.env.development?
  after_action :verify_authorized, unless: :devise_controller?
  after_action -> { flash.clear }, if: -> { request.xhr? }

  private

  def company_branding
    @company_branding = Company.first
  end

  def user_not_authorized(object)
    flash[:error] = 'You are not authorized to perform this action.'
    puts "Error: #{object}"
    redirect_to(request.referer || root_path)
  end

  def configure_permitted_parameters
    attributes = [:name, :role]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
