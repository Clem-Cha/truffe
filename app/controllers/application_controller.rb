class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone_number, :description, :street, :city, :zipcode])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :phone_number, :description, :street, :city, :zipcode])
  end
end
