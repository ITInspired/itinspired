class UserMailer < ActionMailer::Base
  default from: "inspired.com"

  def welcome_email
  	#@user = user
  	#@url  = 'http://example.com/login'
    mail(:to => 'taras2358@gmail.com', :subject => "Registered")
  end
end
