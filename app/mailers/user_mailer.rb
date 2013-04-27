class UserMailer < ActionMailer::Base
  default from: "no-reply@elusiveindex.com"

  def reset_password(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Reset my password on Elusive Index")
  end
end
