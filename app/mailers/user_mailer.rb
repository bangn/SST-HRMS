class UserMailer < ActionMailer::Base
  default from: "strongtie.vn@gmail.com"
  
  def welcome_to_strongtie(user)
    @user = user
    @url = new_user_session_path
    
    mail(:to => @user.email, :subject => "Welcome to Simpson StrongTie Vietnam!")
  end
end