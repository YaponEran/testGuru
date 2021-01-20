class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permited_parameters, if: :devise_controller?

  private
  def after_sign_in_path_for(user)
    stored_location_for(user)
    if user.admin?
      admin_tests_path
    else
      super
    end
  end

  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :password, :password_confirmation])
  end
end
