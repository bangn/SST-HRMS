module LoginHelpers
  def sign_in(user)
    session[:user_id] = user.id
  end
end
RSpec.configuration.include LoginHelpers, type: :controller
