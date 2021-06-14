class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role]) 
    #devise_parameter_sanitizer.for(:sign_up) << :name
    #devise_parameter_sanitizer.for(:sign_up) << :role
    end 

  def check_role
    if current_user.role == "Seller"
      redirect_to root_path
    end
  end

end
