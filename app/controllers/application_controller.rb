class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permited_parameters, if: :devise_controller?

  private
  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :password, :password_confirmation])
  end
end
