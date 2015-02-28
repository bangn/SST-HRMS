class MailPreview < MailView

  def welcome_to_strongtie
    @@user = User.new :email => "user@user.com", :password => "password", :password_confirmation => "password"
    UserMailer.welcome_to_strongtie @@user
  end
  
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(@@user, "faketoken")
  end

  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(@@user, "faketoken")
  end
  
  def unlock_instructions
    Devise::Mailer.unlock_instructions(@@user, "faketoken")
  end
end