class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
     UserMailer.welcome_email.deliver
    root_path
  end
end