class SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for(user)
    if user.admin?
      "/admin"
    else
      "/dashboard"
    end
  end
end
