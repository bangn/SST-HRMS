module LoginHelpers
  def sign_in(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "SIGN IN"
  end
end
RSpec.configuration.include LoginHelpers, type: [:controller, :feature]
