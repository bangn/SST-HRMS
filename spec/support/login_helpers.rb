module LoginHelpers
  def sign_in(user)
    session[:user_id] = user.id
  end
end
RSpec.configuration.include LoginHelpers, type: :controller

module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'SIGN IN'
  end
end
RSpec.configuration.include AuthenticationHelpers, type: :feature
