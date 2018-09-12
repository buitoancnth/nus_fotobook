class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected
  def after_sign_in_path_for(resource)
    if resource.is_admin?
      admin_root_path
    else
      root_path
    end
  end

  def admin_user
    unless current_user.is_admin?
      flash[:danger] = t('messages.not_admin')
      redirect_to root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :avatar) }
  end
end
