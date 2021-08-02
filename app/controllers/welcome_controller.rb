class WelcomeController < ApplicationController
  def index
    skip_authorization
  end
end
