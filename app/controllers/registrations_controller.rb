# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]

  def new
    authorize(:registration, :new?)
    super
  end

  def create
    authorize(:registration, :new?)
    super
  end

  def sign_up(resource_name, resource) end
end
