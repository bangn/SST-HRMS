class MailPreview < MailView
  def welcome_to_strongtie
    user = User.new :email => "user@user.com", :password => "password", :password_confirmation => "password"
    UserMailer.welcome_to_strongtie user
  end
end