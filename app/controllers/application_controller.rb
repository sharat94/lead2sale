class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   rescue_from CanCan::AccessDenied do 
    redirect_to root_path, alert: "You are not allowed to access this page"
  end
  before_filter do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
  end
 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name,:phone,:role_id])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:full_name,:phone,:role_id])

  end

end