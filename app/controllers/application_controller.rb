class ApplicationController < ActionController::Base

  

  #def after_sign_in_path_for(resource)
    #@user = current_user
     #UserMailer.welcome_email.deliver
 # end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :university_id) }
  end

end
